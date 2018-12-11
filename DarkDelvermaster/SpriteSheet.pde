// Spritesheet class voor animaties
class SpriteSheet {

  //De image bevat de frames en het plaatje om te tekenen
  PImage sourceImage, drawImage;
  int fps = 5;
  int frame = 0;
  int frameWidth;
  int frameHeight;
  int nFrames = 0;


  // Contructor neemt naam, image source en de nummer/hoeveelheid frames
  SpriteSheet(String imageName, int nFrames) {
    sourceImage = loadImage(imageName);
    this.nFrames = nFrames;
    frameWidth = sourceImage.width/nFrames;
    frameHeight = sourceImage.height;
    drawImage = createImage(frameWidth, sourceImage.height, ARGB);
  }



  // update() selecteert de image om te teken gebasseerd op fps en frames al getekend
  void update() {
    if ((frameCount % fps) == 0)    
      frame =  (frame + 1) % nFrames;

    drawImage.copy(sourceImage, 
      frame*frameWidth, 0, frameWidth, sourceImage.height, 
      0, 0, frameWidth, sourceImage.height);
  }
  void draw(float x, float y) {
    image(drawImage, x, y);
  }
}
