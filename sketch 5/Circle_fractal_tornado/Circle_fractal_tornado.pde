int radius = 200 * 8;

void setup(){
 size(800,600);
}

void draw(){
  background(0);
  stroke(255);
  noFill();
  drawCircle(20,20,radius);
 
}



void drawCircle(float x, float y, float radius) {
  ellipse(x, y, x, y);
  if(radius > 8) {
    stroke(255,0,0);
    drawCircle(x + radius/2, y, radius/2);
    stroke(0,255,0);
    drawCircle(x - radius/2, y, radius/2);
    stroke(0,0,255);
    drawCircle(x, y + radius/2, radius/2);
    stroke(255,255,255);
    drawCircle(x, y - radius/2, radius/2);
    
  }
}
