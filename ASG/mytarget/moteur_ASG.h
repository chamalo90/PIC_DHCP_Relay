//moteur_ASg.h apr!s avoir migr� les donn�es vers la ROM

// ********************************************************************* //
// Macros permettant de clearer ou de setter des bits dans des variables //
// ********************************************************************* //
#define bitset(var,bitno) ((var) |=1 << (bitno))
#define bitclr(var,bitno) ((var) &= ~(1 << (bitno)))

// ************************************ //
// d�finitions des structures utilis�es //
// ************************************ //

//struct etatStruct;
typedef struct etatStruct etat;
typedef struct transitionStruct transition;
typedef struct ressourceStruct ressource;
typedef struct etatStructVolatile etatvolatile;

// ************************** //
// Structure d'une transition //
// ************************** //
struct transitionStruct {
#ifdef EVENEMENT
	// Identificateur de l'�v�nement associ� � la transition
	unsigned char evt1;
#endif
#ifdef RENDEZ_VOUS
	// Identificateur du rendez-vous associ� � la transition
	unsigned char rdv1;
#endif
	// Pointeur vers l'�tat dans lequel aboutit la transition
	rom etat* next_state;
};

#ifdef RESSOURCE
// ************************* //
// Structure d'une ressource //
// ************************* //
struct ressourceStruct {
	// Identificateur de la ressource
	unsigned char ressourceId;
	// Nombre de ressource utilis�e.
	unsigned char ressourceQty;
};
#endif

// ******************* //
// Structure d'un �tat //
// ******************* //

struct etatStruct {

  // Pointeur vers l'�tat p�re de cet �tat.
  const rom etat* father;

  // nombre de composantes de cet �tat et N� de la composante du p�re
  //concat�n�s dans deux nibbles
  unsigned char composantes;

#ifdef RENDEZ_VOUS	
  // pointeur vers la liste des rendez-vous
  const rom char* const rom *rdvs;
#endif

  // pointeur vers la liste des transitions
  const rom transition* rom *trans;
  
  //nombre de rendez-vous + nombre de transitions
  //concat�n�s dans deux nibbles
  unsigned char nb_rdvs_trans;
  

  // pointeur vers l'action
  void (*action)(void);

  //ATTENTION, faut s'arranger pour placer ce tableau en RAM!
  // pointeur vers la structure des �tats actifs
  const rom etat* ram* rom etatsActifs;

#ifdef RESSOURCE
  // pointeur vers la liste de ressources utilis�es.
  const rom ressource* rom *ressources;
  // nombre de ressources utilis�es
  unsigned char nbRess;
#endif

#ifdef TIMEOUT
  // timeout
  unsigned char timeout;
#endif
	//RDL partie modifiable de l'�tat  
	ram etatvolatile* rom volatiledata;
};

//////////////////////////////////////////////////////////////////////////////:
struct etatStructVolatile{
  // status (acti-passif) + MinVT
  unsigned char minvt;
  // status (action) + Tps restant pour le minvt
  unsigned char time_minvt;  
#ifdef TIMEOUT
  // Tps restant pour le timeout
  unsigned char time_timeout;
#endif
  //donn�es utilis�es par l'interpr�teur 
  //pour son parcours des �tats
  unsigned char nbChildrenVisited;
  unsigned char childrenVisited;
  char a;
};

// ********** //
// Moteur ASG //
// ********** //

/*
 * Proc�dure mettant � jour les �v�nements du diagramme ASG.
 *
 * Cette proc�dure, g�n�r�e par le g�n�rateur de code, se charge de mettre �
 * jour l'ensemble des �v�nements du graphe ASG � l'exception des �v�nements
 * de type timeout.
 * 
 */

#ifdef EVENEMENT
void updateEvents(void);
#endif

