class Catcher{
  PVector loc;
  int d;
  Catcher(){
    d=30;
  }
  void display(){
    ellipse(mouseX,height-150,d,d);
  }
}
