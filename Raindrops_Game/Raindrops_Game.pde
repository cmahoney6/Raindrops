Raindrops[] drops=new Raindrops[300];
Snow[] flakes=new Snow[300];
Catcher catcher;
Catcher2 catcher2;
int oldTime = 0;
int index = 1;
int threshold = 1000;
int score;
int lives;
int rx, ry, rw, rh;
int lx, ly, lw, lh;
boolean gameover;
boolean start;
boolean levelup;
boolean levelstart;
PImage scene;
PImage scene2;
void setup() {
  rw=200;
  rh=100;
  lw=200;
  lh=100;
  //setting the background
  scene=loadImage("background.jpg");
  scene2=loadImage("snowbackground.jpg");
  size(scene.width, scene.height);
  rx=width/2;
  ry=height/2;
  lx=width/2;
  ly=height/2;
  //creates 300 raindrops
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Raindrops();
    flakes[i] = new Snow();
  }
  catcher=new Catcher();
  catcher2=new Catcher2();
  gameover=false;
  lives=3;
  start=false;
  levelup=false;
  levelstart=false;
}
void draw() {
  //start screen 
  if (start==false) {
    background(0);
    rectMode(CENTER);
    fill(0, 255, 0);
    rect(rx, ry, rw, rh);
    textSize(50);
    text("CLICK TO START", 60, 100);
  }
  if (levelup==false && start==true) {
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
      if (drops[i].loc.y>height && drops[i].loc.y<height+drops[i].d/8) {
        lives--;
      }
      //when the # of lives is zero, the game is over
      if (lives==0) {
        gameover=true;
      }
    }
    //game begins and each set falls after 1 second
    if (millis() - oldTime >threshold) {
      index++;
      oldTime = millis();
    }
    //sets parameters for what occurs when the game ends
    if (gameover==true) {
      background(random(255), random(255), random(255));
      textMode(CENTER);
      text("YOU'RE A FAILURE", width/2, height/2);
    }
  }
  if (score>=3) {
    levelup=true;
  }
  if (levelup==true) {
    background(0);
    fill(0, 255, 0);
    text("LEVEL UP, press to begin", 60, 100);
    rectMode(CENTER);
    fill(0, 255, 0);
    rect(lx, ly, lw, lh);
  }
  //starts second level
  if (levelup==true && levelstart==true) {
    size(scene2.width, scene2.height);
    background(scene2);
    //text displays the score (number of drops caught)
    textSize(50);
    fill(10);
    text(score, 10, 100);
    //displays catcher
    catcher2.display();
    catcher2.update();


    //snowflakes are displayed and fall
    for (int i = 0; i <= index; i++) {
      flakes[i].display();
      flakes[i].fall();
      //once they are caught they go away to a location off screen
      if (catcher2.catchDrop(flakes[i])==true) {
        flakes[i].goAway();
        score++;
        threshold-=20;
      }
      //if a flake falls past the screen and isn't caught, the number of lives decreases
      if (flakes[i].loc.y>height && flakes[i].loc.y<height+flakes[i].d/8) {
        lives--;
      }
      //when the # of lives is zero, the game is over
      if (lives==0) {
        gameover=true;
      }
    }
    //game begins and each set falls after 1 second
    if (millis() - oldTime >threshold) {
      index++;
      oldTime = millis();
    }
    //sets parameters for what occurs when the game ends
    if (gameover==true) {
      background(random(255), random(255), random(255));
      textMode(CENTER);
      text("YOU'RE A FAILURE", width/2, height/2);
    }
    println(lives);
  }
}


//game starts when button is pressed
void mousePressed() {
  if (mouseX>rx && mouseX<rx+rw && mouseY>ry && mouseY<ry+rh && start==false) {
    start=!start;
  }
  if (mouseX>lx && mouseX<lx+lw && mouseY>ly && mouseY<ly+lh) {
    levelstart=!levelstart;
  }
}

