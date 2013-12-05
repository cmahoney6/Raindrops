class Raindrops{
  PImage rain;
  PVector loc, vel,acc;
  int d;
  Raindrops() {
    d=10;
    loc=new PVector(random(d, width-d), -1);
    vel=new PVector(0,random(3,4));
    rain=loadImage("raindrop.png");
  }
  void display() {
   image(rain,loc.x, loc.y, d, d);
  }
  void fall() {
    loc.add(vel);
  }
  void goAway(){
    loc.set(height*2,0);
    vel.set(0,0);
  }
  }


