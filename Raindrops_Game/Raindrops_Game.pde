Raindrops[] drops=new Raindrops[300];
Catcher catcher;
int oldTime = 0;
int currentTime = 0;
int timeChange = 0;
int index = 1;
int threshold = 3000;
int score;
int lives;
boolean gameover;
PImage scene;
void setup() {
  //setting the background
  scene=loadImage("background.jpg");
  size(scene.width, scene.height);
  //creates 300 raindrops
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Raindrops();
  }
  catcher=new Catcher();
  gameover=false;
  lives=3;
}
void draw() {
  background(scene);
  //text displays the score (number of drops caught)
  textSize(50);
  fill(10);
  text(score, 10, 100);
  //displays catcher
  catcher.display();
  catcher.update();
  //raindrops are displayed and fall
  for (int i = 0; i <= index; i++) {
    drops[i].display();
    drops[i].fall();
    //once they are caught they go away to a location off screen
    if (catcher.catchDrop(drops[i])==true) {
      drops[i].goAway();
      score++;
      threshold-=20;
    }
    //if a drop falls past the screen and isn't caught, the number of lives decreases
    if (drops[i].loc.y>height && drops[i].loc.y<height+drops[i].d/6) {
      lives--;
    }
    //when the # of lives is zero, the game is over
    if (lives==0) {
      gameover=true;
    }
  }
  //game begins and each set falls after 3 seconds
  currentTime= millis();
  timeChange = currentTime - oldTime;
  if (timeChange > threshold) {
    fill(random(255), random(255), random(255), 100);
    oldTime = currentTime;
    index++;
  }
  //sets parameters for what occurs when the game ends
  if (gameover==true) {
    background(random(255), random(255), random(255));
    textMode(CENTER);
    text("GAME OVER", width/2, height/2);
  }
  println(lives);
}

