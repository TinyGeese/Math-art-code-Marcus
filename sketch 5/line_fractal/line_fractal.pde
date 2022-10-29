int radius = 100 * 8;
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



void drawCircle(float x, float y, float radius) {
  ellipse(x, y, radius * sin(PI), radius);
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
