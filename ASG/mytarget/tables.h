#include <curses.h>
// ************************************************** //
// Parametres definis pour optimiser a la compilation //
// ************************************************** //
// defini lorsque le graphe comporte des evenements
#define EVENEMENT
// defini lorsque le graphe comporte des rendez-vous
#define RENDEZ_VOUS
// defini lorsque le graphe comporte des minvts
// defini lorsque le graphe comporte des ressources
// defini lorsque le graphe comporte des timeouts
// defini lorsque le graphe comporte des minvts ou des timeouts (ou les deux)


// *************************************************** //
// Inclusion des definitions des structures de donnees //
// *************************************************** //
// Les structures de donnees sont inclues ici car elles doivent etre
// optimises en fonction des differents elements se trouvant dans le graphe.
// Les parametres definis en haut permettent de determiner ces optimisations.
#include "moteur_ASG.h"

// ************************************** //
// Definition des vecteurs de rendez-vous //
// ************************************** //
// nombre de rendez-vous dans le graphe
#define NB_RDVS 2
// tableau contenant le nombre de rendez-vous qu'il faut atteindre
unsigned char neededRdvs1[2] = {2 ,1};
// tableau contenant le nombre de rendez-vous effectivement atteint
unsigned char reachedRdvs1[2] = {0 ,0};

// *********************************** //
// Definition des vecteurs d'evenement //
// *********************************** //
#define NB_EVENEMENT 6
int EVENEMENTS1;

// ********************************************** //
// Declaration de l'ensemble des tables du graphe //
// ********************************************** //

etat E5, E9, E11, E17, E1, E15, E2, E13, E6, E8, E12, E3, E14, E4, E18, E10, E7, E16;

etat* rootState = &E1;

// ********************************************* //
// Definition de l'ensemble des tables du graphe //
// ********************************************* //

/* ************************* Etat 5 : AckRcvd ************************* */

transition t5_1 = {0, 0x00, &E4};

transition* t5[1] = {&t5_1};

char action_E5(void) {

}

etat E5 = {&E1, 0x03, 0, t5, 0x01, 0, 0, action_E5, 0};


/* ************************* Etat 9 : ARPreq ************************* */

transition t9_1 = {0, 0x00, &E8};

transition* t9[1] = {&t9_1};

char action_E9(void) {

}

etat E9 = {&E7, 0x01, 0, t9, 0x01, 0, 0, action_E9, 0};


/* ************************* Etat 11 : Idle ************************* */

transition t11_1 = {0, 0x02, &E6};
transition t11_2 = {0, 0x01, &E7};

transition* t11[2] = {&t11_1, &t11_2};

char action_E11(void) {

}

etat E11 = {&E1, 0x02, 0, t11, 0x02, 0, 0, action_E11, 0};


/* ************************* Etat 17 : TransmitToClient ************************* */

transition t17_1 = {0, 0x00, &E16};

transition* t17[1] = {&t17_1};

char rdv17_1 = {2};
char* rdv17[1] = {&rdv17_1};

char action_E17(void) {

}

etat E17 = {&E1, 0x01, rdv17, t17, 0x11, 0, 0, action_E17, 0};


/* ************************* Etat 1 : DHCP_Relay ************************* */


char action_E1(void) {
	activateState(&E16);
	activateState(&E11);
	activateState(&E4);

}

etat* AS1[4] = {0x00, 0x00, 0x00};

etat E1 = {0, 0x30, 0, 0, 0x00, 0, 0, action_E1, AS1};


/* ************************* Etat 15 : RcvdFromServer ************************* */

transition t15_1 = {4, 0x00, &E17};

transition* t15[1] = {&t15_1};

/*

*/

char action_E15(void) {


}

etat E15 = {&E1, 0x01, 0, t15, 0x01, 0, 0, action_E15, 0};


/* ************************* Etat 2 : RenewServCo ************************* */

transition t2_1 = {0, 0x00, &E5};

transition* t2[1] = {&t2_1};

char rdv2_1 = {1};
char* rdv2[1] = {&rdv2_1};

char action_E2(void) {

}

etat E2 = {&E1, 0x03, rdv2, t2, 0x11, 0, 0, action_E2, 0};


/* ************************* Etat 13 : RcvdFromNew ************************* */

transition t13_1 = {4, 0x00, &E12};

