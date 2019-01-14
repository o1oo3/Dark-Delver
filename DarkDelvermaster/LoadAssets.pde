
/*
Deze class laadt alle assets die worden gebruikt in de game.
 */


class LoadAssets {
  AudioPlayer audiomenutheme; /*CREATES DIFFERENT CODES FOR EACH SOUNDFILE FOR EASE OF INSERTING INTO OTHER CLASSES*/
  AudioPlayer audioleveltheme;
  AudioPlayer audiochasetheme;
  AudioPlayer audiogameovertheme;
  AudioSample audiokeypickup;
  AudioPlayer audiomonsterchasestep;
  AudioPlayer audiomonsterchasestepleft;
  AudioPlayer audiomonsterchasestepright;
  AudioPlayer audiomonsterkill;
  AudioPlayer audiomonsterkillnogore;
  AudioSample audiomonsterstep1;
  AudioSample audiomonsterstep1left;
  AudioSample audiomonsterstep1right;
  AudioSample audiomonsterstep2;
  AudioSample audiomonsterstep2left;
  AudioSample audiomonsterstep2right;
  AudioSample audiomonsterstep3;
  AudioSample audiomonsterstep3left;
  AudioSample audiomonsterstep3right;
  AudioSample audiomonsterstep4;
  AudioSample audiomonsterstep4left;
  AudioSample audiomonsterstep4right;
  AudioSample audiomonsternotice;
  AudioSample audiomonsternoticeleft;
  AudioSample audiomonsternoticeright;
  AudioSample audioplayerstep1;
  AudioSample audioplayerstep2;
  AudioSample audioplayerstep3;
  AudioSample audioplayerstep4;
  AudioSample audioplayerstep5;
  AudioPlayer audiovictory;
  AudioSample audioBomb;

  PImage imageplayerSprite;
  PImage imagemuurSpriteV;
  PImage imagemuurSpriteH;
  PImage imagesleutelSprite;
  PImage imageDoor;
  PImage imagemonsterSprite;
  PImage imageGameOver;
  PImage[] imagebackground;
  PImage imageBackground00;
  PImage imageBackground01;
  PImage imageBackground02;
  PImage imageBackground03;
  PImage imageBackground04;
  PImage imageBackground05;
  PImage imageBackground06;
  PImage imageBackground07;
  PImage imageLight;
  PFont fontpixeled;
  PImage imageStart;
  PImage imageRetry;
  PImage imageNextlvl;
  PImage imageExit;
  PImage imageDDlogo;
  PImage imageBombStatikk;
  //PImage imageBombExplosion;



  LoadAssets() { /*ATTACHES AN MP3 FILE TO THE ABOVE CREATED CODES*/
    audiomenutheme = minim.loadFile("Main menu theme.mp3");
    audioleveltheme = minim.loadFile("Leveltheme.mp3"); 
    audiochasetheme = minim.loadFile("ChasedbyMonster.mp3");
    audiogameovertheme = minim.loadFile("game over jingle.mp3");
    audiokeypickup = minim.loadSample("Keypickupsound.mp3");
    audiomonsterchasestep = minim.loadFile("Monsterchase.mp3");
    audiomonsterchasestepleft = minim.loadFile("Monsterchaseleft.mp3");
    audiomonsterchasestepright = minim.loadFile("Monsterchaseright.mp3");
    audiomonsterkill = minim.loadFile("Monsterkill.mp3");
    audiomonsterkillnogore = minim.loadFile("Monsterkillnogore.mp3");
    audiomonsterstep1 = minim.loadSample("monstermove1.mp3");
    audiomonsterstep1left = minim.loadSample("monstermove1left.mp3");
    audiomonsterstep1right = minim.loadSample("monstermove1right.mp3");
    audiomonsterstep2 = minim.loadSample("monstermove2.mp3");
    audiomonsterstep2left = minim.loadSample("monstermove2left.mp3");
    audiomonsterstep2right = minim.loadSample("monstermove2right.mp3");
    audiomonsterstep3 = minim.loadSample("monstermove3.mp3");
    audiomonsterstep3left = minim.loadSample("monstermove3left.mp3");
    audiomonsterstep3right = minim.loadSample("monstermove3right.mp3");
    audiomonsterstep4 = minim.loadSample("monstermove4.mp3");
    audiomonsterstep4left = minim.loadSample("monstermove4left.mp3");
    audiomonsterstep4right = minim.loadSample("monstermove4right.mp3");
    audiomonsternotice = minim.loadSample("monsternotice.mp3");
    audiomonsternoticeleft = minim.loadSample("monsternoticeleft.mp3");
    audiomonsternoticeright = minim.loadSample("monsternoticeright.mp3");
    audioplayerstep1 = minim.loadSample("playerstep1.wav");
    audioplayerstep2 = minim.loadSample("playerstep2.wav");
    audioplayerstep3 = minim.loadSample("playerstep3.wav");
    audioplayerstep4 = minim.loadSample("playerstep4.wav");
    audioplayerstep5 = minim.loadSample("playerstep5.wav");
    audiovictory = minim.loadFile("Victory!.mp3");
    audioBomb = minim.loadSample("Bombsound.mp3");

    imagemuurSpriteV = loadImage("MuurConceptV.png");
    imagemuurSpriteH = loadImage("MuurConceptH.png");
    imageDoor = loadImage("Deur.png");
    imagebackground = new PImage[8]; 
    imagebackground[0] = loadImage("Background00.png");
    imagebackground[1] = loadImage("Background01.png");
    imagebackground[2] = loadImage("Background02.png");
    imagebackground[3] = loadImage("Background03.png");
    imagebackground[4] = loadImage("Background04.png");
    imagebackground[5] = loadImage("Background05.png");
    imagebackground[6] = loadImage("Background06.png");
    imagebackground[7] = loadImage("Background07.png");
    imageLight = loadImage("Licht.png");
    fontpixeled = createFont("Pixeled.ttf", 32);
    imageStart = loadImage("Start.png");
    imageRetry = loadImage("Retry.png");
    imageExit = loadImage("Exit.png");
    imageDDlogo = loadImage("DDlogo.png");
    keySheet = new SpriteSheet("Key.png", 11);
    playerSheetDown = new SpriteSheet("playerSpriteDown.png", 6);
    playerSheetLeft = new SpriteSheet("playerSpriteLeft.png", 6);
    playerSheetRight = new SpriteSheet("playerSpriteRight.png", 6);
    playerSheetUp = new SpriteSheet("playerSpriteUp.png", 6);
    monsterSheetDown = new SpriteSheet("monsterSpriteDown.png", 8);
    monsterSheetLeft = new SpriteSheet("monsterSpriteLeft.png", 8);
    monsterSheetRight = new SpriteSheet("monsterSpriteRight.png", 8);
    monsterSheetUp = new SpriteSheet("monsterSpriteUp.png", 8);
    bombSheet = new SpriteSheet("Bomb.png", 8);
    explosionSheet = new SpriteSheet("Explosie.png", 6);
    imageBombStatikk = loadImage("BombStatikk.png");
    imageGameOver = loadImage("GameOver.png");
    

  }
}
