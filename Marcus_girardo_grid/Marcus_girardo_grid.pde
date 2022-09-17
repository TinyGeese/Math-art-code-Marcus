int scale = 5;
int cols, rows;
float r = mouseX;

void setup() {
  size(200, 200);
  
  cols = width/scale;
  rows = height/scale;
}

void draw(){
  for (int i = 0; i < cols; i ++){
    for (int j = 0; j < rows; j++){
      int x = i*scale;
      int y = j*scale;
      frameRate(20);
      fill(random(255));
      stroke(255);
      rotate(mouseX);
      rect(x, y, 10, 10);
      
    }
  }
}
