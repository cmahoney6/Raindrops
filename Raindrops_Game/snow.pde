class Snow {
  PImage snowflake;
  PVector loc, vel, acc;
  int d;
  Snow(){
    d=30;
    loc=new PVector(random(d, width-d), -1);
    vel=new PVector(0, random(3, 5));
    snowflake=loadImage("snowflakes.png");
  }
  //displays the raindrops
  void display() {
    image(snowflake, loc.x, loc.y, d, d);
  }
  //causes the raindrops to fall at a random velocity between the set integers
  void fall() {
    loc.add(vel);
  }
  //once drops are caught, they disappear to a location off screen
  void goAway() {
    loc.set(height*2, 0);
    vel.set(0, 0);
  }
}


