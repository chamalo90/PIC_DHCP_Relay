//moteur_ASG.c apr�s avoir migr� les donn�es vers la ROM

#include <p18f452.h>

/* Set configuration bits for use with ICD2 / PICDEM2 PLUS Demo Board:
 *  - set HS oscillator
 *  - disable watchdog timer
 *  - disable low voltage programming
 */ 
#pragma romdata CONFIG
_CONFIG_DECL(_CONFIG1H_DEFAULT & _OSC_HS_1H,\
             _CONFIG2L_DEFAULT,\
             _CONFIG2H_DEFAULT & _WDT_OFF_2H,\
             _CONFIG3H_DEFAULT,\
             _CONFIG4L_DEFAULT & _LVP_OFF_4L,\
             _CONFIG5L_DEFAULT,\
             _CONFIG5H_DEFAULT,\
             _CONFIG6L_DEFAULT,\
             _CONFIG6H_DEFAULT,\
             _CONFIG7L_DEFAULT,\
             _CONFIG7H_DEFAULT);
#pragma romdata


int level;
int current_level;
int orderLevel;

void main2 (void);

void main(void){
	main2();
}

#include "tables.h"
//#include "moteur_ASG.h"

void main2 (void){
	processGraph();
} 

void activateState(const rom etat* state) {
	// d�finition des variables qui seront utilis�es dans la proc�dure
	unsigned char prov1;
	unsigned char prov2;
	// On s'occupe de mettre � jour le p�re de l'�tat :
	prov1 = ((state->composantes) & 0x0F)-1;
	//prov1 est le num�ro de la composante parall�le 
	//� laquelle appartient l'�tat 'state'
	if (state != rootState)
		(state->father->etatsActifs)[prov1] = state;
	
	// On met � jour le status de cet �tat :
	bitset(state->volatiledata->minvt, 7);
	state->volatiledata->time_minvt = state->volatiledata->minvt;
	if (state->action != 0x00)
		bitclr(state->volatiledata->time_minvt, 7);
	
	// On s'occupe des rendez-vous � la condition qu'il n'y ait pas
	// d'action :
	#ifdef RENDEZ_VOUS
	else {
		prov2 = (state->nb_rdvs_trans >> 4) & 0x0F;
		for (prov1=0; prov1 < prov2; prov1++)
			reachedRdvs1[(*(state->rdvs[prov1]))-1] +=1;
	}
	#endif

	// On s'occupe des ressources
	#ifdef RESSOURCE
	for (prov1 = 0; prov1 < state->nbRess; prov1++) 
		usedRessources1[state->ressources[prov1]->ressourceId] +=
			state->ressources[prov1]->ressourceQty;
	#endif

	#ifdef TIMEOUT
	state->volatiledata->time_timeout = state->timeout;
	#endif
	state->volatiledata->nbChildrenVisited = 0;
	state->volatiledata->childrenVisited = 0;
	
}

/* 
 * M�thode permettant de d�sactiver un �tat qui n'a pas d'�tat actif.
 * 
 * Cette m�thode met � jour les �tats actifs de son p�re.
 *
 * De plus, elle se charge de rendre faux l'�ventuel �v�nement de timeout
 * associ� � l'�tat.
 */
void privateDesactivateState(const rom etat* state) {
	// variables temporaires utilis�es
	unsigned char prov1;
	// on supprime l'�tat des �tats actifs du p�re.
	state->father->etatsActifs[((state->composantes) &  0x0F)-1] 
		= 0x00;
	// on supprime les rendez-vous de l'�tat
	#ifdef RENDEZ_VOUS
	for (prov1 = 0; prov1 < (((state->nb_rdvs_trans)>>4)&0x0F); prov1++)
		reachedRdvs1[(*(state->rdvs[prov1]))-1]--;
	#endif
	// on supprime les ressources de l'�tat
	#ifdef RESSOURCE
	for (prov1 = 0; prov1 < state->nbRess; prov1++)
		usedRessources1[state->ressources[prov1]->ressourceId] 
			-= state->ressources[prov1]->ressourceQty;
	#endif
}

void desactivateState(const rom etat* state) {
	rom etat* current_state = state;
	unsigned char prov1;
	unsigned char prov2;
	
	while (current_state != state->father) {
		prov1 =  ((current_state->composantes >> 4) & 0x0F);
		for (prov2 = 0; prov2 < prov1; prov2 ++) {
			// on se dirrige vers un �tat qui n'a plus de fils
			if (current_state->etatsActifs[prov2] != 0x00) {
				current_state = current_state->
					etatsActifs[prov2];
				break;
			}
		}
		// Quand il n'y a plus de fils, on le d�sactive;
		privateDesactivateState(current_state);
		// on remonte chez son p�re
		current_state = current_state->father;
	}	
}