transition* t13[1] = {&t13_1};

/*

*/

char action_E13(void) {


}

etat E13 = {&E1, 0x01, 0, t13, 0x01, 0, 0, action_E13, 0};


/* ************************* Etat 6 : SendToClient ************************* */

transition t6_1 = {0, 0x00, &E11};

transition* t6[1] = {&t6_1};

char action_E6(void) {

}

etat E6 = {&E1, 0x02, 0, t6, 0x01, 0, 0, action_E6, 0};


/* ************************* Etat 8 : ARPansw ************************* */

transition t8_1 = {0, 0x00, &E10};

transition* t8[1] = {&t8_1};

char action_E8(void) {

}

etat E8 = {&E7, 0x01, 0, t8, 0x01, 0, 0, action_E8, 0};


/* ************************* Etat 12 : SendToServer ************************* */

transition t12_1 = {0, 0x00, &E16};

transition* t12[1] = {&t12_1};

char rdv12_1 = {1};
char* rdv12[1] = {&rdv12_1};

char action_E12(void) {

}

etat E12 = {&E1, 0x01, rdv12, t12, 0x11, 0, 0, action_E12, 0};


/* ************************* Etat 3 : SendRelease ************************* */

transition t3_1 = {0, 0x00, &E4};

transition* t3[1] = {&t3_1};

/*

*/

char action_E3(void) {


}

etat E3 = {&E1, 0x03, 0, t3, 0x01, 0, 0, action_E3, 0};


/* ************************* Etat 14 : SendFromRelay ************************* */

transition t14_1 = {0, 0x00, &E16};

transition* t14[1] = {&t14_1};

char rdv14_1 = {2};
char* rdv14[1] = {&rdv14_1};

char action_E14(void) {

}

etat E14 = {&E1, 0x01, rdv14, t14, 0x11, 0, 0, action_E14, 0};


/* ************************* Etat 4 : Idle ************************* */

transition t4_1 = {1, 0x00, &E2};
transition t4_2 = {2, 0x00, &E3};

transition* t4[2] = {&t4_1, &t4_2};

char action_E4(void) {

}

etat E4 = {&E1, 0x03, 0, t4, 0x02, 0, 0, action_E4, 0};


/* ************************* Etat 18 : RcvdFromPool ************************* */

transition t18_1 = {4, 0x00, &E14};

transition* t18[1] = {&t18_1};

/*

*/

char action_E18(void) {


}

etat E18 = {&E1, 0x01, 0, t18, 0x01, 0, 0, action_E18, 0};


/* ************************* Etat 10 : Send ************************* */


char action_E10(void) {

}

etat E10 = {&E7, 0x01, 0, 0, 0x00, 0, 0, action_E10, 0};


/* ************************* Etat 7 : SendToServer ************************* */

transition t7_1 = {0, 0x00, &E11};

transition* t7[1] = {&t7_1};

char action_E7(void) {
	activateState(&E9);

}

etat* AS7[1] = {0x00};

etat E7 = {&E1, 0x12, 0, t7, 0x01, 0, 0, action_E7, AS7};


/* ************************* Etat 16 : Listenning ************************* */

transition t16_1 = {8, 0x00, &E15};
transition t16_2 = {16, 0x00, &E13};
transition t16_3 = {32, 0x00, &E18};

transition* t16[3] = {&t16_1, &t16_2, &t16_3};

char action_E16(void) {

}

etat E16 = {&E1, 0x01, 0, t16, 0x03, 0, 0, action_E16, 0};




void updateEvents(void) {
/* bit 4:  */
if (0) bitset(EVENEMENTS1,3); else bitclr(EVENEMENTS1,3);
/* bit 6:  */
if (0) bitset(EVENEMENTS1,5); else bitclr(EVENEMENTS1,5);
/* bit 1:  */
if (0) bitset(EVENEMENTS1,0); else bitclr(EVENEMENTS1,0);
/* bit 3:  */
if (0) bitset(EVENEMENTS1,2); else bitclr(EVENEMENTS1,2);
/* bit 2:  */
if (0) bitset(EVENEMENTS1,1); else bitclr(EVENEMENTS1,1);
/* bit 5:  */
if (0) bitset(EVENEMENTS1,4); else bitclr(EVENEMENTS1,4);
}
