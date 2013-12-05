Raindrops[] drops=new Raindrops[300];
Catcher catcher;
int oldTime = 0;
int currentTime = 0;
int timeChange = 0;
int index = 1;
int threshold = 3000;
int score;
PImage scene;
void setup() {
  size(500,700);
  scene=loadImage("background.jpg");
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Raindrops();
  }
  catcher=new Catcher();
}
void draw() {
  background(0, 50, 100);
  textSize(50);
  fill(10);
  text(score,10,100);
  catcher.display();
  catcher.update();
  for (int i = 0; i <= index; i++) {
    drops[i].display();
    drops[i].fall();
    if(catcher.catchDrop(drops[i])==true){
    drops[i].goAway();
    score++;
    threshold-=20;
    }
  }
   currentTime= millis();
  timeChange = currentTime - oldTime;
  if(timeChange > threshold){
    fill(random(255),random(255),random(255),100);
    oldTime = currentTime;
    index++;
  }
}


