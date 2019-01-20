//<>// //<>//
/*
deze class laat op verschillende schermen verschillende functies die nodig zijn om het spel te runnen. 
 */

class Schermen {
  boolean[] welkScherm;
  String text;

  Schermen() {
    welkScherm = new boolean[4];
    welkScherm[0] = true;
  }

/*
This method is always called in the draw() method
and makes the mainmenu show*/
  void mainMenu() {
    if (welkScherm[0]) {
      image(assets.imageDDlogo, CENTER-2, CENTER-2);
      text = "Press Z to Start";
      textAlign(CENTER);
      text(text, width/2, height-height/10);
    }
  }
/*
this Method is always called in draw 
and it draws all the components of the game*/
  void gameScherm() {
    if (welkScherm[1]) {
      mazeGeneration.checkWalls();
      mazeGeneration.drawWalls();
      eindDeur.drawEindDeur();
      bomb.drawBomb();
      player.checkPlayer();
      player.drawPlayer();
      particleflame.run();
      monster.makeMonster(); //MAKES SURE THE MONSTER IS ABLE TO MOVE ALONG WITH THE ALGORITHM
      monster.drawMonster(); //MAKES SURE THE MONSTER HAS AN IMAGE ON THE SCREEN
      if (player.level >= 5) { //CHECKS WETHER THE LEVEL IS APPROPRIATELY HIGH TO CREATE A NEW MONSTER
        monster2.makeMonster();
        monster2.drawMonster();
      }
      if (player.level >= 10) {
        monster3.makeMonster();
        monster3.drawMonster();
      }

      sleutel.drawSleutel(); //MAKES SURE THE KEY IS VISIBLE ON THE SCREEN
      if (player.level >= 5) { //CHECKS WETHER THE LEVEL IS APPROPRIATELY HIGH TO CREATE A NEW KEY
        sleutel2.drawSleutel();
      }
      if (player.level >= 10) {
        sleutel3.drawSleutel();
      }
      keySheet.update();  
      playerSheetDown.update();
      playerSheetUp.update();
      playerSheetLeft.update();
      playerSheetRight.update();
      monsterSheetDown.update();
      monsterSheetUp.update();
      monsterSheetLeft.update();
      monsterSheetRight.update();
      bomb.explodeBomb();
      explosionSheet.update();

      bombSheet.update();
      startTimer.countUp();

      if (mazeGeneration.amountOfCellsVisited< (mazeGeneration.mazeSizeX*mazeGeneration.mazeSizeY)) {
        fill(0);
        rect(0, 0, width, height);
        fill(255);
        text = "Loading";
        textAlign(CENTER);
        text(text, width/2, height/2);
        text = "Level ";
        text(text+player.level, width/2, height/4);
        if (player.level >= 2) {
          text = "Score ";
          text(text + scoreToevoegen.totalScore, width/2, height/3);
        }
      }
    }
  }
  /*
  this Method is always called in draw 
  and it shows the highscore when you are gameover
  */
  void gameOverScherm() {
    if (welkScherm[2]) {
      image(assets.imageGameOver, CENTER-2, CENTER -2);
      fill(255, 255, 255);


      textSize(20);


      text("Place", width/2-200, height/2.5);
      text("Name", width/2-100, height/2.5);
      text("Score", width/2, height/2.5);
      text("Level", width/2+100, height/2.5);
      text("Time", width/2+200, height/2.5);
      textAlign(CENTER);
      //text("Place    Name      score      level        time", width/2, height/2.5);   
      for (int iScore = 0; iScore<highscores.getScoreCount(); iScore++) {     
        if (iScore >= 14) break;  //shows top 15 scores   
        Score score = highscores.getScore(iScore); //fetch a score from the list    
        textAlign(CENTER, CENTER);
        text((iScore+1), width/2-200, height/2.5+(iScore+1)*20);
        text((score.name), width/2-100, height/2.5+(iScore+1)*20);
        text((score.totalScore), width/2, height/2.5+(iScore+1)*20);
        text((score.endlevel), width/2+100, height/2.5+(iScore+1)*20);
        text((score.totalTime), width/2+200, height/2.5+(iScore+1)*20);



        // text((iScore+1) + "       "+ score.name + "            " + score.totalScore + "            " + score.endlevel + "                 " + score.totalTime, width/2, height/2.3 + iScore*20);     //display score
      }
      textSize(32);
    }
  }
  /*
  this method is always called in the draw() method
  and lets user add their names to their score*/
  void nameInputScherm() {
    if (welkScherm[3]) {
      scoreToevoegen.state = scoreToevoegen.stateInput;
      image(assets.imageGameOver, CENTER-2, CENTER -2);
      //fill(255, 0, 0);
      // textSize(20);
      //text("Enter your name", 200, 100);
      // text("Use left, right, upper and down keys", 200, 200);
      textSize(80);

      int i=0;
      for (char c : scoreToevoegen.letters) {
        fill(255, 0, 0);
        if (i==scoreToevoegen.index)
          fill(255);
        text(char(scoreToevoegen.letters[i])+"", width/2.5+i*65, height/2);
        i++;
      }
    }
  }
}
