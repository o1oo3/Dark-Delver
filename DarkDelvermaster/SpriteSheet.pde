// Spritesheet class for animations
class SpriteSheet {

  //Image contains the frames for drawing.
  PImage sourceImage, drawImage;
  int fps = 5;
  int frame = 0;
  int frameWidth;
  int frameHeight;
  int nFrames = 0;


  //Constructor uses name, image source and the number of frames.
  SpriteSheet(String imageName, int nFrames) {
    sourceImage = loadImage(imageName);
    this.nFrames = nFrames;
    frameWidth = sourceImage.width/nFrames;
    frameHeight = sourceImage.height;
    drawImage = createImage(frameWidth, sourceImage.height, ARGB);
  }



  // update() selects the image to draw based on fps and frames (already drawn)
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
