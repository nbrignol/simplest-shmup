
//****************************
//Tous les participants au jeu sont ici
//****************************
Galaxie galaxie;
Hero hero;
Mechant[] listeDeMechants;

//*****************************
//Quelques variables "globales"
//qui nous serviront tous le long du jeu.
//*****************************
String mode="bienvenue";
int score=0;
int niveauActuel=1;

//*****************************
//La fonction spéciale "setup" sera executé une seule fois au début, automatiquement
//Elle sert à régler les parametres de base.
//*****************************
void setup() {
  //taille de la fenêtre
  size(800, 600);

  //Vitesse générale du jeu (c'est le nombre d'images par seconde)
  frameRate(24);

  //initialise le jeu
  prepareNouvellePartie();
  modeBienvenue();
}

//*****************************
//Cette fonction permet de tout préparer pour le début du jeu...
//...ou pour recommencer une nouvelle partie.
//*****************************
void prepareNouvellePartie() {
  galaxie = new Galaxie();
  hero = new Hero();

  listeDeMechants = new Mechant[5];
  listeDeMechants[0] = new Mechant();
  listeDeMechants[1] = new Mechant();
  listeDeMechants[2] = new Mechant();
  listeDeMechants[3] = new Mechant();
  listeDeMechants[4] = new Mechant();

  score=0;
  niveauActuel=1;
}


//*****************************
//La fonction spéciale "draw" est appellé automatiquement, apres "setup" sans arret. 
//C'est la boucle principale qui permet de lancer toutes les fonctions du jeu
//*****************************
void draw() {

  //si c'est l'écran d'accueil que l'on doit afficher...
  if (mode=="bienvenue") {
    dessineBienvenue();
  }

  //si c'est le jeu qui est en cours, on s'occupe de le faire avancer !
  if (mode=="jeu") { 
    //y a-t'il eu des blessés?
    verifieCollisions();

    //dessine l'image de fond qui avance
    dessineFond();
    //dessine le bandeau avec le score
    dessineBandeau();
    //dessine le héro selon la position de la souris
    dessineHero();
    //dessine tous les méchants
    dessineMechants();
  }

  //si le jeu est terminé...
  if (mode=="gameover") {
    dessineGameover();
  }
}


//****************************
//Cette fonction "mousePressed" est appellée automatiquement
//par le sytème dès que la souris est cliquée.
//*****************************
void mousePressed() {
  //Si on est sur l'écran de bienvenue, 
  //on passe au début du jeu.
  if (mode=="bienvenue") {
    modeJeu();
  } 
  //Si on est pendant le jeu
  //le hero lance un missile.
  else if (mode=="jeu") {
    hero.attaque();
  } 
  //Si on est sur l'écran de fin,
  //on recommence une nouvelle partie !
  else if (mode=="gameover") {
    prepareNouvellePartie();
    modeBienvenue();
  }
}

//*****************************
//Ces fonctions (modeBienvenue, modeJeu, modeGameover) permettent 
//de passer d'un mode à un autre, 
//selon le moment du jeu.
//*****************************

//*****************************
//L'écran d'accueil...
//On laisse apparaitre le curseur.
//*****************************
void modeBienvenue() {
  println("Passage en mode 'bienvenue'...");

  mode="bienvenue";
  cursor(ARROW);
}

//*****************************
//Le jeu en lui même...
//On masque le curseur.
//*****************************
void modeJeu() {
  println("Passage en mode 'jeu'...");  
  mode="jeu";

  noCursor();
}

//*****************************
//L'écran de fin...
//On laisse apparaitre le curseur.
//*****************************
void modeGameover() {
  println("Passage en mode 'gameover'...");

  mode="gameover";
  cursor(ARROW);
}

//****************************
//Dessine tous ce qu'il faut pour 
//l'écran de bienvenue
//****************************
void dessineBienvenue() {
  galaxie.dessine();
  
  hero.position_verticale = 340;
  hero.position_horizontale = 320;
  hero.dessine();

  textSize(60);
  fill(255);
  text("Bienvenue dans mon jeu !", 30, 280); 
  textSize(30);
  text("Cliquez sur la souris !", 230, 430);
}

//****************************
//Dessine tous ce qu'il faut pour 
//l'écran de fin
//****************************
void dessineGameover() {
  galaxie.dessine();

  fill(250);
  textSize(60);
  text("GAME OVER !", 30, 300); 
  textSize(30);
  text(score + " points ", 30, 330);
}

//****************************
//Dessine tous ce qu'il faut pour 
//le bandeau en haut de l'écran pendant le jeu
//****************************
void dessineBandeau() {
  textSize(15); 
  fill(0);
  rect(0, 0, 800, 35);

  fill(250);
  text("Score : " + score, 30, 30); 
  text("Niveau : " + niveauActuel, 400, 30); 
  text("Vies : " + hero.nombre_de_vies_restantes, 650, 30);
}

//****************************
//Fait avancer et dessine la galaxie
//****************************
void dessineFond() {
  galaxie.avance();
  galaxie.dessine();
}

//****************************
//Fait avancer et dessine
//le vaisseau du joueur.
//****************************
void dessineHero() {
  hero.avance();
  hero.dessine();
}

//****************************
//Fait avancer et dessine
//tous les méchants
//****************************
void dessineMechants() {

  for (Mechant unMechant : listeDeMechants) {
    unMechant.avance();
    unMechant.dessine();
  }
}


//****************************
//Passe en revue tous les méchants pour voir s'ils sont 
//en collision avec le missile ou avec le hero
//****************************
void verifieCollisions() {

  //passe en revue tous les méchants...
  for (Mechant unMechant : listeDeMechants) {
    hero.verifieCollisionAvecMechant(unMechant);
    unMechant.verifieCollisionAvecMissile(hero);
  }

  //si le hero à été touché trop de fois, 
  //on affiche l'ecran de fin.
  if (hero.nombre_de_vies_restantes <= 0) {
    modeGameover();
  }
}



