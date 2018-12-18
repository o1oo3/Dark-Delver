/*
Deze class veranderd verschillende schermen
 en herlaad de nodige functies
 */

class ChangeScherm {


  void changeMainMenu() {
    if (schermen.welkScherm[0]) {
      //  Z laat het eerste level
      if (key == 'z') {        
        assets.audiomenutheme.pause();
        assets.audiomenutheme.rewind();
        assets.audioleveltheme.rewind();
        assets.audioleveltheme.play();
        schermen.welkScherm[0] = false;
        schermen.welkScherm[1] = true;

        mazeGeneration.changeMazeGeneration(72, 10, 10);
        mazeGeneration.setWalls();
        player.changePlayer();
        player.level = 1;
        sleutel.changeSleutel(); //UPDATES THE INFORMATION FOR INDIVIDUAL KEYS, SUCH AS LOCATION.
        sleutel2.changeSleutel(); 
        sleutel3.changeSleutel();
        monster.changeMonster(60); //UPDATES THE INFORMATION FOR INDIVIDUAL MONSTERS, SUCH AS START LOCATION AND PROXIMITY TO EACH OTHER AND THE PLAYER.
        monster2.changeMonster(60);
        monster3.changeMonster(45); // THE NUMBER BETWEEN THE CONSTRUCTOR IS THE FREQUENCY AT WHICH THE MONSTER MAKES DECISIONS, IN THIS CASE EVERY 45 FRAMES.
        eindDeur.changeEindDeur();
        startTimer.min = 0;
        startTimer.s= 0;
        startTimer.ms = 0;
        
      }
    }
  }
  void changeGameScherm() {
    if (schermen.welkScherm[1]) {
      assets.audiovictory.rewind();
      assets.audiovictory.play();

      if (player.level < 8) {
        mazeGeneration.changeMazeGeneration(72, 10+player.level-1, 10);
      } else {
        mazeGeneration.changeMazeGeneration(72, 17, 10);
      }
      mazeGeneration.setWalls();
      player.changePlayer();
      sleutel.changeSleutel(); //UPDATES THE INFORMATION FOR INDIVIDUAL KEYS, SUCH AS LOCATION.
      sleutel2.changeSleutel();
      sleutel3.changeSleutel();
      monster.changeMonster(60); //UPDATES THE INFORMATION FOR INDIVIDUAL MONSTERS, SUCH AS START LOCATION AND PROXIMITY TO EACH OTHER AND THE PLAYER.
      monster2.changeMonster(60);
      monster3.changeMonster(45); // THE NUMBER BETWEEN THE CONSTRUCTOR IS THE FREQUENCY AT WHICH THE MONSTER MAKES DECISIONS, IN THIS CASE EVERY 45 FRAMES.
      eindDeur.changeEindDeur();
    }
  } 
  void changeGameoverScherm() {
    if (schermen.welkScherm[2]) {      
      assets.audioleveltheme.pause();
      assets.audioleveltheme.rewind();
      assets.audiogameovertheme.rewind();     
      assets.audiogameovertheme.play();
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
