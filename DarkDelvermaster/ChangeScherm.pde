/*
Deze class veranderd verschillende schermen
 en herlaad de nodige functies
 */

class ChangeScherm {


  void changeMainMenu() {
    if (schermen.welkScherm[0]) {
      //  Z laat het eerste level
      if (key == 'z') {        
        assets.menutheme.pause();
        assets.menutheme.rewind();
        assets.leveltheme.rewind();
        assets.leveltheme.play();
        schermen.welkScherm[0] = false;
        schermen.welkScherm[1] = true;

        mazeGeneration.changeMazeGeneration(72, 10, 10);
        mazeGeneration.setWalls();
        player.changePlayer();
        player.level = 1;
        sleutel.changeSleutel();
        monster.changeMonster(60);
        eindDeur.changeEindDeur();
        startTimer.min = 0;
        startTimer.s= 0;
        startTimer.ms = 0;
      }
    }
  }
  void changeGameScherm() {
    if (schermen.welkScherm[1]) {
      assets.victory.rewind();
      assets.victory.play();
      if (player.level < 8) {
        mazeGeneration.changeMazeGeneration(72, 10+player.level-1, 10);
      } else {
        mazeGeneration.changeMazeGeneration(72, 17, 10);
      }
      mazeGeneration.setWalls();
      player.changePlayer();
      sleutel.changeSleutel();
      monster.changeMonster(60);
      eindDeur.changeEindDeur();
    }
  } 
  void changeGameoverScherm() {
    if (schermen.welkScherm[2]) {      
      assets.leveltheme.pause();
      assets.leveltheme.rewind();
      assets.gameovertheme.rewind();     
      assets.gameovertheme.play();
      player.level = 0;
      //startTimer.min = 0;
      //startTimer.s = 0;
      //startTimer.ms = 0;
      if (key == 'z') {
        schermen.welkScherm[2] = false;
        schermen.welkScherm[0] = true;
      }
    }
  }
}
