/*
deze class maakt de speler aan het laat deze bewegen doormiddel van keypresses, er word in deze class ook collision met Monster,sleutel,einddeur en de maze muren gecontroleerd.
 */

class Player {
  int playerX;
  int playerY;
  boolean[]playerChoice;
  boolean playerMoveUp;
  boolean playerMoveRight;
  boolean playerMoveBottom;
  boolean playerMoveLeft;
  int level;
  int bombAmount;



  void changePlayer() {
    playerX = (int)random(0, mazeGeneration.mazeSizeX);
    playerY = (int)random(0, mazeGeneration.mazeSizeY);
    playerChoice = new boolean[4];
    playerMoveUp = false;
    playerMoveRight = false;
    playerMoveBottom = false;
    playerMoveLeft = false;
    bombAmount = 1;
  }

  void drawPlayer() {
    //fill(255);
    //ellipse(playerX*mazeGeneration.cellSize+mazeGeneration.cellSize/2+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize+mazeGeneration.cellSize/2, mazeGeneration.cellSize, mazeGeneration.cellSize);
    image(assets.Licht, playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX-1715, playerY*mazeGeneration.cellSize-1210);
    image(assets.BombStatikk, 1200, 635);
    //image(assets.playerSprite, playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize);
    //spriteSheet = new SpriteSheet("Howdy clone.png", 6);
    playerSheet.draw(playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize);
    
  }

  void checkPlayer() {
    if ( mazeGeneration.checkOutOfBounts(playerX, playerY-1)) {
      if (!mazeGeneration.topWall[playerX][playerY]) {
        playerChoice[0]=true;
      }
    }
    if (mazeGeneration.checkOutOfBounts(playerX+1, playerY)) {
      if (!mazeGeneration.rightWall[playerX][playerY]) {
        playerChoice[1]=true;
      }
    }
    if (mazeGeneration.checkOutOfBounts(playerX, playerY+1)) {
      if (!mazeGeneration.bottomWall[playerX][playerY]) {
        playerChoice[2]=true;
      }
    }
    if (mazeGeneration.checkOutOfBounts(playerX-1, playerY)) {
      if (!mazeGeneration.leftWall[playerX][playerY]) {
        playerChoice[3]=true;
      }
    }
    if (playerX == monster.monsterX && playerY == monster.monsterY) {
      schermen.welkScherm[1] = false;
      schermen.welkScherm[2] = true;
      level = 0;
    }
    if (playerX == sleutel.sleutelX && playerY == sleutel.sleutelY) {
      sleutel.amountOfSleutels++;
      sleutel.sleutelX = -1;
      sleutel.sleutelY = -1;
    }
    if (playerX == eindDeur.deurX && playerY == eindDeur.deurY) {
      println(sleutel.amountOfSleutels);
      if (sleutel.amountOfSleutels == 1) {
        level++;
        changeScherm.changeGameScherm();
      }
    }
  }

  void movePlayer() {
    if (mazeGeneration.amountOfCellsVisited>= (mazeGeneration.mazeSizeX*mazeGeneration.mazeSizeY)) {

      if (key == CODED) {
        if (keyCode == UP) {
          if (playerChoice[0]) {
            playerMoveUp = true;
          }
          if (playerMoveUp) {
            playerY--;
            playerMoveUp = false;

            for (int i = 0; i<playerChoice.length; i++) {
              playerChoice[i] = false;
            }
          }
        }
        if (keyCode == RIGHT) {
          if (playerChoice[1]) {
            playerMoveRight = true;
          }
        }

        if (playerMoveRight) {
          playerX++;
          playerMoveRight = false;

          for (int i = 0; i<playerChoice.length; i++) {
            playerChoice[i] = false;
          }
        }
        if (keyCode == DOWN) {
          if (playerChoice[2]) {
            playerMoveBottom = true;
          }
        }
        if (playerMoveBottom) {
          playerY++;
          playerMoveBottom = false;

          for (int i = 0; i<playerChoice.length; i++) {
            playerChoice[i] = false;
          }
        }

        if (keyCode == LEFT) {
          if (playerChoice[3]) {
            playerMoveLeft = true;
          }
        }
        if (playerMoveLeft) {
          playerX--;
          playerMoveLeft = false;


          for (int i = 0; i<playerChoice.length; i++) {
            playerChoice[i] = false;
          }
        }
      }
    }
  }
  void stopPlayer() {
    if (playerMoveUp) {
      playerMoveUp= false;
    }
    if (playerMoveRight) {
      playerMoveRight= false;
    }
    if (playerMoveBottom) {
      playerMoveBottom= false;
    }
    if (playerMoveLeft) {

      playerMoveLeft= false;
    }
  }
  void playerBomb() {
    if (key == 'x' && bombAmount == 1) {
       //bombSheet.draw(playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize);
      if ( mazeGeneration.checkOutOfBounts(playerX, playerY-1)) {
        mazeGeneration.topWall[playerX][playerY] = false;
        mazeGeneration.bottomWall[playerX][playerY-1] = false;
      }
      if (mazeGeneration.checkOutOfBounts(playerX+1, playerY)) {
        mazeGeneration.rightWall[playerX][playerY] = false;
        mazeGeneration.leftWall[playerX+1][playerY] = false;
      }
      if (mazeGeneration.checkOutOfBounts(playerX, playerY+1)) {
        mazeGeneration.bottomWall[playerX][playerY] = false;
        mazeGeneration.topWall[playerX][playerY+1] = false;
      }
      if (mazeGeneration.checkOutOfBounts(playerX-1, playerY)) {
        mazeGeneration.leftWall[playerX][playerY] = false;
        mazeGeneration.rightWall[playerX-1][playerY] = false;
      }
      bombAmount = 0;
    }
  }
}
