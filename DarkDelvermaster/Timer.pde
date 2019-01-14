class Timer {
  int ms;
  int s;
  int min;
  int levelms;
  int levelsec;
  int levelmin;

  float Time;

  Timer (float set) {
    Time = set;
  }
  float getTime() {
    return(Time);
  }
  void setTime(float set) {
    Time = set;
  }

  void countUp() {
    if ((keyCode == LEFT || keyCode == DOWN || keyCode == RIGHT || keyCode == UP)|| key == 'x' || key == 'z') {
      fill(255);

      if (ms<=59 || levelms<=59) {
        //text(h + ":" + min, width/2, 30);
        ms = ms + 1;
        levelms =levelms +1;
      } else {
        s = s + 1;
        levelsec = levelsec + 1;
        levelms = 0;
        ms = 0;
      }
      if (s<=9) {
        text(min + " : " + 0 + s, width / 2, 30);
        ms = ms + 1;
      } else if (s<=59) {
        text(min + " : " + s, width / 2, 30);
        ms = ms + 1;
      } else { 
        min = min + 1;
        s = 0;
        text(min + " : " + 0 + s, width / 2, 30);
        ms = ms + 1;
      }
    }
    if (levelsec >= 60){
      levelmin = levelmin + 1;
      levelsec = 0;
    }
  }
}
