//This game was made by Marcus Girardo

Catcher catcher;
Timer timer;
Drop[] drops;
int totalDrops = 0;
int score = 0;

void setup() {
  size(480, 270);
  catcher = new Catcher(32);
  drops = new Drop[1000];
  timer = new Timer(300);
  timer.start();
}

void draw() {
  background(0);
  text("Score: " + score, 15, 15 , 60 , 30);

  catcher.setLocation(mouseX, mouseY);
  catcher.display();
  
  
  if (timer.isFinished()) {
    drops[totalDrops] = new Drop();
    totalDrops ++ ;
    if (totalDrops >= drops.length) {
      totalDrops = 0;
    }
    timer.start();
  }
  
  for (int i = 0; i < totalDrops; i++ ) {
    drops[i].move();
    drops[i].display();
    if (catcher.intersect(drops[i])) {
      drops[i].caught();
    }
  }
}

class Catcher {
  float r;
  color col;
  color scol;
  float x, y;

  Catcher(float tempR) {
    r = tempR;
    col = color(random(255), random(255), random(255), 150);
    scol = color(random(255), random(255), random(255), 100);
    x = 0;
    y = 0;
  }

  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    stroke(scol);
    fill(col);
    ellipse(x, y, r*2, r*2);
  }

  boolean intersect(Drop d) {
    float distance = dist(x, y, d.x, d.y); 

    if (distance < r + d.r) { 
      return true;
    } else {
      return false;
    }
  }
}

class Drop {
  float x, y;
  float speed;
  color c;
  float r;

  Drop() {
    r = random(4, 8);
    x = random(width);
    y = -r*4;
    speed = random(1, 5);
    c = color(random(255), random(255), random(255));

  }
  
  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y > height + r*4) { 
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(c);
    stroke(c, 75);
    strokeWeight(12);
    for (int i = 2; i < r; i++ ) {
      ellipse(x, y + i*4, i*2, i*2);
    }
  }

  void caught() {
    speed = 0; 
    y = -1000;
    score++;
  }
}

class Timer {

  int savedTime;
  int totalTime;

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  void start() {
    savedTime = millis();
  }

  boolean isFinished() { 
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
