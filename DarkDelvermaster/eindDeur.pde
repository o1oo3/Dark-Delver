/*
deze class maakt de einddeur aan.
 */

class EindDeur {
  int deurX;
  int deurY;



  void changeEindDeur() {
    deurX = (int)random(0, mazeGeneration.mazeSizeX);
    deurY = (int)random(0, mazeGeneration.mazeSizeY);
  }

  void drawEindDeur() {
    // fill(128, 0, 128);
    //rect(deurX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, deurY*mazeGeneration.cellSize, mazeGeneration.cellSize, mazeGeneration.cellSize);
    image(assets.imageeDeur, deurX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, deurY*mazeGeneration.cellSize, mazeGeneration.cellSize, mazeGeneration.cellSize);
  }
}
