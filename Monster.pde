class Monster {
  boolean monsterCameFromTop=false;
  boolean monsterCameFromRight=false;
  boolean monsterCameFromDown=false;
  boolean monsterCameFromLeft=false;

  int[] monsterCurrentCellSituation = new int [52];
  int monsterChosenDirection = 0;


  void makemonster() {
    assets.audio0b.rewind();
    assets.audio3b.rewind();
    assets.audio6b.rewind();
    assets.audio9b.rewind();

    /*CODE FOR ALL POSSIBLE SITUATIONS IN RELATION TO ONSTER LOCATION AND OPEN PATHS*/
    /*Mazegrid.(position)Wall DENOTES WHICH SIDE IS CLOSED OFF WITH A WALL (1) OR OPEN (2)*/
    /*monsterCameFrom(x) DENOTES WHICH DIRECTION THE MONSTER CAME FROM AND IS NOT ALLOWED TO GO BACK TO UNLESS ALL OTHER DIRECTIONS ARE SET TO Mazegrid.(position)Wall == 1*/
    if (Mazegrid.topWall[monsterx][monstery] == 0 
      && monsterCameFromTop == false) {
      monsterCurrentCellSituation[0] = 1;
    } else if (Mazegrid.rightWall[monsterx][monstery] == 0 
      && monsterCameFromRight == false) {
      monsterCurrentCellSituation[1] = 1;
    } else if (Mazegrid.bottomWall[monsterx][monstery] == 0 
      && monsterCameFromDown == false) {
      monsterCurrentCellSituation[2] = 1;
    } else if (Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromLeft == false) {
      monsterCurrentCellSituation[3] = 1;
    } 
    if (Mazegrid.topWall[monsterx][monstery] == 1 
      && Mazegrid.leftWall[monsterx][monstery] == 1 
      && Mazegrid.rightWall[monsterx][monstery] == 1 
      && monsterCameFromDown != false) {
      monsterCurrentCellSituation[4] = 1;
    } 
    if (Mazegrid.rightWall[monsterx][monstery] == 1 
      && Mazegrid.topWall[monsterx][monstery] == 1 
      && Mazegrid.bottomWall[monsterx][monstery] == 1  
      && monsterCameFromLeft != false) {
      monsterCurrentCellSituation[5] = 1;
    } 
    if (Mazegrid.bottomWall[monsterx][monstery] == 1 
      && Mazegrid.leftWall[monsterx][monstery] == 1 
      && Mazegrid.rightWall[monsterx][monstery] == 1  
      && monsterCameFromTop != false) {
      monsterCurrentCellSituation[6] = 1;
    } 
    if (Mazegrid.leftWall[monsterx][monstery] == 1 
      && Mazegrid.topWall[monsterx][monstery] == 1 
      && Mazegrid.bottomWall[monsterx][monstery] == 1 
      && monsterCameFromRight != false) {
      monsterCurrentCellSituation[7] = 1;
    }
    if (Mazegrid.topWall[monsterx][monstery] == 1 
      && Mazegrid.leftWall[monsterx][monstery] == 1 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && monsterCameFromDown != false) {
      monsterCurrentCellSituation[8] = 1; //right
    } 
    if (Mazegrid.topWall[monsterx][monstery] == 1 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 1 
      && monsterCameFromDown != false) {
      monsterCurrentCellSituation[9] = 1; //left
    } 
    if (Mazegrid.rightWall[monsterx][monstery] == 1 
      && Mazegrid.topWall[monsterx][monstery] == 1 
      && Mazegrid.bottomWall[monsterx][monstery] == 0  
      && monsterCameFromLeft != false) {
      monsterCurrentCellSituation[10] = 1; //go down
    } 
    if (Mazegrid.rightWall[monsterx][monstery] == 1 
      && Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 1  
      && monsterCameFromLeft != false) {
      monsterCurrentCellSituation[11] = 1; //up
    } 
    if (Mazegrid.bottomWall[monsterx][monstery] == 1 
      && Mazegrid.leftWall[monsterx][monstery] == 1 
      && Mazegrid.rightWall[monsterx][monstery] == 0  
      && monsterCameFromTop != false) {
      monsterCurrentCellSituation[12] = 1; //right
    } 
    if (Mazegrid.bottomWall[monsterx][monstery] == 1 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 1  
      && monsterCameFromTop != false) {
      monsterCurrentCellSituation[13] = 1; //left
    } 
    if (Mazegrid.leftWall[monsterx][monstery] == 1 
      && Mazegrid.topWall[monsterx][monstery] == 1 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && monsterCameFromRight != false) {
      monsterCurrentCellSituation[14] = 1; //down
    } 
    if (Mazegrid.leftWall[monsterx][monstery] == 1 
      && Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 1 
      && monsterCameFromRight != false) {
      monsterCurrentCellSituation[15] = 1; //up
    } 
    if (Mazegrid.topWall[monsterx][monstery] == 1 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && monsterCameFromDown != false) {
      monsterCurrentCellSituation[16] = 1; //right crossroad wall top from bottom
    } 
    if (Mazegrid.topWall[monsterx][monstery] == 1 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && monsterCameFromDown != false) {
      monsterCurrentCellSituation[17] = 1; //left CrossRoad wall top from bottom
    } 
    if (Mazegrid.rightWall[monsterx][monstery] == 1 
      && Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0  
      && monsterCameFromLeft != false) {
      monsterCurrentCellSituation[18] = 1; //go down CR wall right from left
    } 
    if (Mazegrid.rightWall[monsterx][monstery] == 1 
      && Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0  
      && monsterCameFromLeft != false) {
      monsterCurrentCellSituation[19] = 1; //up CR wall right from left
    } 
    if (Mazegrid.bottomWall[monsterx][monstery] == 1 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.topWall[monsterx][monstery] == 0  
      && monsterCameFromTop != false) {
      monsterCurrentCellSituation[20] = 1; //right CR wall down from top
    } 
    if (Mazegrid.bottomWall[monsterx][monstery] == 1 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.topWall[monsterx][monstery] == 0 
      && monsterCameFromTop != false) {
      monsterCurrentCellSituation[21] = 1; //left CR wall down from top
    } 
    if (Mazegrid.leftWall[monsterx][monstery] == 1 
      && Mazegrid.topWall[monsterx][monstery] == 0
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && monsterCameFromRight != false) {
      monsterCurrentCellSituation[22] = 1; //down CR wall left from right
    } 
    if (Mazegrid.leftWall[monsterx][monstery] == 1 
      && Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && monsterCameFromRight != false) {
      monsterCurrentCellSituation[23] = 1; //up CR wall left from right
    }
    if (Mazegrid.topWall[monsterx][monstery] == 0
      && Mazegrid.rightWall[monsterx][monstery] == 0
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromRight != false) {
      monsterCurrentCellSituation[24] = 1; //4way left fr
    } 
    if (Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromRight != false) {
      monsterCurrentCellSituation[25] = 1; //4way down fr
    } 
    if (Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromRight != false) {
      monsterCurrentCellSituation[26] = 1; //4way up fr
    }
    if (Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromLeft != false) {
      monsterCurrentCellSituation[27] = 1; //4way right fl
    } 
    if (Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromLeft != false) {
      monsterCurrentCellSituation[28] = 1; //4way down fl
    } 
    if (Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromLeft != false) {
      monsterCurrentCellSituation[29] = 1; //4way up fl
    }
    if (Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromDown != false) {
      monsterCurrentCellSituation[30] = 1; //4way right fd
    } 
    if (Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromDown != false) {
      monsterCurrentCellSituation[31] = 1; //4way left fd
    } 
    if (Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromDown != false) {
      monsterCurrentCellSituation[32] = 1; //4way up fd
    }
    if (Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromTop != false) {
      monsterCurrentCellSituation[33] = 1; //4way right fu
    } 
    if (Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromTop != false) {
      monsterCurrentCellSituation[34] = 1; //4way left fu
    } 
    if (Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromTop != false) {
      monsterCurrentCellSituation[35] = 1; //4way down fu
    }     
    if (Mazegrid.topWall[monsterx][monstery] == 1 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && monsterCameFromRight != false) {
      monsterCurrentCellSituation[36] = 1; //left CR wall top from right
    }     
    if (Mazegrid.topWall[monsterx][monstery] == 1 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && monsterCameFromRight != false) {
      monsterCurrentCellSituation[37] = 1; //down CR wall top from right
    }         
    if (Mazegrid.topWall[monsterx][monstery] == 1 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromLeft != false) {
      monsterCurrentCellSituation[38] = 1; //right CR wall top from left RCRWTFL
    }     
    if (Mazegrid.topWall[monsterx][monstery] == 1 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromLeft != false) {
      monsterCurrentCellSituation[39] = 1; //down CR wall top from left
    }        
    if (Mazegrid.rightWall[monsterx][monstery] == 1 
      && Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0  
      && monsterCameFromDown != false) {
      monsterCurrentCellSituation[40] = 1; //left CR wall right from down LCRWRFD
    } 
    if (Mazegrid.rightWall[monsterx][monstery] == 1 
      && Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && monsterCameFromDown != false) {
      monsterCurrentCellSituation[41] = 1; //up CR wall right from down UCRWRFD
    }     
    if (Mazegrid.rightWall[monsterx][monstery] == 1 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.topWall[monsterx][monstery] == 0  
      && monsterCameFromTop != false) {
      monsterCurrentCellSituation[42] = 1; //go down CR wall right from top DCRWRFT
    } 
    if (Mazegrid.rightWall[monsterx][monstery] == 1 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.topWall[monsterx][monstery] == 0  
      && monsterCameFromTop != false) {
      monsterCurrentCellSituation[43] = 1; //left CR wall right from top
    }     
    if (Mazegrid.bottomWall[monsterx][monstery] == 1
      && Mazegrid.topWall[monsterx][monstery] == 0
      && Mazegrid.rightWall[monsterx][monstery] == 0
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromLeft != false) {
      monsterCurrentCellSituation[44] = 1; //right CR wall down from left RCWDFL
    } 
    if (Mazegrid.bottomWall[monsterx][monstery] == 1 
      && Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && monsterCameFromLeft != false) {
      monsterCurrentCellSituation[45] = 1; //up CR wall down from left
    }     
    if (Mazegrid.bottomWall[monsterx][monstery] == 1
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0  
      && monsterCameFromRight != false) {
      monsterCurrentCellSituation[46] = 1; //up CR wall down from right UCWDFR
    } 
    if (Mazegrid.bottomWall[monsterx][monstery] == 1 
      && Mazegrid.leftWall[monsterx][monstery] == 0 
      && Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && monsterCameFromRight != false) {
      monsterCurrentCellSituation[47] = 1; //left CR wall down from right
    }     
    if (Mazegrid.leftWall[monsterx][monstery] == 1 
      && Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && monsterCameFromDown != false) {
      monsterCurrentCellSituation[48] = 1; //right CR wall left from down RCWLFD
    } 
    if (Mazegrid.leftWall[monsterx][monstery] == 1 
      && Mazegrid.topWall[monsterx][monstery] == 0 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && monsterCameFromDown != false) {
      monsterCurrentCellSituation[49] = 1; //up CR wall left from down
    }    
    if (Mazegrid.leftWall[monsterx][monstery] == 1 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.topWall[monsterx][monstery] == 0 
      && monsterCameFromTop != false) {
      monsterCurrentCellSituation[50] = 1; //down CR wall left from top DCWLFT
    } 
    if (Mazegrid.leftWall[monsterx][monstery] == 1 
      && Mazegrid.rightWall[monsterx][monstery] == 0 
      && Mazegrid.bottomWall[monsterx][monstery] == 0 
      && Mazegrid.topWall[monsterx][monstery] == 0 
      && monsterCameFromTop != false) {
      monsterCurrentCellSituation[51] = 1; //up CR wall left top
    }

    monsterChosenDirection=round(random(51));              /*PIECE OF CODE SELECTING A RANDOM SITUATION FROM THE 52 PICKERS*/
    while (monsterCurrentCellSituation[monsterChosenDirection]!=1) {     /*LOOP THAT SELECTS A NEW PICKER UNTIL ONE HAS BEEN FOUND THAT IS AVAILABLE.*/
      monsterChosenDirection=round(random(51));
    }
    /*CODE FOR RESETTING ALL VISITED CELLS TO FALSE*/

    monsterCameFromTop=false;       /*PURPOSE: THE VISITED CELL VALUE IS RELEVANT WHEN PICKING A DIRECTION AS THE MONSTER IS NOT ALLOWED TO GO TO THOSE CELLS.*/
    monsterCameFromRight=false;       /*TO PREVENT THE MONSTER FROM BEING STUCK WITH THE ONLY OPEN WAY BEING A VISITED CELL, ALL CELLS ARE RESET AFTER A VIABLE PICKER HAS BEEN SELECTED.*/
    monsterCameFromDown=false;
    monsterCameFromLeft=false;

    /*CODE FOR THE MONSTER TO GO CERTAIN DIRECTIONS*/

    /*GOING UP*/
    if (monstery != 0) {     /*POINTS TO THE OUT OF BOUNDS VALUE FOR UP*/
      if (monsterChosenDirection == 0     /*THE MONSTERP (OR PICKER) POINTS TO THE SPECIFIC SITUATION OF THE MONSTER"S LOCATION, DIRECTION OF ORIGIN AND POSSIBLE WAYS TO GO.*/
        || monsterChosenDirection == 6    /*BECAUSE THE MONSTER CAN ONLY EVER GO 4 WAYS EVERy SITUATION WHICH FORCES THE MONSTER TO GO THE SAME WAY CAN BE PUT TOGETHER IN THE IF STATEMENT*/
        || monsterChosenDirection == 11 
        || monsterChosenDirection == 15 
        || monsterChosenDirection == 19 
        || monsterChosenDirection == 23 
        || monsterChosenDirection == 26 
        || monsterChosenDirection == 29 
        || monsterChosenDirection == 32 
        || monsterChosenDirection == 41 
        || monsterChosenDirection == 45 
        || monsterChosenDirection == 46 
        || monsterChosenDirection == 49) { 
        monstery-=1;         /*THE STATEMENT WHICH MAKES THE MONSTER MOVE ONE TILE BASED ON X OR Y. (y- UP, y+ DOWN, x- LEFT, x+ RIGHT).*/
        monsterCameFromDown = true;  /*THE CODE DENOTING WHICH DIRECTION THE MONSTER CAME FROM (3 DOWN, 1 UP, 2 RIGHT, 4 LEFT)*/
        assets.audio0b.play();
        assets.audio3b.pause();
        assets.audio6b.pause();
        assets.audio9b.pause();
      }                      /*THE FORMULA FOR THE DIRECTIONS COMING FROM WHICH SIDE OF THE CELL WE START CHECKING AT, WHICH IS THE TOP SIDE (1)*/
    }


    /*GOING DOWN*/
    if (monstery != (aantalCells-1)) {   //POINTS TO THE OUT OF BOUNDS VALUE FOR DOWN 
      if (monsterChosenDirection == 2 
        || monsterChosenDirection == 4 
        || monsterChosenDirection == 10 
        || monsterChosenDirection == 14 
        || monsterChosenDirection == 18 
        || monsterChosenDirection == 22 
        || monsterChosenDirection == 25 
        || monsterChosenDirection == 28 
        || monsterChosenDirection == 30 
        || monsterChosenDirection == 35 
        || monsterChosenDirection == 37 
        || monsterChosenDirection == 39 
        || monsterChosenDirection == 42 
        || monsterChosenDirection == 50) {
        monstery+=1;
        monsterCameFromTop=true;
        assets.audio3b.play();
        assets.audio0b.pause();
        assets.audio6b.pause();
        assets.audio9b.pause();
      }
    }


    /*GOING LEFT*/
    if (monsterx != 0) {  //POINTS TO THE OUT OF BOUNDS VALUE FOR LEFT

      if (monsterChosenDirection == 3 
        || monsterChosenDirection == 5 
        || monsterChosenDirection == 9 
        || monsterChosenDirection == 13 
        || monsterChosenDirection == 17 
        || monsterChosenDirection == 21 
        || monsterChosenDirection == 24 
        || monsterChosenDirection == 31 
        || monsterChosenDirection == 34 
        || monsterChosenDirection == 36 
        || monsterChosenDirection == 40 
        || monsterChosenDirection == 43 
        || monsterChosenDirection == 47 ) {
        monsterx-=1;
        monsterCameFromRight=true;
        assets.audio6b.play();
        assets.audio0b.pause();
        assets.audio3b.pause();
        assets.audio9b.pause();
      }
    }


    /*GOING RIGHT*/
    if (monsterx != (aantalCells-1)) {     //POINTS TO THE OUT OF BOUNDS VALUE FOR RIGHT

      if (monsterChosenDirection == 1 
        || monsterChosenDirection == 7 
        || monsterChosenDirection == 8 
        || monsterChosenDirection == 12 
        || monsterChosenDirection == 16 
        || monsterChosenDirection == 20 
        || monsterChosenDirection == 27 
        || monsterChosenDirection == 33 
        || monsterChosenDirection == 38 
        || monsterChosenDirection == 44 
        || monsterChosenDirection == 48 
        || monsterChosenDirection == 51) {
        monsterx+=1;
        monsterCameFromLeft=true;
        assets.audio9b.play();
        assets.audio0b.pause();
        assets.audio3b.pause();
        assets.audio6b.pause();
      }
    }

    for (int k=0; k<52; k++) { /*MAKES SURE EVERY POSSIBLE SITUATION FOR THE MONSTER IS SET TO 0 (FALSE) BEFORE CHECKING FOR OTHER THE NEXT SITUATION*/
      monsterCurrentCellSituation[k] = 0;
    }
  }





  void drawmonster() {        /*LOADS THE IMAGE FOR THE MONSTER*/
    //fill(180, 0, 0);
    //rect(monsterx*w + offset, monstery*w, w-10, w-10);
    image(assets.monsterSprite, monsterx*cellSize + offsetFromLeft, monstery*cellSize, cellSize, cellSize);
  }
}
