class Catcher{
  PVector loc;
  int d;
  Catcher(){
    d=30;
  }
  void display(){
    ellipse(mouseX,height-150,d,d);
  }
  void catchDrop(){
    if(loc.dist(fall.loc < d/2 + fall.d/2)){
      fall.colorChange();
      fall.restart();
    }
}
