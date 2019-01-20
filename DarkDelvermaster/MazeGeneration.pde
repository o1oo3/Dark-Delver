/*
This class generates a random maze with the help of a recursive backtracking algorithm
 The algorithm works as follows:
 1. Make the initial cell the current cell and mark it as visited
 2. While there are unvisited cells
 -2.1. If the current cell has any neighbours which have not been visited
 --2.1.1 Choose randomly one of the unvisited neighbours
 --2.1.2 Push the current cell to the stack
 --2.1.3 Remove the wall between the current cell and the chosen cell
 --2.1.4 Make the chosen cell the current cell and mark it as visited
 -2.2. Else if stack is not empty
 --2.2.1 Pop a cell from the stack
 --2.2.2 Make it the current cell
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




  /*
The method changeMazeGeneration sets the start values for every new maze.
   */
  void changeMazeGeneration(int cellSize, int mazeSizeX, int mazeSizeY) {
    this.cellSize = cellSize;
    this.mazeSizeX = mazeSizeX;
    this.mazeSizeY = mazeSizeY;
    topWall = new boolean[mazeSizeX][mazeSizeY];
    rightWall = new boolean[mazeSizeX][mazeSizeY];
    bottomWall = new boolean[mazeSizeX][mazeSizeY];
    leftWall = new boolean[mazeSizeX][mazeSizeY];
    currentX = (int)random(0, mazeSizeX);// here the first cell gets a random  X value
    currentY = (int)random(0, mazeSizeY);// here the first cell gets a random  Y value
    isVisited = new boolean[mazeSizeX][mazeSizeY];
    isVisited[currentX][currentY] = true;// the current cell gets set as visited see 1. above
    p = 0;
    visitedListX = new int[0];
    visitedListY = new int[0];
    surroundendCellIsNotVisited = false;
    picker = new boolean[4];
    amountOfCellsVisited = 1;
    offsetToCenterX = width-width/2-mazeSizeX*cellSize/2;
  }
  /*
The method setWalls makes every wall of every cell active/true
   this is necessary to have them removed later to create the maze path
   */
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

  /*
the method drawWalls draws all the walls that are set to 'true'
   */
  void drawWalls() {
    // fill(0);
    for (int r = 0; r<mazeSizeX; r++) {
      for (int q = 0; q<mazeSizeY; q++) {
        if (topWall[r][q]) {
          image(assets.imagemuurSpriteH, r*cellSize+offsetToCenterX, q*cellSize);
        }
        if (rightWall[r][q]) {
          image(assets.imagemuurSpriteV, r*cellSize+cellSize+offsetToCenterX, q*cellSize);
        }
        if (bottomWall[r][q]) {
          image(assets.imagemuurSpriteH, r*cellSize+offsetToCenterX, q*cellSize+cellSize-4);
        }
        if (leftWall[r][q]) {
          image(assets.imagemuurSpriteV, r*cellSize+offsetToCenterX-4, q*cellSize);
        }
      }
    }
  }
  /*
 the method checkOutOfBounts checks if the current cells neighbouring cells is outside of the maze
   */
  boolean checkOutOfBounts(int currentX, int currentY) {
    if (currentX<0 || currentY<0 || currentX>mazeSizeX-1 || currentY>mazeSizeY-1) {
      return false;
    }
    return true;
  }
  /*
the method checkWalls checks for each wall with the checkOutOfBounts method and then checks if that neighbouring cell is already visited or not.
   if it is not visited it gets added to an array where is chosen at random.
   when a neighbouring cell is selected it removes the walls between the current cell and the neighbouring cell
   and adds the current cell to the stack and marks it visited and then makes the neighbouring cell the new current cell.
   
   when there is no unvisited cell around the current cell the backtracker method is called.
   */
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
  /*
  the method backtracker only activates when the current cell has no unvisited cells
   if this happens the visitedlist X & Y gets set back by 1 with the shorten function
   the current X & Y gets set to the visitedlist X & Y that have been set back.
   */
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
}
