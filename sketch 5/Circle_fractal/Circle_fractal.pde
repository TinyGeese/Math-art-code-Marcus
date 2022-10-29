int radius = 50 * 8;
int i = 0;

void setup(){
 size(600,600);
}

void draw(){
  background(0);
  stroke(255);
  noFill();
  drawCircle(height/2,width/2,radius);
}


// this draws another smaller cirlce at the top, bottom, left and right of the larger circle and keeps going
void drawCircle(float x, float y, float radius) {
  ellipse(x, y, radius, radius);
  if(radius > 8) {
    stroke(random(255),random(255),random(255));
    drawCircle(x + radius/2, y, radius/2); 
    stroke(random(255),random(255),random(255));
    drawCircle(x - radius/2, y, radius/2);
    stroke(random(255),random(255),random(255));
    drawCircle(x, y + radius/2, radius/2);
    stroke(random(255),random(255),random(255));
    drawCircle(x, y - radius/2, radius/2);
    
  }
}
