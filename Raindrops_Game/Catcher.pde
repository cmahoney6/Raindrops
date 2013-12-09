class Catcher {
  PImage man;
  PVector loc;
  int d;
  Catcher() {
    loc=new PVector(mouseX, height-75);
    d=150;
    man=loadImage("man.png");
  }
  //displays catcher
  void display() {
    imageMode(CENTER);
    image(man,loc.x,loc.y,d,d);
  }
  //places the catcher
  void update() {
    loc.set(mouseX, height-75);
  }
  //returns the drops after they are caught
  boolean catchDrop(Raindrops drops) {
    if (loc.dist(drops.loc) < d/2 + drops.d/2) {
      return true;
    }
    else {
      return false;
    }
  }
}

