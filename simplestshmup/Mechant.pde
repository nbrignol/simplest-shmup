
class Mechant {
  PImage imageDuMechant = loadImage("media/villain.png");
  PImage imageExplosion = loadImage("media/explosion1.png");
  
  int position_horizontale = 900;
  int position_verticale = 200;

  int largeur_mechant = 111;
  int hauteur_mechant = 53;
  
  int vitesseDuMechant=5;
  
  boolean explosion_en_cours=false;
  int temps_explosion=0;
  
  void replaceMechant(){
    position_verticale = (int) random(800);
    position_horizontale = 800 + (int) random(200);
  }
  
  void calculeZigZag(){
     float amplitude = 30;
     int deplacement = (int) (sin(position_horizontale/amplitude) * amplitude);
     position_verticale = position_verticale + deplacement;
  }

  void avanceExplosion(){
   temps_explosion++;
   //simplifier !!
   int index = (temps_explosion % 15) / 5 + 1;
   imageExplosion = loadImage("media/explosion"+index+".png");
   
   if (temps_explosion > 9){
        temps_explosion = 0;
        explosion_en_cours = false;
        replaceMechant();
    }
      
  }

  void avance() {

    if (explosion_en_cours){
      avanceExplosion();
      return;
    }
    
    position_horizontale = position_horizontale - vitesseDuMechant;
    calculeZigZag();
    
    if ( position_horizontale < 0) {
      replaceMechant();
      vitesseDuMechant = vitesseDuMechant + 1;
      score ++;

      if (vitesseDuMechant > 30) {
        vitesseDuMechant = 30;
      }
    }
  }

  void dessine() {
    if (explosion_en_cours) {
      image(imageExplosion, position_horizontale, position_verticale);
    } else {
      image(imageDuMechant, position_horizontale, position_verticale);
    }
    
    
    
  }
  
  
  void verifieCollisionAvecMissile(Hero hero){
    if (hero.attaque_en_cours){
      
      boolean horizontal = (hero.position_horizontale_missile > position_horizontale) && hero.position_horizontale_missile < position_horizontale + largeur_mechant;
      boolean vertical = (hero.position_verticale_missile > position_verticale) && hero.position_verticale_missile < position_verticale + hauteur_mechant;
      
      if (horizontal && vertical) {
          println("Kaboum !");
          
          hero.attaque_en_cours = false;
          explosion_en_cours = true;
          score = score + 100;
          
          
          
      }
      
    }
  }
}