#ifdef RESSOURCE
void privateSimulateDesactivateState(const rom etat* state) {
	unsigned char prov1;	
	// on supprime les ressources de l'�tat
	for (prov1 = 0; prov1 < state->nbRess; prov1++) {
		provRessources1[state->ressources[prov1]->ressourceId] 
			-= state->ressources[prov1]->ressourceQty;
	}
}

void simulateDesactivateState(const rom etat* state) {
	// on d�clare les variables qui seront utilis�es
	unsigned char prov1;
	const rom etat* current_state = state;
	// On met � jour le tableau provisoire
	for (prov1 = 0; prov1 < NB_RESSOURCES; prov1++)
		provRessources1[prov1] = usedRessources1[prov1];
	// On effectue la simulation
	while (current_state != state->father) {
		// on simule la suppression de l'�tat des �tats actifs
		privateSimulateDesactivateState(current_state);
		
		// on entre dans la premi�re composante s'il y en a une
		if (((((current_state->composantes)>>4)&0x0F) != 0x00) &&
		(current_state->etatsActifs[0]!=0x00)) {
			current_state = current_state->etatsActifs[0];
			continue;
		}
		// S'il n'y a plus moyen de descendre, on remonte jusqu'� un
		// noeud dont on n'a pas explor� au moins un des fils
		do {
			prov1 = ((current_state->composantes)) & 0x0F;
			current_state = current_state->father;
		} while ((prov1 = (((current_state->composantes)>>4)&0x0F)) &&
		(current_state != state->father));
		// Si on n'est pas remont� trop haut, on descend dans le noeud
		// qu'on n'a pas encore explor�...
		if (current_state != state->father) 
			current_state = current_state->etatsActifs[prov1];
	}
		
}
#endif

/*
 * Cette m�thode regarde l'ensemble des transitions de l'�tat state et
 * franchit celle qui est la plus prioritaire, s'il y en a une de
 * franchissable.
 *
 * Si elle franchit une transition, elle fait pointer state vers l'�tat o�
 * arrive cette transition.
 *
 * Enfin, elle se charge de mettre � jour les rendez-vous, les ressources.
 * Elle v�rifie que ces dern�res sont l� en suffisance avant de franchir la
 * transition.
 *
 * Une transition peut arriver dans l'�tat dans lequel elle part.
 *
 * Nous supposons ici que les transitions sont class�es dans l'ordre de
 * priorit�.
 */ 
