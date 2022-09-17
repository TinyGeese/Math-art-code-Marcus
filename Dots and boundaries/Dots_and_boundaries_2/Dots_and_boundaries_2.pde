//create a VPvector
PVector pos;

PVector acc;

int speed = 50;

void setup(){
  
  size(500,500);
  
  pos = new PVector(random(width),random(height),50);
  
  acc = new PVector(random(-speed,speed),random(-speed,speed),0);
}

void draw(){
  background(0);
  
  pos.add(acc);
  
  //boundary
  if(pos.x > width-(pos.z/2) || pos.x < (pos.z/2)){
    acc.x = acc.x * -1;
  }
  if(pos.y > height-(pos.z/2) || pos.y < (pos.z/2)){
    acc.y = acc.y * -1;
  } 
  
  ellipse(pos.x, pos.y, pos.z, pos.z);

}

void mousePressed(){
  pos = new PVector(random(width),random(height),50);
  
  acc = new PVector(random(-speed,speed),random(-speed,speed),0);
}
