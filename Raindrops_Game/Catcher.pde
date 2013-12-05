class Catcher{
  PVector loc;
  int d;
  Catcher(){
    loc=new PVector(mouseX,height-d);
    d=30;
  }
  void display(){
    fill(0);
    ellipse(loc.x,loc.y,d,d);
  }
  void update(){
    loc.set(mouseX,height-d);
  }
  boolean catchDrop(Raindrops drops){
    if(loc.dist(drops.loc) < d/2 + drops.d/2){
      return true;
    }
    else{
      return false;
    }
  }
}
