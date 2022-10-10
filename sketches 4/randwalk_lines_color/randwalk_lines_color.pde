RW[] randwalk;
int num = 50;

void setup() {
  
  size(600, 600);

  randwalk = new RW[num];

  for (int i = 0; i < num; i++) {
    randwalk[i]= new RW(random(width), random(height), random(10));
  }
   background(255);
}

void draw() {
 // background(255);

  for (int i = 0; i < num; i++) {
    randwalk[i].randwalk();
    randwalk[i].prox();
  }
}

class RW {

  float x;
  float y;
  
  float rstep ;
  
  color c = color(random(255),random(255),random(255));

  RW(float x, float y, float rstep) {
    this.x = x;
    this.y = y;
    this.rstep = rstep;
  }

  void randwalk() {

    x = x+random(-rstep, rstep);
    y = y+random(-rstep, rstep);
    stroke(c);
    point(x, y);
    //ellipse(x, y,10,10);
  }

  void prox() {

    for (int i = 0; i < num; i++) {
      float d = dist(this.x, this.y, randwalk[i].x, randwalk[i].y);
      if (d <= 40) {
        stroke(0,20);
        line( this.x, this.y, randwalk[i].x, randwalk[i].y);
      }
    }
  }
}
