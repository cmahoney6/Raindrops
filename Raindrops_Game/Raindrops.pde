class Raindrops{
  PVector loc, vel,acc;
  int d;
  Raindrops() {
    d=5;
    loc=new PVector(random(d, width-d), -1);
    vel=new PVector(0,random(3,4));
  }
  void display() {
    fill(0,255,255);
    ellipse(loc.x, loc.y, d, d);
  }
  void fall() {
    loc.add(vel);
  }
  void restart() {
    loc.set( random(width),0);
    vel.set(0,random(3,4));
    }
  }


