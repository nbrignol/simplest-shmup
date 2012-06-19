//*****************************
//La classe "Galaxie" represente le fond
//étoilé qui avance sans fin.
//*****************************
class Galaxie {

  int vitesseDeLaGalaxie = 3;
  
  PImage imageDeFond = loadImage("media/etoiles.jpg");
  int image1Position = 0;
  int image2Position = 800;

  void avance() {
    image1Position = image1Position - vitesseDeLaGalaxie;
    image2Position = image2Position - vitesseDeLaGalaxie;

    if (image1Position < -800) {
      image1Position = 800;
    }

    if (image2Position < -800) {
      image2Position = 800;
    }
  }

  void dessine() {
    background(0);
    image(imageDeFond, image1Position, 0);
    image(imageDeFond, image2Position, 0);
  }
}

