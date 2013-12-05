Raindrops[] drops=new Raindrops[300];
Catcher catcher;
int oldTime = 0;
int currentTime = 0;
int timeChange = 0;
int index = 0;
void setup() {
  size(500,700);
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Raindrops();
  }
  catcher=new Catcher();
}
void draw() {
  background(0, 50, 100);
  catcher.display();
  catcher.update();
  for (int i = 0; i <= index; i++) {
    drops[i].display();
    drops[i].fall();
    if(catcher.catchDrop(drops[i])==true){
    drops[i].restart();
    }
  }
   currentTime= millis();
  timeChange = currentTime - oldTime;
  if(timeChange >= 2000){
    fill(random(255),random(255),random(255),100);
    oldTime = currentTime;
    index++;
  }
}


