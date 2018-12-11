import java.util.*;

class Score {
  String name;
  int totalScore; 
  int endlevel;
  String totalTime;
  int playerIndex;
  int scoretime;
  int score;

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
