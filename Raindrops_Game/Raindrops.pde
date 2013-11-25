class Raindrops{
  PVector loc, vel,acc;
  int d;
  Raindrops() {
    d=5;
    loc=new PVector(random(d, width-d), random(d, height-d));
    vel=new PVector(0,random(.5,2));
    acc=new PVector(0,random(.001,.003));
  }
  void display() {
    ellipse(loc.x, loc.y, d, d);
  }
  void fall() {
    vel.add(acc);
    loc.add(vel);
  }
  void restart() {
    if (loc.y>height) {
      loc.y=0;
      vel.y=random(.5,2);
    }
  }
}

