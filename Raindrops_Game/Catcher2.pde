class Catcher2 {
  PImage hat;
  PVector loc;
  int d;
  Catcher2() {
    loc=new PVector(mouseX, height-75);
    d=150;
    hat=loadImage("santahat.png");
  }
  //displays catcher
  void display() {
    imageMode(CENTER);
    image(hat,loc.x,loc.y,d,d);
  }
  //places the catcher
  void update() {
    loc.set(mouseX, height-75);
  }
  //returns the drops after they are caught
  boolean catchDrop(Snow flakes) {
    if (loc.dist(flakes.loc) < d/2 + flakes.d/2) {
      return true;
    }
    else {
      return false;
    }
  }
}

