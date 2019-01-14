import java.util.*;

class Score {
  String name;
  int totalScore; 
  int endlevel;
  String totalTime;
  int playerIndex;
  int scoretime;
  int score;
  
  final int stateNormal = 0;
  final int stateInput = 1;
  final int stateAfterInput = 2;
  int state = stateNormal;
  char[] letters = new char[4];
  int index = 0;
  String result = "";
  
  void Nameinput() {
   if (state==stateInput){
    if (keyCode == UP) { 
      if (letters[index] > 64) { 
        letters[index]--;
        if (letters[index] == 64) {
          letters[index] = 90;
        }
      }
    } else if (keyCode == DOWN) { 
      if (letters[index] < 91) {
        letters[index]++;
        if (letters[index] == 91) {
          letters[index] = 65;
        }
      }
    } else if (keyCode == LEFT) {
      index--;
      if (index<0) 
        index=0;
    } else if (keyCode == RIGHT) {
      index++;
      if (index>3) 
        index=3;
    } else if (key == RETURN||key==ENTER) {
      result=""+letters[0]+letters[1]+letters[2]+letters[3];
      state=stateAfterInput;
      schermen.welkScherm[3] = false;
      schermen.welkScherm[2] = true;
      highscores.addScore(scoreToevoegen.result, scoreToevoegen.totalScore, (int)player.level-1, scoreToevoegen.totalTime); //ADDS THE PLAYER'S TOTAL SCORE TO THE HIGHSCOREBOARD
      changeScherm.changeGameoverScherm();
    }
    }
 }

  void Totalscore() {
    if (startTimer.min >= 0) { 
      scoretime = 60 - startTimer.s;
    } else {
      scoretime = 0;
    }
    score = player.level * 10;
    totalScore = totalScore + score;
  }

  void Totaltime() {
    totalTime = startTimer.min + ":" + startTimer.s;
  }



  Score(String name, int totalscore, int endlevel, String totaltime) {
    this.name = name;
    this.totalScore = totalscore;
    this.endlevel = endlevel;
    this.totalTime = totaltime;
  }
}

class ScoreList {
  ArrayList<Score>scores = new ArrayList<Score>();
  Table scoreTable;

  ScoreList() {
    scoreTable = new Table();
    scoreTable.addColumn("name");
    scoreTable.addColumn("score");
    scoreTable.addColumn("level");
    scoreTable.addColumn("time");
  }

  void addScore(String name, int totalscore, int endlevel, String totaltime) {
    scores.add(new Score(name, totalscore, endlevel, totaltime));
    sortScores();
  }
  int getScoreCount() {
    return scores.size();
  }
  Score getScore(int iScore) {
    return scores.get(iScore);
  }
  void sortScores() {
    Collections.sort(scores, new HSComperator());
  }
  void save (String scoreFileName) {
    for (Score score : scores) {
      TableRow row  = scoreTable.addRow();
      row.setString("name", score.name);
      row.setInt("score", score.totalScore);
      row.setInt("level", score.endlevel);
      row.setString("time", score.totalTime);
    }
    saveTable(scoreTable, scoreFileName);
  }
  void load(String scoreFileName) {
    scoreTable = loadTable(scoreFileName, "header");
    scores.clear();
    for (int iScore= 0; iScore<scoreTable.getRowCount(); iScore++) {
      TableRow row = scoreTable.getRow(iScore);
      scores.add(new Score(row.getString("name"), row.getInt("score"), row.getInt("level"), row.getString("time")));
    }
  }
}


class HSComperator implements
  Comparator<Score> {
  @Override public int compare(Score o1, Score o2) {
    return o2.totalScore - o1.totalScore;
  }
}
