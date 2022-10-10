//Initiate an array of objects
Collider[] collide; 

//create some global constants

//the number of particles we will create
int particles = 10;

//some values that will drive the physics in our virtual space
float bounce = 0.005;
float gravity = 0.04;
float friction = -0.7;

void setup(){
  size(600,600);
  collide = new Collider[particles];
  
  for(int i = 0; i < particles; i++){
    collide[i] = new Collider(new PVector(random(width),random(height)),random(20,30),i, collide);
  }
}
void draw(){
 background(0);
 for(Collider c : collide){
   c.collide();
   c.move();
   c.drawit();
 }
}
//our object class - lets add some collisions
class Collider{
 
  
  PVector loc;
  
  PVector force = new PVector(0,0);
  
  float diameter;
  
  int id;
  Collider[] others;
  
  Collider(PVector locin, float di, int idi, Collider[] oi){
    
    loc = locin;
    diameter = di;
    
    id = idi;
    
    others = oi;
  }
  void collide(){
   
   for(int i = id + 1; i < particles; i++){
    
     PVector dxy1 = new PVector(loc.x, loc.y);
     PVector dxy2 = new PVector(others[i].loc.x, others[i].loc.y);
     
     PVector sub = PVector.sub(dxy2,dxy1);
     
     float distance = PVector.dist(dxy1,dxy2);
     float minDist = (others[i].diameter + diameter)/2;
     
     if(distance < minDist){
       
       float angle = atan2(sub.y,sub.x);
       
       float targetX = loc.x + cos(angle) * minDist;
       float targetY = loc.x + sin(angle) * minDist;
       
       float ax = (targetX - others[i].loc.x) * bounce;
       float ay = (targetY - others[i].loc.y) * bounce;
       
       force.x -= ax;
       force.y -= ay;
       
       others[i].force.x += ax;
       others[i].force.y += ay;
     } 
  } 
    
    
    
  }
  
    void drawit(){
    ellipse(loc.x,loc.y,diameter,diameter);
    //noStroke();
    noFill();
    stroke(255);
    for(int i = id + 1; i < particles; i++){
      line(loc.x,loc.y,others[i].loc.x,others[i].loc.y);
   }
  }
    
    void move(){
      force.y+=gravity;
      
      loc.x += force.x;
      loc.y += force.y;
      
      if(loc.x + diameter / 2 > width){
        loc.x = width - diameter/2;
        force.x *= friction;
        
    }else if(loc.x - diameter/2 < 0){
      loc.x = diameter/2;
      force.x *= friction;
    }
    
     if(loc.y + diameter / 2 > height){
        loc.y = height - diameter/2;
        force.y *= friction;
        
    }else if(loc.y - diameter/2 < 0){
      loc.y = diameter/2;
      force.y *= friction;
    }
}
}
