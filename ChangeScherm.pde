/*
Deze class veranderd verschillende schermen
en herlaad de nodige functies
*/

class ChangeScherm {

  
  void changeMainMenu() {
    if (schermen.welkScherm[0]) {
      //  Z laat het eerste level
      if (key == 'z') {
        schermen.welkScherm[0] = false;
        schermen.welkScherm[1] = true;

        mazeGeneration.changeMazeGeneration(72, 10, 10);
        mazeGeneration.setWalls();
        player.changePlayer();
        player.level = 1;
        sleutel.changeSleutel();
        monster.changeMonster(60);
        eindDeur.changeEindDeur();
      }
    }
  }
  void changeGameScherm() {
    if (schermen.welkScherm[1]) {
     
      mazeGeneration.changeMazeGeneration(72, 10+player.level-1, 10);
      mazeGeneration.setWalls();
      player.changePlayer();
      sleutel.changeSleutel();
      monster.changeMonster(60);
      eindDeur.changeEindDeur();
    }
  } 
  void changeGameoverScherm() {
    if (schermen.welkScherm[2]) {
      if (key == 'z') {
        schermen.welkScherm[2] = false;
        schermen.welkScherm[0] = true;
      }
    }
  }
}
