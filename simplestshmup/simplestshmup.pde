
PImage fond;

int fondPosition = 800;

Hero hero;
Mechant[] listeDeMechants;

String mode="bienvenue";

int score=0;

void setup() {
  size(800, 600);

  frameRate(24);
  noSmooth();
  fond = loadImage("media/galaxy.jpg");
  hero = new Hero();

  listeDeMechants = new Mechant[3];
  listeDeMechants[0] = new Mechant();
  listeDeMechants[1] = new Mechant();
  listeDeMechants[2] = new Mechant();
  
  modeBienvenue();
}

void modeBienvenue(){
  println("Passage en mode 'bienvenue'...");
  
  mode="bienvenue";
  smooth();
  cursor(ARROW);
  
  //textSize(60);
}

void modeJeu(){
  println("Passage en mode 'jeu'...");  
  mode="jeu";
  
  noCursor();
  textSize(15);
}


void dessineBienvenue(){
 fill(0);

 text("Bienvenue dans mon jeu !", 10, 10); 
 text("Cliquez sur la souris !", 60, 10); 
 
}


void dessineGameover(){
 fill(250);
 text("GAME OVER !", 300, 300); 
 text(score + "points ", 350, 350);  
}

void dessineBandeau(){
 
 fill(0);
 rect(0, 0, 800, 35);
 
 fill(250);
 text("Score : " + score, 30, 30); 
 
}

void dessineFond(){
  background(0);
  image(fond, fondPosition, 0);


  fondPosition-=3;
  
  if (fondPosition < -800){
    fondPosition = 800;
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

void mouseClicked() {
   if (mode=="bienvenue"){
     modeJeu();
   } else if (mode=="jeu"){
     hero.attaque();
  }
}

