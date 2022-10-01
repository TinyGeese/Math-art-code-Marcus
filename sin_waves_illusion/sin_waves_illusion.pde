float incrementA = 256;
float incrementB = 230;
float scale = 3;
int i = 0;

void setup() {
  size(800, 800);

  background(0);
  smooth();
}

void draw() {

  for (int run = 0; run < 100; run++) {
    i+=1;

    float x = width/2 * tan (i * scale/incrementA)*0.2+4;
    float y = height/2 * tan (i * scale/incrementB)*0.7;
    
    stroke(random(255),random(255),random(255));
    strokeWeight(2);
    point(width/2+x, height/2+y);
  }
  
}
