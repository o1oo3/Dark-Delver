class Bomb {
  int bombX;
  int bombY;
  int fuse;
  boolean bombExplosion;

  void changeBomb(int playerX, int playerY) {

    bombX = playerX; //DENOTES THAT THE BOMB IS PLACED ON THE PLAYER
    bombY = playerY;
    fuse = millis(); //A FUSE TIMER IN MILLISECONDS
    player.bombAmount--; //IF BOMB IS USED, LOWERS AMOUNT OF BOMBS BY ONE
    bombExplosion = true; //SETS THE BOMB TO EXPLODE
  }

  void drawBomb() {

    if (millis() < fuse + 1650) { //ADDS IMAGE TO THE PLACED BOMB, WITH ANIMATION, FOR ASLONG AS THE BOMB IS PLACED BUT THE FUSE TIMER HASN'T EXPIRED.
      bombSheet.draw(bombX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX+20, bombY*mazeGeneration.cellSize+10);
    }
    if (millis() > fuse + 1650 && millis() < fuse + 2400) { //ADDS AN ANIMATION TO THE EXPLOSION AFTER THE FUSE EXPIRES, AND SOMETIME AFTER.
      explosionSheet.draw(bombX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX-8, bombY*mazeGeneration.cellSize-3);
    }
  }
  void explodeBomb() {
    if (bombExplosion) { 
      if (millis() > fuse + 1650) {//CODE THAT DECIDES WHEN THE BOMB EXPLODES
        if ( mazeGeneration.checkOutOfBounts(bombX, bombY-1)) {//CODE THAT REMOVES WALLS AROUND THE BOMB
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
        assets.audioFuse.pause();//PAUSES THE FUSE AUDIO, PLAYS THE EXPLOSION AUDIO
        assets.audioFuse.rewind();
        assets.audioBomb.trigger();
        bombExplosion = false; //SETS TO BEING TO BEING NO LONGER PLACED
      }
    }
  }
  void resetBomb() {
    bombExplosion = false; //RESETS BOMB TO PREVENT BOMB FROM BEING UNABLE TO BE USED IN THE NEXT LEVEL
  }
}
