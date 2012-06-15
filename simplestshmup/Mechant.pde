
class Mechant {
  PImage imageDuMechant = loadImage("media/villain1.png");
  int positionDuMechantHauteur= (int) random(400);
  int positionDuMechantLargeur=800 + (int) random(200);

  int vitesseDuMechant=5;
     
  void calculeZigZag(){
     float amplitude = 30;
     int deplacement = (int) (sin(positionDuMechantLargeur/amplitude) * amplitude);
     positionDuMechantHauteur = positionDuMechantHauteur + deplacement;
  }

  void avance() {

    positionDuMechantLargeur = positionDuMechantLargeur - vitesseDuMechant;
    calculeZigZag();
    
    if ( positionDuMechantLargeur < 0) {
      positionDuMechantLargeur = 800;
      vitesseDuMechant = vitesseDuMechant + 5;
      positionDuMechantHauteur= (int) random(400);
      
      score++;

      if (vitesseDuMechant > 30) {
        vitesseDuMechant = 30;
      }
    }
  }

  void dessine() {
    image(imageDuMechant, positionDuMechantLargeur, positionDuMechantHauteur);
  }
}

