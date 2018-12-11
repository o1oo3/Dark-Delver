/*
Deze class laadt alle assets die worden gebruikt in de game.
 */


class LoadAssets {
  AudioPlayer menutheme; /*CREATES DIFFERENT CODES FOR EACH SOUNDFILE FOR EASE OF INSERTING INTO OTHER CLASSES*/
  AudioPlayer leveltheme;
  AudioPlayer chasetheme;
  AudioPlayer gameovertheme;
  AudioSample keypickup;
  AudioPlayer audio5a;
  AudioPlayer audio6a;
  AudioPlayer audio7a;
  AudioPlayer audio8a;
  AudioPlayer audio9a;
  AudioSample monsterstep1;
  AudioSample monsterstep1left;
  AudioSample monsterstep1right;
  AudioSample monsterstep2;
  AudioSample monsterstep2left;
  AudioSample monsterstep2right;
  AudioSample monsterstep3;
  AudioSample monsterstep3left;
  AudioSample monsterstep3right;
  AudioSample monsterstep4;
  AudioSample monsterstep4left;
  AudioSample monsterstep4right;
  AudioSample monsternotice;
  AudioSample monsternoticeleft;
  AudioSample monsternoticeright;
  AudioSample playerstep1;
  AudioSample playerstep2;
  AudioSample playerstep3;
  AudioSample playerstep4;
  AudioSample playerstep5;
  AudioPlayer victory;

  PImage playerSprite;
  PImage muurSpriteV;
  PImage muurSpriteH;
  PImage sleutelSprite;
  PImage eDeur;
  PImage monsterSprite;
  PImage[] background;
  PImage Background00;
  PImage Background01;
  PImage Background02;
  PImage Background03;
  PImage Background04;
  PImage Background05;
  PImage Background06;
  PImage Background07;
  PImage Licht;
  PFont pixeled;
  PImage Start;
  PImage Retry;
  PImage Nextlvl;
  PImage Exit;
  PImage DDlogo1;




  LoadAssets() { /*ATTACHES AN MP3 FILE TO THE ABOVE CREATED CODES*/
    menutheme = minim.loadFile("Main menu theme.mp3");
    leveltheme = minim.loadFile("Leveltheme.mp3"); 
    chasetheme = minim.loadFile("ChasedbyMonster.mp3");
    gameovertheme = minim.loadFile("game over jingle.mp3");
    keypickup = minim.loadSample("Keypickupsound.mp3");
    audio5a = minim.loadFile("Monsterchase.mp3");
    audio6a = minim.loadFile("Monsterchaseleft.mp3");
    audio7a = minim.loadFile("Monsterchaseright.mp3");
    audio8a = minim.loadFile("Monsterkill.mp3");
    audio9a = minim.loadFile("Monsterkillnogore.mp3");
    monsterstep1 = minim.loadSample("monstermove1.mp3");
    monsterstep1left = minim.loadSample("monstermove1left.mp3");
    monsterstep1right = minim.loadSample("monstermove1right.mp3");
    monsterstep2 = minim.loadSample("monstermove2.mp3");
    monsterstep2left = minim.loadSample("monstermove2left.mp3");
    monsterstep2right = minim.loadSample("monstermove2right.mp3");
    monsterstep3 = minim.loadSample("monstermove3.mp3");
    monsterstep3left = minim.loadSample("monstermove3left.mp3");
    monsterstep3right = minim.loadSample("monstermove3right.mp3");
    monsterstep4 = minim.loadSample("monstermove4.mp3");
    monsterstep4left = minim.loadSample("monstermove4left.mp3");
    monsterstep4right = minim.loadSample("monstermove4right.mp3");
    monsternotice = minim.loadSample("monsternotice.mp3");
    monsternoticeleft = minim.loadSample("monsternoticeleft.mp3");
    monsternoticeright = minim.loadSample("monsternoticeright.mp3");
    playerstep1 = minim.loadSample("playerstep1.wav");
    playerstep2 = minim.loadSample("playerstep2.wav");
    playerstep3 = minim.loadSample("playerstep3.wav");
    playerstep4 = minim.loadSample("playerstep4.wav");
    playerstep5 = minim.loadSample("playerstep5.wav");
    victory = minim.loadFile("Victory!.mp3");
    //playerSprite = loadImage("Howdy clone.png");

    muurSpriteV = loadImage("MuurConceptV.png");
    muurSpriteH = loadImage("MuurConceptH.png");
    eDeur = loadImage("Deur.png");
    //sleutelSprite = loadImage("Key.png");
    //monsterSprite = loadImage("Monster.png");
    background = new PImage[8]; 
    background[0] = loadImage("Background00.png");
    background[1] = loadImage("Background01.png");
    background[2] = loadImage("Background02.png");
    background[3] = loadImage("Background03.png");
    background[4] = loadImage("Background04.png");
    background[5] = loadImage("Background05.png");
    background[6] = loadImage("Background06.png");
    background[7] = loadImage("Background07.png");
    Licht = loadImage("Licht.png");
    pixeled = createFont("Pixeled.ttf", 32);
    Start = loadImage("Start.png");
    Retry = loadImage("Retry.png");
    Nextlvl = loadImage("Next Level.png");
    Exit = loadImage("Exit.png");
    DDlogo1 = loadImage("DD logo1.png");
    keySheet = new SpriteSheet("Key.png", 11);
    playerSheet = new SpriteSheet("Howdy clone.png", 6);
    monsterSheet = new SpriteSheet("Monster.png", 8);
  }
}
