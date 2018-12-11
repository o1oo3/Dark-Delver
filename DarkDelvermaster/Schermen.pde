/* //<>//
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
      image(assets.DDlogo1, CENTER-2, CENTER-2);
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

      player.checkPlayer();
      player.drawPlayer();
      monster.makeMonster();
      monster.drawMonster();
      sleutel.drawSleutel();
      keySheet.update();  
      playerSheet.update();
      monsterSheet.update();
      bombSheet.update();

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
    }
  }
}
