void setup(){
  size(600,300);
}

void draw(){
 background(255);
 
 for (int i = 0; i < width; i++){
   
   float mv = map(mouseX, 0, width, 0.01,0.5);
   
   float x = i;
   float y = height/2 + (sin((frameCount*0.1)+i*mv)*50);
   
   float x1 = i;
   float y1 = height/2 + (sin((frameCount*0.9)+i*mv)*10);
   
   float newy = (y+y1)/2;
   
   ellipse(x,newy,10,10);
 }
 
 }
