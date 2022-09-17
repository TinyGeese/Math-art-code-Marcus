int scale = 5;
int cols, rows;

int stepx = 10;
int stepy = 10;

void setup() {
  size(500, 500);
  
  cols = width/stepx;
  rows = height/stepy;
}

void draw(){
  background(0);
    diceroll();
  }


int col = -1;
int row = 0;

void diceroll(){
  col++;
  
  if (col >= stepx){
    col=0;
    row++;
  }
  int dice = int(random(4));
  println(dice);
  
  float xx = col*cols;
  float yy = row*rows;
  
  int linesize = cols;
  
  ellipse(xx,yy,5,5);
  
  switch(dice){
    case 0:
      line(xx,yy,xx+linesize,yy);
      stroke(random(255),random(255),random(255));
      break;
    case 1:
      line(xx,yy,xx,yy+linesize);
      stroke(random(255),random(255),random(255));
      break;
    case 2:
      line(xx,yy,xx,yy-linesize);
      stroke(random(255),random(255),random(255));
      break;
    case 3:
      line(xx,yy,xx-linesize,yy);
      stroke(random(255),random(255),random(255));
      break;
  }
}
