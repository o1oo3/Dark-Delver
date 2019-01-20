class Bomb {
  int bombX;
  int bombY;
  int fuse;
  boolean bombExplosion;

  void changeBomb(int playerX, int playerY) {

    bombX = playerX;
    bombY = playerY;
    fuse = millis();
    player.bombAmount--;
    bombExplosion = true;
  }

  void drawBomb() {

    if (millis() < fuse + 1650) {
      bombSheet.draw(bombX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX+20, bombY*mazeGeneration.cellSize+10);
    }
    if (millis() > fuse + 1650 && millis() < fuse + 2400) {
      explosionSheet.draw(bombX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX-8, bombY*mazeGeneration.cellSize-3);
    }
  }
  void explodeBomb() {
    if (bombExplosion) {
      if (millis() > fuse + 1650) {
        if ( mazeGeneration.checkOutOfBounts(bombX, bombY-1)) {
          mazeGeneration.topWall[bombX][bombY] = false;
          mazeGeneration.bottomWall[bombX][bombY-1] = false;
        }
        if (mazeGeneration.checkOutOfBounts(bombX+1, bombY)) {
          mazeGeneration.rightWall[bombX][bombY] = false;
          mazeGeneration.leftWall[bombX+1][bombY] = false;
        }
        if (mazeGeneration.checkOutOfBounts(bombX, bombY+1)) {
          mazeGeneration.bottomWall[bombX][bombY] = false;
          mazeGeneration.topWall[bombX][bombY+1] = false;
        }
        if (mazeGeneration.checkOutOfBounts(bombX-1, bombY)) {
          mazeGeneration.leftWall[bombX][bombY] = false;
          mazeGeneration.rightWall[bombX-1][bombY] = false;
        }
        assets.audioFuse.pause();
        assets.audioFuse.rewind();
        assets.audioBomb.trigger();
        bombExplosion = false;
      }
    }
  }
  void resetBomb() {
    bombExplosion = false;
  }





  //image(assets.imageBombStatikk, playerX*mazeGeneration.cellSize, playerY*mazeGeneration.cellSize);
}
