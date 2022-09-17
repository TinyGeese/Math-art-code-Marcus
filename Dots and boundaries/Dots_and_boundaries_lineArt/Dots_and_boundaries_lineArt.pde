PVector[] pos;
PVector[] acc;

int num = 30;

int speed = 5;

void setup(){
  size(700,700);
  
  pos = new PVector[num];
  acc = new PVector[num];
  
  for(int i = 0; i < num; i++){
    pos[i] = new PVector(random(width),random(height),random(30,50));
    acc[i] = new PVector(random(-speed,speed),random(-speed, speed),0);
  }
  
}

void draw(){
 //background(0);
  for(int j = 0; j < num; j++){
    pos[j].add(acc[j]);
    
    if(pos[j].x > width-(pos[j].z/2) || pos[j].x < (pos[j].z/2)){
    acc[j].x = acc[j].x * -1;
  }
  if(pos[j].y > height-(pos[j].z/2) || pos[j].y < (pos[j].z/2)){
    acc[j].y = acc[j].y * -1;
  } 
  
  for(int i = 0; i < num; i++){
    float d = PVector.dist(pos[j],pos[i]);
    if (d <=70){
      
      stroke(255,0,0,10);
      
      strokeWeight(1.5);
      line(pos[j].x,pos[j].y,pos[i].x,pos[i].y);
    }else{
      noStroke();
    }
   // strokeWeight(0.5);
    //ellipse(pos[j].x,pos[j].y,pos[j].z,pos[j].z);
   // noFill();

    }
  }
}
    
    
    
    
    
