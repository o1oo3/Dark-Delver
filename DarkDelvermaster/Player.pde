
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
  int playerstep;
  boolean playerFirstDraw;
  int playerDirection;


  void changePlayer() {
    playerX = (int)random(0, mazeGeneration.mazeSizeX);
    playerY = (int)random(0, mazeGeneration.mazeSizeY);
    playerChoice = new boolean[4];
    playerMoveUp = false;
    playerMoveRight = false;
    playerMoveBottom = false;
    playerMoveLeft = false;
    bombAmount = 1;
    playerFirstDraw = true;
    playerDirection = 0;
  }

  void drawPlayer() {
    if (playerFirstDraw == true) {
      playerSheetDown.draw(playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize);
    }

    // if (key == CODED) {

    if (  playerDirection == 1) {

      playerSheetUp.draw(playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize);
    }
    if (playerDirection == 2) {
      playerSheetRight.draw(playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize);
    } 
    if (playerDirection == 3) {
      playerSheetDown.draw(playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize);
    } 
    if (playerDirection == 4) {
      playerSheetLeft.draw(playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize);
    }

    if (keyCode == UP) {
      playerSheetUp.draw(playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize);
      playerDirection = 1;
      playerFirstDraw = false;
    }
    if (keyCode == RIGHT) {
      playerSheetRight.draw(playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize);  
      playerDirection = 2;
      playerFirstDraw = false;
    }
    if (keyCode == DOWN) {
      playerSheetDown.draw(playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize);
      playerDirection = 3;
      playerFirstDraw = false;
    }
    if (keyCode == LEFT) {
      playerSheetLeft.draw(playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize);
      playerDirection = 4;
      playerFirstDraw = false;
    }
    //  }
    //fill(255);
    //ellipse(playerX*mazeGeneration.cellSize+mazeGeneration.cellSize/2+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize+mazeGeneration.cellSize/2, mazeGeneration.cellSize, mazeGeneration.cellSize);
    image(assets.imageLight, playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX-1715, playerY*mazeGeneration.cellSize-1210);
    //image(assets.imageBombStatikk, 1200, 635);
    //image(assets.playerSprite, playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize);
    //spriteSheet = new SpriteSheet("Howdy clone.png", 6);
    //playerSheetDown.draw(playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize);
    if (bombAmount >= 1) {
      image(assets.imageBombStatikk, 1200, 635);
    }
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
    if ((playerX == monster.monsterX && playerY == monster.monsterY) //CHECKS WETHER THE PLAYER IS STANDING ON A MONSTER AND WETHER THE MONSTER SHOULD BE SPAWNED IN THE CURRENT LEVEL
      || (playerX == monster2.monsterX && playerY == monster2.monsterY && player.level >= 5) 
      || (playerX == monster3.monsterX && playerY == monster3.monsterY && player.level >= 10)) {
      schermen.welkScherm[1] = false; //TURNS OFF THE SCREEN FOR THE LEVEL
      schermen.welkScherm[3] = true; //TURNS ON THE GAME OVER SCREEN
      assets.audiogameovertheme.play();
      assets.audioleveltheme.pause();
      assets.audioleveltheme.rewind();
    }
    if (playerX == sleutel.sleutelX && playerY == sleutel.sleutelY) { //STATEMENT DECIDING THAT THE PLAYER STEPS ON A KEY.
      assets.audiokeypickup.trigger(); //TRIGGER FOR THE KEY PICKUP SOUND
      sleutel.amountOfSleutels++; //ADDS A KEY TO THE AMOUNT OF KEYS
      sleutel.sleutelX = -1; //THESE TWO LINES REMOVE THE KEY FROM THE LEVEL
      sleutel.sleutelY = -1;
    }
    if (playerX == sleutel2.sleutelX && playerY == sleutel2.sleutelY && player.level >= 5) {
      assets.audiokeypickup.trigger();
      sleutel.amountOfSleutels++;
      sleutel2.sleutelX = -1;
      sleutel2.sleutelY = -1;
    }
    if (playerX == sleutel3.sleutelX && playerY == sleutel3.sleutelY && player.level >= 10) {
      assets.audiokeypickup.trigger();
      sleutel.amountOfSleutels++;
      sleutel3.sleutelX = -1;
      sleutel3.sleutelY = -1;
    }
    if (playerX == eindDeur.deurX && playerY == eindDeur.deurY) { //CHECKS WETHER THE PLAYER IS STANDING ON THE END DOOR
      //println(sleutel.amountOfSleutels);
      if (player.level <= 4) { //CHECKS WETHER THE LEVEL IS A LEVEL THAT HAS MULTIPLE KEYS
        if (sleutel.amountOfSleutels == 1) { //CHECKS WETHER THE PLAYER HAS THE REQUIRED AMOUNT OF KEYS
          scoreToevoegen.Totalscore(); //ADDS THE SCORE FORMULA FOR THIS LEVEL TO THE PLAYER'S TOTAL SCORE
          scoreToevoegen.Totaltime(); //ADDS THE TIME TAKEN TO COMPLETE THE LEVEL TO THE HIGHSCORE BOARD
          level++; //INCREASES THE LEVEL BY ONE
          changeScherm.changeGameScherm();//SWITCHES TO THE NEXT LEVEL
        }
      }
      if (player.level <= 9 && player.level >= 5) {
        if (sleutel.amountOfSleutels == 2) {
          scoreToevoegen.Totalscore();
          scoreToevoegen.Totaltime();
          level++;
          changeScherm.changeGameScherm();
        }
      }
      if (player.level >= 10) {
        if (sleutel.amountOfSleutels == 3) {
          scoreToevoegen.Totalscore();
          scoreToevoegen.Totaltime();
          level++;
          changeScherm.changeGameScherm();
        }
      }
    }
  }

  void movePlayer() {
    if (mazeGeneration.amountOfCellsVisited>= (mazeGeneration.mazeSizeX*mazeGeneration.mazeSizeY)) {

      if (key == CODED) {
        if (keyCode == UP) {
          playerstep=round(random(3)); //ASSIGNS A RANDOM NUMBER TO THE PRESS OF THE KEY
          if (playerstep == 0) { //CHECKS THE NUMBER ASSIGNED TO THE KEYPRESS
            assets.audioplayerstep1.trigger(); //TRIGGERS THE SOUND ATTACHED TO THE NUMBER ASSIGNED TO THE KEYPRESS
          } else if (playerstep == 1) {
            assets.audioplayerstep2.trigger();
          } else if (playerstep == 2) {
            assets.audioplayerstep3.trigger();
          } else if (playerstep == 3) {
            assets.audioplayerstep4.trigger();
          }
          if (playerChoice[0]) {
            playerMoveUp = true;
          }
          if (playerMoveUp) {
            playerY--;
            //playerSheetUp.draw(playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX, playerY*mazeGeneration.cellSize);
            playerMoveUp = false;

            for (int i = 0; i<playerChoice.length; i++) {
              playerChoice[i] = false;
            }
          }
        }
        if (keyCode == RIGHT) {
          playerstep=round(random(3));
          if (playerstep == 0) {
            assets.audioplayerstep1.trigger();
          } else if (playerstep == 1) {
            assets.audioplayerstep2.trigger();
          } else if (playerstep == 2) {
            assets.audioplayerstep3.trigger();
          } else if (playerstep == 3) {
            assets.audioplayerstep4.trigger();
          }
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
          playerstep=round(random(3));
          if (playerstep == 0) {
            assets.audioplayerstep1.trigger();
          } else if (playerstep == 1) {
            assets.audioplayerstep2.trigger();
          } else if (playerstep == 2) {
            assets.audioplayerstep3.trigger();
          } else if (playerstep == 3) {
            assets.audioplayerstep4.trigger();
          }
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
          playerstep=round(random(3));
          if (playerstep == 0) {
            assets.audioplayerstep1.trigger();
          } else if (playerstep == 1) {
            assets.audioplayerstep2.trigger();
          } else if (playerstep == 2) {
            assets.audioplayerstep3.trigger();
          } else if (playerstep == 3) {
            assets.audioplayerstep4.trigger();
          }
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
    if (key == 'x' && bombAmount >= 1 && schermen.welkScherm[1]) {
      bomb.changeBomb(playerX, playerY);
    }
  }
}
