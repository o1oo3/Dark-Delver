/*
deze class maakt de sleutel aan.
*/

class Sleutel {
  int sleutelX;
  //test github
  int sleutelY;
  int amountOfSleutels;

  void changeSleutel() {
    sleutelX = (int)random(0, mazeGeneration.mazeSizeX);
    sleutelY = (int)random(0, mazeGeneration.mazeSizeY);
    amountOfSleutels = 0;
  }

  void drawSleutel() {
    //fill(128, 128, 0);
    //rect(sleutelX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, sleutelY*mazeGeneration.cellSize, mazeGeneration.cellSize, mazeGeneration.cellSize);
    //image(assets.sleutelSprite, sleutelX*mazeGeneration.cellSize + mazeGeneration.offsetToCenterX, sleutelY*mazeGeneration.cellSize, mazeGeneration.cellSize, mazeGeneration.cellSize);
    keySheet.draw(sleutelX*mazeGeneration.cellSize + mazeGeneration.offsetToCenterX, sleutelY*mazeGeneration.cellSize);
    
  }
}
