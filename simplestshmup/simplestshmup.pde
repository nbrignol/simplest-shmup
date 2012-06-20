
int mechant_position_horizontale = 800;
int mechant_position_verticale = 30;  

PImage imageDuHero;
PImage imageDuMechant;
PImage imageDeFond;


//*****************************
//La fonction spéciale "setup" sera executé une seule fois au début, automatiquement
//*****************************
void setup() {
  //taille de la fenêtre
  size(800, 600);

  //Vitesse générale du jeu (c'est le nombre d'images par seconde)
  frameRate(24);

  //les images
  imageDuHero = loadImage("media/hero.png");
  imageDuMechant = loadImage("media/villain.png");
  imageDeFond = loadImage("media/etoiles.jpg");
}

//*****************************
//La fonction spéciale "draw" est appellé automatiquement, apres "setup" sans arret. 
//C'est la boucle principale qui permet de lancer toutes les fonctions du jeu
//*****************************
void draw() {

  mechant_position_horizontale = mechant_position_horizontale - 10;


  if (mechant_position_horizontale < 0) {
    mechant_position_horizontale=800;
    mechant_position_verticale=mechant_position_verticale+100;
  }

  if (mechant_position_verticale > 600) {
    mechant_position_horizontale=800;
    mechant_position_verticale=30;
  }

  image(imageDeFond, 0, 0);
  image(imageDuMechant, mechant_position_horizontale, mechant_position_verticale);
  image(imageDuHero, mouseX, mouseY);
}

