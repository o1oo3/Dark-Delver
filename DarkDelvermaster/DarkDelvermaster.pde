
/*
Made by:
 Oscar Oosterling 500775970
 Coen Veenker 500779784
 Tristan Derriks 500754707
 Hajk Grigorian 500741588
 IG101-3 2018/2019
 Project FastenYourSeatbelts
 
 Dark Delver
 This is a game where a player needs to find a key and get to the exit while a monster is roaming around 
 */

import java.util.*;
import ddf.minim.*;
Minim minim;
LoadAssets assets;

MazeGeneration mazeGeneration;
Player player;
FlameSystem particleflame;
Monster monster;
Monster monster2;
Monster monster3;
Sleutel sleutel;
Sleutel sleutel2;
Sleutel sleutel3;
EindDeur eindDeur;
Bomb bomb;
Schermen schermen;
ChangeScherm changeScherm;
SpriteSheet keySheet;
SpriteSheet playerSheetDown;
SpriteSheet monsterSheetDown;
SpriteSheet bombSheet;
SpriteSheet playerSheetLeft;
SpriteSheet playerSheetRight;
SpriteSheet playerSheetUp;
SpriteSheet monsterSheetLeft;
SpriteSheet monsterSheetRight;
SpriteSheet monsterSheetUp;
SpriteSheet explosionSheet;
ScoreList highscores;
Score scoreToevoegen;
Timer startTimer;



void setup() {
  size(1280, 720);
  mazeGeneration = new MazeGeneration();
  player = new Player();
  particleflame = new FlameSystem(new PVector(width/2, 50));
  monster = new Monster(); //CALLS THE METHOD FOR CREATING A MONSTER
  monster2 = new Monster();
  monster3 = new Monster();
  sleutel= new Sleutel(); //CALLS THE METHOD FOR CREATING A KEY
  sleutel2 = new Sleutel();
  sleutel3 = new Sleutel();
  eindDeur = new EindDeur();
  bomb = new Bomb();
  schermen = new Schermen();
  changeScherm = new ChangeScherm();
  minim = new Minim(this);
  assets = new LoadAssets();
  highscores = new ScoreList();
  startTimer = new Timer(0);
  scoreToevoegen = new Score("0", 0, 0, "00;00");
  assets.audiomenutheme.rewind();
  assets.audiomenutheme.loop();
  textFont(assets.fontpixeled);
  for (int i=0; i<scoreToevoegen.letters.length; i++) {
    scoreToevoegen.letters[i]='A';
   }
}
void draw() {
  PImage background = assets.imagebackground[0];
  for (int i=0; i<player.level; i++) {
    if (i<8) {
      background =assets.imagebackground[i];
    }
  }

  background(background);
  particleflame.addParticle();
  schermen.mainMenu();
  schermen.gameScherm();
  schermen.gameOverScherm();
  schermen.nameInputScherm();
}

void keyPressed() {
  player.movePlayer();
  changeScherm.changeMainMenu();
  changeScherm.changeGameoverScherm();
  player.playerBomb();
  scoreToevoegen.Nameinput();
}
void keyReleased() {
  player.stopPlayer();
}
