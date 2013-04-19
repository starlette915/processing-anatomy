Ball ball;

void setup() {
  size(400, 400);
  background(0);
  stroke(255);
  ball = new Ball(300, 350, 60, 1, 3);
}

class Ball {
  float w;
  float h;
  float r;
  float posX;
  float posY;
  float stepX;
  float stepY;
  bool goRight = true;
  bool goUp = false;
  
  Ball(int x, int y, int s, float _stepX, float _stepY) {
    posX = x;
    posY = y;
    stepX = _stepX;
    stepY = _stepY;
    r = s / 2;
    w = s;
    h = s;
  }

  float getRatio() {
    if (0 == stepY) {
      return abs(stepX) / 1.0;
    }
    return abs(stepX) / abs(stepY);
  }

  void adjust(int dir) {
    if (dir == UP) {
      stepY -= 1;
    }
    else if (dir == DOWN) {
      stepY += 1;
    }
    else if (dir == RIGHT) {
      stepX += 1;
    }
    else if (dir == LEFT) {
      stepX -= 1;
    }
  }

  void move() {
    fill("#ffcc99");

    println('ratio: ' + stepX + ' / ' + stepY);
    if (goRight) {
      posX += getRatio();
      if (posX >= width) {
        goRight = false;
      }
    } else {
      posX -= getRatio();
      if (posX <= 0) {
        goRight = true;
      }
    }

    if (goUp) {
      posY -= 1;
      if (posY <= 0) {
        goUp = false;
      }
    } else {
      posY += 1;
      if (posY >= height) {
        goUp = true;
      }
    }

    pancake();
    ellipse(posX, posY, w, h);
  }

  void pancake() {
    int steps;

    // between 0 and r
    if (posX < r) {
      steps = posX;
    }
    // between (width - r) and width
    else {
      steps = width - posX;
    }
    if (steps < r) {
      println('steps: ' + steps);
      if (steps < 0) {
        return;
      }
      w = r + (r * (steps / r));
    } else {
      w = 2 * r;
    }

    if (posY < r) {
      steps = posY;
    } else {
      steps = height - posY;
    }
    if (steps < r) {
      if (steps < 0) {
        return;
      }
      h = r + (r * (steps / r));
    } else {
      h = 2 * r;
    }
  }
}

void draw() {
  background(0);
  ball.move();
}

void keyPressed() {
  println("keyCode: " + keyCode);
  if (keyCode == UP || keyCode == DOWN || keyCode == RIGHT || keyCode == LEFT) {
    ball.adjust(keyCode);
  }
}