/* 
 * Proc�dure permettant d'activer un �tat  
 * 
 * Cette proc�dure n'active que l'�tat s�lectionn�. C'est lorsque l'action
 * associ�e sera ex�cut�e que les sous-�tats seront activ�s.
 *
 * Il n'y a par contre pas besoin de reinitialiser la liste des etats
 * actives de cet etat. Ca a du etre fait a l'initialisation et lorsque l'etat
 * a ete desactive.
 *
 * Elle se charge en outre de mettre a jour les informations de ressource.
 * Elle ne se charge pas de verifier que ces derni�res sont disponnibles en
 * suffisance.
 *
 * Elle ne se charge par contre des rendez-vous que s'il n'y a pas d'action.
 * En effet, le rendez-vous ne peut �tre d�tect� que si l'action a �t�
 * ex�cut�e. Une transition normale � laquelle a �t� associ�e un rendez-vous
 * ne peut �tre franchie que si les �tats qui d�clarent le rendez-vous ont eu
 * leur rendez-vous ex�cut�.
 *
 * C'est elle qui s'ajoute dans la liste des �tats actifs de son p�re. 
 *
 * Dans le cas particulier ou aucune action n'est associ�e a l'�tat, ce
 * dernier est initialis� en supposant l'action effectu�e.
 */
 
void activateState(const rom etat* state);

/*
 * Procedure permettant de desactiver un etat.
 * 
 * Pour chacun de ces etats, elle se charge de liberer les ressources et
 * rendez-vous utilises. 
 *
 * Elle se charge aussi de reinitialiser la liste des etats actives dans
 * chaque etat du sous-graphe. Ceci permettra de reactiver un sous-graphe
 * complet sans se soucier de reinitialiser cette liste.
 *
 * Enfin, elle se charge, le cas �ch�ant, de mettre � faux l'�v�nement
 * timeout de l'�tat (s'il y en a un).
 *
 */
void desactivateState(const rom etat* state);

/*
 * Simule la lib�ration d'un �tat en calculant le nombre de ressources que ca
 * lib�rerait. 
 * 
 * Le resultat de cette simulation est fourni en mettant a jour le tableau
 * freedRessources
 */
#ifdef RESSOURCE
void simulateDesactivateState(const rom etat* state);
#endif
/*
 * Cette proc�dure effectue l'ensemble des transitions qui peuvent �tre
 * franchies dans le graphe.
 *
 * Une transition ne peut �tre franchie que si l'action associ�e � l'�tat a
 * �t� ex�cut�e (s'il n'y a pas d'action associ�e � l'�tat, ce dernier est
 * initialis� comme s'il avait effectu� l'action).
 * 
 * Cet algorithme parcour le graphe en effectuant un EulerTour. A chaque fois
 * qu'une transition est franchie, il recommence l'EulerTour � l'�tat o� la
 * transition aboutit.
 *
 * Il ne parcourt les fils d'un �tat que si l'action de l'�tat a �t�
 * effectu�e. r�alis�es dans le graphe ASG. Pour se faire, il effectue un
 * EulerTour. 
 */
void processTransitions(void);

/*
 * Cette proc�dure effectue l'ensemble des actions qui peuvent �tre r�alis�es.
 *
 * Comme, lorsqu'il arrive dans un �tat, il en effectue l'action, il peut tout
 * de suite apr�s, acc�der aux fils actifs de l'�tat. En effet, c'est l'action
 * qui initialise les fils de l'�tat.
 *
 * A chaque action ex�cut�e, si le minvt est �chu, les rendez-vous de l'�tat
 * sont mis � jour. 
 *
 * Entre chaque action � effectuer, le syst�me met � jour les timeouts.
 */
void processActions(void);

/*
 * C'est la fonction principale du moteur. 
 * 
 * Elle initialise l'�tat principal du graphe ainsi que le timer utilis� pour
 * les timeouts. Ensuite, elle effectue en
 * boucle les fonctions processTransitions et processActions.
 */
void processGraph(void);

/*
 * M�thode permettant de mettre � jour les minvt et les timeout de tous les
 * �tats actifs lorsqu'une unit� de temps s'est �coul�e. 
 * 
 * Lorsqu'un minvt que l'on vient de d�croitre arrive � z�ro, si l'action de
 * l'�tat correspondant a d�j� �t� ex�cut�e, alors, les rendez-vous sont mis �
 * jour.
 *
 * Lorsqu'un timeout est atteint, l'�v�nement associ� est consid�r� comme
 * vrai.
 */
#ifdef MINVT_OR_TIMEOUT
void updateTimes(void);
void initTimer(void);
int testTime(void);
#endif
