
class Mechant {
  PImage imageDuMechant = loadImage("media/villain1.png");
  PImage imageExplosion = loadImage("media/explosion1.png");
  
  int position_horizontale = 900;
  int position_verticale = 200;

  int largeur_mechant = 100;
  int hauteur_mechant = 100;
  
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

  void avance() {

    if (explosion_en_cours){
      temps_explosion++;
      
      if (temps_explosion > 10){
        temps_explosion = 0;
        explosion_en_cours = false;
        replaceMechant();
      }
      
      return;
    }
    
    position_horizontale = position_horizontale - vitesseDuMechant;
    calculeZigZag();
    
    if ( position_horizontale < 0) {
      replaceMechant();
      //vitesseDuMechant = vitesseDuMechant + 5;
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
  
  
  void verifieCollisionAvecMissile(Hero leHero){
    if (leHero.attaque_en_cours){
      
      boolean horizontal = (leHero.position_horizontale_missile > position_horizontale) && leHero.position_horizontale_missile < position_horizontale + largeur_mechant;
      boolean vertical = (leHero.position_verticale_missile > position_verticale) && leHero.position_verticale_missile < position_verticale + hauteur_mechant;
      
      if (horizontal && vertical) {
          println("Kaboum !");
          
          
          leHero.attaque_en_cours = false;
          explosion_en_cours = true;
          score = score + 100;
          
          
          
      }
      
    }
  }
}

