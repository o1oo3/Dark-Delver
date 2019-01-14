//<>// //<>//
/*
deze class laat op verschillende schermen verschillende functies die nodig zijn om het spel te runnen. 
 */

class Schermen {
  boolean[] welkScherm;
  String text;

  Schermen() {
    welkScherm = new boolean[3];
    welkScherm[0] = true;
  }


  void mainMenu() {
    if (welkScherm[0]) {
      image(assets.imageDDlogo, CENTER-2, CENTER-2);
      text = "Press Z to Start";
      textAlign(CENTER);
      text(text, width/2, height-height/10);
    }
  }

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
      }
    }
  }
  void gameOverScherm() {
    if (welkScherm[2]) {
      image(assets.imageGameOver, CENTER-2, CENTER -2);
      fill(255, 255, 255);
      text("Place    Name      score      level        time", width/2, height/2.5);   
      textSize(20);
      for (int iScore = 0; iScore<highscores.getScoreCount(); iScore++) {     
        if (iScore >= 14) break;  //shows top 15 scores   
        Score score = highscores.getScore(iScore); //fetch a score from the list     
        text((iScore+1) + "          "+ score.name + "        " + score.totalScore + "   " + score.endlevel + "     " + score.totalTime, width/2, height/2.3 + iScore*20);     //display score
      }
    }
  }
}
