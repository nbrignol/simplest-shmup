class Hero{
  int position_verticale = 0;
  int position_horizontale = 0;
  
  PImage imageDuHero = loadImage("media/hero.png");
  PImage imageDuMissile = loadImage("media/ball.png");
  
  boolean attaque_en_cours=false;
  int position_verticale_missile = 0;
  int position_horizontale_missile = 0;
  
  boolean blessure = false;
  int nombre_de_vies_restantes = 3;
  
  void avance(){
    //suis la souris
    position_horizontale = mouseX;
    position_verticale = mouseY + (int) random(3);
    
    //missile
    if (attaque_en_cours) {
      position_horizontale_missile = position_horizontale_missile + 30;
    }
  }
  
  void dessine(){
    
    if (blessure){
      fill(255, 0, 0);
      rect(0, 0, 800, 35);
      blessure = false;
    }
    
    image(imageDuHero, position_horizontale, position_verticale);

    if (attaque_en_cours) {
       image(imageDuMissile, position_horizontale_missile, position_verticale_missile);
    }
    
    

  }
  
  void verifieCollisionAvecMechant(Mechant mechant){
    
    boolean horizontal = (mechant.position_horizontale > position_horizontale) && mechant.position_horizontale < position_horizontale + mechant.largeur_mechant;
    boolean vertical   = (mechant.position_verticale > position_verticale) && mechant.position_verticale < position_verticale + mechant.hauteur_mechant;
      
      if (! mechant.explosion_en_cours && horizontal && vertical) {
          println("Aie !");
          
          score = score - 100;
          nombre_de_vies_restantes = nombre_de_vies_restantes - 1;
          
          blessure = true;
          
          mechant.explose();
      }
      
  }

  
  void attaque(){
    println("Hero attaque!");
    
    position_verticale_missile = position_verticale + 35;
    position_horizontale_missile = position_horizontale + 85;
    
    attaque_en_cours = true;
    
  }
}
