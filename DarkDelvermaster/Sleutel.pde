/*
deze class maakt de sleutel aan.
 */

class Sleutel {
  int sleutelX;
  //test github
  int sleutelY;
  int amountOfSleutels;

  void changeSleutel() {
    do {
      sleutelX = (int)random(0, mazeGeneration.mazeSizeX);
      sleutelY = (int)random(0, mazeGeneration.mazeSizeY);
    } while (sleutelX >= player.playerX-4 && sleutelX <= player.playerX+4 && sleutelY >= player.playerY-4 && sleutelY <= player.playerY+4);
    amountOfSleutels = 0;
  }

  void drawSleutel() {
    //fill(128, 128, 0);
    //rect(sleutelX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, sleutelY*mazeGeneration.cellSize, mazeGeneration.cellSize, mazeGeneration.cellSize);
    //image(assets.sleutelSprite, sleutelX*mazeGeneration.cellSize + mazeGeneration.offsetToCenterX, sleutelY*mazeGeneration.cellSize, mazeGeneration.cellSize, mazeGeneration.cellSize);
    keySheet.draw(sleutelX*mazeGeneration.cellSize + mazeGeneration.offsetToCenterX, sleutelY*mazeGeneration.cellSize);
  }
}
