Raindrops[] drops=new Raindrops[300];
Catcher catcher;
void setup(){
  size(displayWidth,displayHeight);
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Raindrops();
  }
  catcher=new Catcher();
}
  void draw(){
  background(0,50,100);
  catcher.display();
  catcher.update();
  for (int i = 0; i < drops.length; i++) {
    drops[i].display();
    drops[i].fall();
    drops[i].restart();
    }
   }
  