void privateProcessTransitions(rom etat* state) {
	rom etat* leavedState;
	rom etat* current_state = state;
	unsigned char prov1;
	unsigned char prov2;
	// On n'ex�cute la transition que si l'action a �t� ex�cut�e :
	if (state->volatiledata->time_minvt != 0x80)
		return;
	// On scanne l'ensemble des transitions de l'�tat
	transitions : for (prov1 = 0; prov1 < ((state->nb_rdvs_trans)&0x0F); 
	prov1++) {
		// On va tout d'abord v�rifier que cette transition est
		// franchissable sur le plan des rendez-vous, de l'�v�nement
		// qui y sont associ�s.

		// �v�nement :
		#ifdef EVENEMENT
		if ((!(EVENEMENTS1 & (state->trans[prov1]->evt1)))
		&&(state->trans[prov1]->evt1 != 0x00))
			// Si l'�v�nement est d�fini et ne s'est pas produit,
			// on continue le parcours des transitions de l'�tat.
			continue;
		#endif
		// rendez-vous : 
		#ifdef RENDEZ_VOUS
		prov2 = state->trans[prov1]->rdv1;
		//RDL: ce truc est completement faux. une transition peut avoir plusieurs rdv 
		//RDL m�me si l'editeur ne le supporte pas, 
		//RDL le moteur et le g�n�rateur le supportent bien
		//if ((prov2 != 0)&&(neededRdvs1[prov2-1]>reachedRdvs1[prov2-1])){
		// s'il n'y en a pas assez, on continue le
		// parcours des transitions de l'�tat.
		//goto stop;
		//}
		if (prov2 !=0){
		  //il y a au moins un rdv n�cessaire pour franchir cette transition
		  char i=0;
		  unsigned char mask=1;
		  while(i<8){
		    //on teste le bit num�ro i+1 (cad le premier si i=0 et le huiti�me si i=7
		    //invariant: smallmask est un masque de s�lection de ce bit l�
		    if(prov2 & mask){
		      //ce rdv ci est attendu on v�rifie donc qu'il et bien atteint
		      if (neededRdvs1[i]>reachedRdvs1[i]){
			//le rdv n'est pas atteint
			goto stop;
		      }//s'il est atteint, on continue � tourner pour tester les autres
		    }//end if: else ce rdv n'est pas n�cessaire, on continue donc � tourner pour tester les autres
		    i++;
		    mask <<= 1; //on shifte le bit de une position vers le haut
		  }//end while
		}//end if
		//ici, tous les rdv n�cessaires pour franchir la transition ont �t� v�rifi�e comme atteints
		#endif
		// On recherche le plus grand �tat quitt�
		// On effectue la recherche en supposant que c'est l'�tat dans
		// lequel on entre	
		leavedState = state->trans[prov1]->next_state;
		while ((current_state != leavedState) && 
		(current_state != 0x00))
			current_state = current_state->father;
		// Si on n'a pas trouv�, c'est que le plus grand �tat quitt�
		// est un de ses fr�res.
		if (current_state == 0x00) {
			// On recherche donc le p�re qui est en commun
			current_state = leavedState->father;
			leavedState = state;
			while (leavedState->father != current_state)
				leavedState = leavedState->father; 
		}
		// leavedState contient donc maintenant le plus grand �tat
		// quitt�.
		// D'autre part, sur le plan des rendez-vous, de l'�v�nement
		// et de l'action, cette transition est franchissable.
		// On v�rifie maintenant qu'il y a moyen de quitter ce
		// sous-graphe sur le plan des ressources.
		current_state = state->trans[prov1]->next_state;
		// Pour chaque ressource, on v�rifie qu'il en resterait assez
		// si on quittait l'�tat leaved_state pour entrer dans l'�tat
		// current_state.
		#ifdef RESSOURCE
		simulateDesactivateState(leavedState);
		for (prov2 = 0; prov2 < current_state->nbRess; prov2++) {
			if ((((declaredRessources1[current_state->
			ressources[prov2]->ressourceId])-provRessources1[
			current_state->ressources[prov2]->ressourceId]))
			- current_state->ressources[prov2]->ressourceQty < 0)
				// S'il n'y en a pas assez, on continue �
				// parcourir les transitions de l'�tat.
				goto stop;
		}
		#endif
		// Si la transition est franchissable, on la franchit
		// En effet, d'apr�s les restrictions qu'on a pos� sur la
		// d�claration des transitions, on sait que c'est la plus
		// prioritaire.

		desactivateState(leavedState);
		activateState(current_state);

		// On met � jour la variable state et on finit la fonction
		state = current_state;
		return;
		stop: continue;
	}
}

/*
 * renvoie un nombre entre 0 et Max, nombre qui est al�atoire.
 *
 * Max doit �tre supp�rieur ou �gal � 0
 */
int nbloops = 0;
int privateRandom(int Max) {
	return nbloops % (Max+1);
}

void processTransitions(void) {
	unsigned char prov1, prov2, prov3, prov4;
	rom etat* current_state; 
	#ifdef EVENEMENT
	updateEvents();
	#endif
	current_state = rootState;
	// On effectue l'euler-tour
	while (current_state != 0x00) {
		// on effectue les transitions
		// La transition change l'�tat actif par l'�tat o� arrive la
		// transition. De ce fait, on continuera � explorer l'arbre
		// qui est effectivement actif.
		privateProcessTransitions(current_state);
		current_state->volatiledata->nbChildrenVisited = 0;
		current_state->volatiledata->childrenVisited = 0;
		// on entre dans une composante s'il y en a une
		if( (((current_state->composantes>>4)&0x0F)!=0)) {
			
			prov1 = privateRandom(((current_state->composantes>>4)
					&0x0F)-
					(current_state->volatiledata->nbChildrenVisited+1));

			bitset(current_state->volatiledata->childrenVisited, prov1);
			current_state->volatiledata->nbChildrenVisited++;
			current_state = current_state->etatsActifs[prov1];
			continue;
		}
		// S'il n'y a plus moyen de descendre, on remonte jusqu'� un
		// noeud dont on n'a pas explor� au moins un des fils
		do {
			current_state = current_state->father;
		} while ((current_state != 0x00) &&
				(((current_state->composantes>>4)&0x0F)==
				current_state->volatiledata->nbChildrenVisited));
		// Si on n'est pas remont� trop haut, on descend dans le noeud
		// qu'on n'a pas encore explor�...
		if (current_state != 0x00) {
			prov1 = privateRandom(((current_state->composantes>>4)
					&0x0F)-
					(current_state->volatiledata->nbChildrenVisited+1));
			prov2=0x01;
			prov3=0xFF;
			prov4=0xFF;
			do {
				if (!(current_state->volatiledata->childrenVisited&prov2))
					prov3++;
				prov2=prov2<<1;
				prov4++;
			} while (prov3!=prov1);
			bitset(current_state->volatiledata->childrenVisited, prov4);
			current_state->volatiledata->nbChildrenVisited++;
			current_state = current_state->etatsActifs[prov4];
		}
	}
	#ifdef MINVT_OR_TIMEOUT
	updateTimes();
	#endif
}

