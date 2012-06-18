PImage fondTitre;
PImage fond;
int fond1Position = 0;
int fond2Position = 800;

Hero hero;
Mechant[] listeDeMechants;

String mode="bienvenue";

int score=0;
int niveauActuel=1;

void setup() {
  size(800, 600);
  frameRate(24);
  smooth();
  
  fondTitre = loadImage("media/galaxy.jpg");
  fond = loadImage("media/etoiles.jpg");
  
  prepareNouvellePartie();
  modeBienvenue();
}


void prepareNouvellePartie(){
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


void modeBienvenue(){
  println("Passage en mode 'bienvenue'...");
  
  mode="bienvenue";
  cursor(ARROW);
}

void modeJeu(){
  println("Passage en mode 'jeu'...");  
  mode="jeu";
  
  noCursor();
}

void modeGameover(){
  println("Passage en mode 'gameover'...");
  
  mode="gameover";
  cursor(ARROW);
}

void dessineBienvenue(){
 image(fondTitre, 0, 0); 
 fill(250);
 textSize(60);
 text("Bienvenue dans mon jeu !", 30, 300); 
 textSize(30);
 text("Cliquez sur la souris !", 30, 330); 
 
 image(hero.imageDuHero, 30, 400); 
 
}

void dessineGameover(){
 image(fondTitre, 0, 0); 
  
 fill(250);
 
 textSize(60);
 text("GAME OVER !", 30, 300); 
 textSize(30);
 text(score + " points ", 30, 330);  
}

void dessineBandeau(){
 textSize(15); 
 fill(0);
 rect(0, 0, 800, 35);
 
 fill(250);
 text("Score : " + score, 30, 30); 
 text("Niveau : " + niveauActuel, 400, 30); 
 text("Vies : " + hero.nombre_de_vies_restantes, 650, 30); 
}

void dessineFond(){
  background(0);
  image(fond, fond1Position, 0);
  image(fond, fond2Position, 0);

  fond1Position = fond1Position - 3;
  fond2Position = fond2Position - 3;
  
  if (fond1Position < -800){
    fond1Position = 800;
  }
  
  if (fond2Position < -800){
    fond2Position = 800;
  }
}

void dessineHero(){
  hero.avance();
  hero.dessine();  
}

void dessineMechants(){
  
  for(Mechant unMechant : listeDeMechants){
    unMechant.avance();
    unMechant.dessine();
  }
  
}

void verifieCollisions(){

  for(Mechant unMechant : listeDeMechants){
    
    hero.verifieCollisionAvecMechant(unMechant);
    unMechant.verifieCollisionAvecMissile(hero);
    
  }
  
  if (hero.nombre_de_vies_restantes == 0){
    modeGameover();
  }
  
  
}

void draw(){
  if (mode=="bienvenue"){
    dessineBienvenue();
  }
  
  if (mode=="jeu"){ 
    verifieCollisions();
    
    dessineFond();
    dessineBandeau();
    dessineHero();
    dessineMechants();
  }
  
  if (mode=="gameover"){
    dessineGameover();
  }
}

/* *************
EVENEMENT SOURIS
**************** */

void mousePressed() {
   if (mode=="bienvenue"){
     modeJeu();
   } else if (mode=="jeu"){
     hero.attaque();
  } else if (mode=="gameover"){
    prepareNouvellePartie();
    modeBienvenue();
  }
}

