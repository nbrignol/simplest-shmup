PImage hero;
PImage fond;
PImage arme;

Mechant[] listeDeMechants;

Mechant mechant;
Mechant mechant2;
Mechant mechant3;

String mode="bienvenue";

int score=0;

boolean attaque;

void setup() {
  size(800, 600);

  frameRate(24);
  noSmooth();
  hero = loadImage("media/hero.png");
  fond = loadImage("media/galaxy.jpg");
  arme = loadImage("media/ball.png");
  
  //liste ? Array liste ? en dur ?
  listeDeMechants = new Mechant[3];
  listeDeMechants[0] = new Mechant();
  listeDeMechants[1] = new Mechant();
  listeDeMechants[2] = new Mechant();
      
  mechant = new Mechant();
  mechant2 = new Mechant();
  mechant3 = new Mechant();
  
  modeBienvenue();
}

void modeBienvenue(){
  println("Passage en mode 'bienvenue'...");
  
  mode="bienvenue";
  smooth();
  cursor(ARROW);
  
   textSize(60);
}

void modeJeu(){
  println("Passage en mode 'jeu'...");  
  mode="jeu";
  
  noCursor();
  
   textSize(15);
}


void dessineBienvenue(){
 fill(0);

 text("Bienvenue dans mon jeu !", 300, 300); 
 text("Cliquez sur la souris !", 350, 350); 
 
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
  image(fond, 0, 0);
}

void dessineHero(){
  image(hero, mouseX, mouseY+random(3));
  
  if(attaque){
    image(arme, mouseX + 100, mouseY);
  }
}

void dessineMechants(){
  
  for(Mechant unMechant : listeDeMechants){
    unMechant.avance();
    unMechant.dessine();
  }
  
  
  mechant.avance();
    mechant2.avance();
      mechant3.avance();
  mechant.dessine();
   mechant2.dessine();
    mechant3.dessine();
}

void draw(){
  if (mode=="bienvenue"){
    dessineBienvenue();
  }
  
  if (mode=="jeu"){  
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
   }
  
  
   attaque=true;
}

