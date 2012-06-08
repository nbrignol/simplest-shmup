
class Mechant {
  PImage imageDuMechant = loadImage("media/villain1.png");
  int positionDuMechantHauteur= (int) random(400);
  int positionDuMechantLargeur=800 + (int) random(200);

  int vitesseDuMechant=3;

  void avance() {

    positionDuMechantLargeur = positionDuMechantLargeur - vitesseDuMechant;

    if ( positionDuMechantLargeur < 0) {
      positionDuMechantLargeur = 800;
      positionDuMechantHauteur = (int) random(600); 
      vitesseDuMechant = vitesseDuMechant + 3;

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