void privateProcessAction(const rom etat* state) {
	unsigned char prov1;
	unsigned char prov2;
	if (!(state->volatiledata->time_minvt & 0x80)) {
		void (*theaction)(void) = state->action;
		theaction();
		state->volatiledata->time_minvt |= 0x80;
		
		#ifdef MINVT_OR_TIMEOUT
		updateTimes();
		#endif
		#ifdef RENDEZ_VOUS
			prov2 = (state->nb_rdvs_trans >> 4) & 0x0F;
			for (prov1=0; prov1 < prov2; prov1++)
				reachedRdvs1[(*(state->rdvs[prov1]))-1] +=1;
		#endif
	}
}

void processActions(void) {
	rom etat* current_state = rootState;
	unsigned char prov1;
	// On effectue l'euler-tour
	while (current_state != 0x00) {
		// on effectue les actions
		privateProcessAction(current_state);
		// on entre dans la premi�re composante s'il y en a une
		if (( (((current_state->composantes) >> 4)&0x0F) != 0x00) &&
		(current_state->etatsActifs[0]!=0x00)) {
			current_state = current_state->etatsActifs[0];
			continue;
		}
		// S'il n'y a plus moyen de descendre, on remonte jusqu'� un
		// noeud dont on n'a pas explor� au moins un des fils
		do {
			prov1 = ((current_state->composantes)) & 0x0F;
			current_state = current_state->father;
		} while ((current_state != 0x00) && 
		(prov1 == (((current_state->composantes)>>4)&0x0F)) );
		// Si on n'est pas remont� trop haut, on descend dans le noeud
		// qu'on n'a pas encore explor�...
		if (current_state != 0x00)
			current_state = current_state->etatsActifs[prov1];
	}
}

#define false 0
#define true 1
//DEBUG
short int this_time = 0xFF;
int cycle = false;
//DEBUG


void processGraph(void) {
	#ifdef MINVT_OR_TIMEOUT
	initTimer();
	#endif
	activateState(rootState);
	while(1) {
		nbloops++; //pour mettre � jours le compteur al�atoire
		//DEBUG
		#ifdef MINVT_OR_TIMEOUT
		this_time --;
		if (this_time == 0)
			cycle = true;
		#endif
		//END DEBUG
		
		processActions();

		processTransitions();
	}
}

#ifdef MINVT_OR_TIMEOUT

int privateUpdateTimes(const rom etat* state) {
	#ifdef TIMEOUT
	if (state->volatiledata->time_timeout != 0x00) {
		state->volatiledata->time_timeout --;
	}
	#endif
	#ifdef MINVT
	if ((state->volatiledata->time_minvt & 0x7F) != 0x00) {
		state->volatiledata->time_minvt --;
	}
	#endif
}
void updateTimes(void) {
        char prov1;
	if (testTime()) {
	rom etat* current_state = rootState;
	// On effectue l'euler-tour
	while (current_state != 0x00) {
		// on effectue les actions
		privateUpdateTimes(current_state);
		// on entre dans la premi�re composante s'il y en a une
		if (( (((current_state->composantes) >> 4)&0x0F) != 0x00) &&
		(current_state->etatsActifs[0]!=0x00)) {
			current_state = current_state->etatsActifs[0];
			continue;
		}
		// S'il n'y a plus moyen de descendre, on remonte jusqu'� un
		// noeud dont on n'a pas explor� au moins un des fils
		do {
			prov1 = ((current_state->composantes)) & 0x0F;
			current_state = current_state->father;
		} while ((current_state != 0x00) &&
		(prov1 == (((current_state->composantes)>>4)&0x0F)) );
		// Si on n'est pas remont� trop haut, on descend dans le noeud
		// qu'on n'a pas encore explor�...
		if (current_state != 0x00)
			current_state = current_state->etatsActifs[prov1];
	}
		
	}
}

// fonctions � mettre � jour en fonction de votre interruption
void initTimer(void){
;
}

int testTime(void) {
	//TODO
	if (cycle) {
		cycle = false;
		return true;
	}
	return false;
}

#endif
