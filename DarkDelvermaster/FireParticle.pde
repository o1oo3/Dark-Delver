class FlameSystem {
  ArrayList<Flame> particles;
  PVector origin;

  FlameSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Flame>();
  }

  void addParticle() {
    particles.add(new Flame(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Flame p = particles.get(i);
      p.run();
      if (p.degeneration()) {
        particles.remove(i);
      }
    }
  }
}

class Flame {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Flame(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 255.0;
  }

  void run() {
    update();
    particles();
  }

  // Update method
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 25.0;
  }

  // Display Method
  void particles() {
    if (player.playerFirstDraw == true) {
      stroke(100, 0, 0, lifespan);
      fill(232, 0, 0, lifespan);
      ellipse(position.x+player.playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX-588, position.y+player.playerY*mazeGeneration.cellSize-18, 3, 3);

      stroke(100, 0, 0, lifespan);
      fill(255, 200, 0, lifespan);
      rect(position.x+player.playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX-588, position.y+player.playerY*mazeGeneration.cellSize-18, 3, 3);
    }
    if (keyCode == UP) {
      stroke(100, 0, 0, lifespan);
      fill(232, 0, 0, lifespan);
      ellipse(position.x+player.playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX-622, position.y+player.playerY*mazeGeneration.cellSize-18, 3, 3);

      stroke(100, 0, 0, lifespan);
      fill(255, 200, 0, lifespan);
      rect(position.x+player.playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX-622, position.y+player.playerY*mazeGeneration.cellSize-18, 3, 3);
    }
    if (keyCode == RIGHT) {
      stroke(100, 0, 0, lifespan);
      fill(232, 0, 0, lifespan);
      ellipse(position.x+player.playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX-594, position.y+player.playerY*mazeGeneration.cellSize-18, 3, 3);

      stroke(100, 0, 0, lifespan);
      fill(255, 200, 0, lifespan);
      rect(position.x+player.playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX-594, position.y+player.playerY*mazeGeneration.cellSize-18, 3, 3);
    }
    if (keyCode == DOWN) {
      stroke(100, 0, 0, lifespan);
      fill(232, 0, 0, lifespan);
      ellipse(position.x+player.playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX-588, position.y+player.playerY*mazeGeneration.cellSize-18, 3, 3);

      stroke(100, 0, 0, lifespan);
      fill(255, 200, 0, lifespan);
      rect(position.x+player.playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX-588, position.y+player.playerY*mazeGeneration.cellSize-18, 3, 3);
    }
    if (keyCode == LEFT) {
      stroke(100, 0, 0, lifespan);
      fill(232, 0, 0, lifespan);
      ellipse(position.x+player.playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX-618, position.y+player.playerY*mazeGeneration.cellSize-18, 3, 3);

      stroke(100, 0, 0, lifespan);
      fill(255, 200, 0, lifespan);
      rect(position.x+player.playerX*mazeGeneration.cellSize+mazeGeneration.offsetToCenterX-618, position.y+player.playerY*mazeGeneration.cellSize-18, 3, 3);
    }
  }



  // Degeneration of particles
  boolean degeneration() {
    if (lifespan < 1.0) {
      return true;
    } else {
      return false;
    }
  }
}
