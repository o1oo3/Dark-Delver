/*
Deze class genereerd een random maze.
 */

class MazeGeneration {
  int cellSize;
  int mazeSizeX;
  int mazeSizeY;
  boolean[][] topWall;
  boolean[][] rightWall;
  boolean[][] bottomWall;
  boolean[][] leftWall;
  int currentX;
  int currentY;
  boolean[][] isVisited;
  int p;  
  int[]visitedListX;
  int[]visitedListY;
  boolean surroundendCellIsNotVisited;
  boolean[] picker;
  int amountOfCellsVisited;
  int offsetToCenterX;
  int offsetToCenterY;





  void changeMazeGeneration(int cellSize, int mazeSizeX, int mazeSizeY) {
    this.cellSize = cellSize;
    this.mazeSizeX = mazeSizeX;
    this.mazeSizeY = mazeSizeY;
    topWall = new boolean[mazeSizeX][mazeSizeY];
    rightWall = new boolean[mazeSizeX][mazeSizeY];
    bottomWall = new boolean[mazeSizeX][mazeSizeY];
    leftWall = new boolean[mazeSizeX][mazeSizeY];
    currentX = (int)random(0, mazeSizeX);
    currentY = (int)random(0, mazeSizeY);//(int)random(0, mazeSizeY);
    isVisited = new boolean[mazeSizeX][mazeSizeY];
    isVisited[currentX][currentY] = true;
    p = 0;
    visitedListX = new int[0];
    visitedListY = new int[0];
    surroundendCellIsNotVisited = false;
    picker = new boolean[4];
    amountOfCellsVisited = 1;
    offsetToCenterX = width-width/2-mazeSizeX*cellSize/2;
  }

  void setWalls() {

    for (int i = 0; i<mazeSizeX; i++) {

      for (int j = 0; j<mazeSizeY; j++) {
        topWall[i][j] = true;
        rightWall[i][j] = true;
        bottomWall[i][j] = true;
        leftWall[i][j] = true;
        //topWall[i][j] =false;
        //rightWall[i][j] = false;
        //bottomWall[i][j] = false;
        //leftWall[i][j] = false;
      }
    }
  }

  void drawWalls() {
    // fill(0);
    for (int r = 0; r<mazeSizeX; r++) {
      for (int q = 0; q<mazeSizeY; q++) {
        if (topWall[r][q]) {
          //   stroke(255, 0, 0); //RED
          //   line(r*cellSize+offsetToCenterX, q*cellSize, r*cellSize+cellSize+offsetToCenterX, q*cellSize);
          image(assets.imagemuurSpriteH, r*cellSize+offsetToCenterX, q*cellSize);
        }
        if (rightWall[r][q]) {
          //    stroke(0, 255, 0); //GREEN
          //  line(r*cellSize+cellSize+offsetToCenterX, q*cellSize, r*cellSize+cellSize+offsetToCenterX, q*cellSize+cellSize);
          image(assets.imagemuurSpriteV, r*cellSize+cellSize+offsetToCenterX, q*cellSize);
        }
        if (bottomWall[r][q]) {
          //   stroke(0, 0, 255); //BLUE
          //  line(r*cellSize+cellSize+offsetToCenterX, q*cellSize+cellSize, r*cellSize+offsetToCenterX, q*cellSize+cellSize);
          image(assets.imagemuurSpriteH, r*cellSize+offsetToCenterX, q*cellSize+cellSize-4);
        }
        if (leftWall[r][q]) {
          //  stroke(255, 255, 0); //YELLOW
          // line(r*cellSize+offsetToCenterX, q*cellSize+cellSize, r*cellSize+offsetToCenterX, q*cellSize);
          image(assets.imagemuurSpriteV, r*cellSize+offsetToCenterX-4, q*cellSize);
        }
      }
    }
    // rect(currentX*cellSize, currentY*cellSize, cellSize, cellSize);
  }
  boolean checkOutOfBounts(int currentX, int currentY) {
    if (currentX<0 || currentY<0 || currentX>mazeSizeX-1 || currentY>mazeSizeY-1) {
      return false;
    }
    return true;
  }

  void checkWalls() {

    if (checkOutOfBounts(currentX, currentY-1)) {
      if (isVisited[currentX][currentY-1] == false) {
        picker[0]=true;
        surroundendCellIsNotVisited = true;
      }
    }
    if (checkOutOfBounts(currentX+1, currentY)) {
      if (!(isVisited[currentX+1][currentY])) {
        picker[1]=true;
        surroundendCellIsNotVisited = true;
      }
    }
    if (checkOutOfBounts(currentX, currentY+1)) {
      if (!(isVisited[currentX][currentY+1])) {
        picker[2]=true;
        surroundendCellIsNotVisited = true;
      }
    }
    if (checkOutOfBounts(currentX-1, currentY)) {
      if (!(isVisited[currentX-1][currentY])) {
        picker[3]=true;
        surroundendCellIsNotVisited = true;
      }
    }
    if (surroundendCellIsNotVisited) {
      do {
        p = round(random(3));
      } while (picker[p]==false);


      if (p ==0) {
        isVisited[currentX][currentY-1]=true;
        topWall[currentX][currentY]=false;
        bottomWall[currentX][currentY-1]=false;
        currentY--;
        visitedListX = append(visitedListX, currentX);
        visitedListY = append(visitedListY, currentY);
        amountOfCellsVisited++;
      }
      if (p ==1) {
        isVisited[currentX+1][currentY]=true;
        rightWall[currentX][currentY]=false;
        leftWall[currentX+1][currentY]=false;
        currentX++;
        visitedListX = append(visitedListX, currentX);
        visitedListY = append(visitedListY, currentY);
        amountOfCellsVisited++;
      }
      if (p ==2) {
        isVisited[currentX][currentY+1]=true;
        bottomWall[currentX][currentY]=false;
        topWall[currentX][currentY+1]=false;
        currentY++;
        visitedListX = append(visitedListX, currentX);
        visitedListY = append(visitedListY, currentY);
        amountOfCellsVisited++;
      }
      if (p ==3) {
        isVisited[currentX-1][currentY]=true;
        leftWall[currentX][currentY]=false;
        rightWall[currentX-1][currentY]=false;
        currentX--;
        visitedListX = append(visitedListX, currentX);
        visitedListY = append(visitedListY, currentY);
        amountOfCellsVisited++;
      }
    }
    for (int i = 0; i<picker.length; i++) {
      picker[i] = false;
    }
    backtracker();
    surroundendCellIsNotVisited= false;
  }
  void backtracker() {

    if (surroundendCellIsNotVisited==false) {
      if (visitedListX.length != 0 || visitedListY.length != 0) {
        visitedListX = shorten(visitedListX);
        visitedListY = shorten(visitedListY);
      }
      if (visitedListX.length != 0 || visitedListY.length != 0) {

        currentX = visitedListX[visitedListX.length-1];
        currentY = visitedListY[visitedListY.length-1];
      }
    }
  }

  int getmazeSizeX() {
    return mazeSizeX;
  }
}
