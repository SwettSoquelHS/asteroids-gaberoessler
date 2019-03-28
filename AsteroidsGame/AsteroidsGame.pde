/* * * * * * * * * * * * * * * * * * * * * * *
 Class variable declarations here
 */
Spaceship player1;
Asteroid[] rocks;
Star[] starField;



/*
  Track User keyboard input
 */
boolean ROTATE_LEFT;  //User is pressing <-
boolean ROTATE_RIGHT; //User is pressing ->
boolean MOVE_FORWARD; //User is pressing ^ arrow
boolean SPACE_BAR;    //User is pressing space bar


/* * * * * * * * * * * * * * * * * * * * * * *
 Initialize all of your variables and game state here
 */
public void setup() {
  size(1920, 1080);
  //initialize your asteroid array and fill it
  rocks = new Asteroid[50];
  for (int i = 0; i < rocks.length; i++) {
    int x = (int)(width*Math.random());
    int y = (int)(height*Math.random());
    int speed = 1+(int)(6*Math.random());
    int direction =(int)(360*Math.random());
    rocks[i] = new Asteroid(x, y, speed, direction, 50*i, 15);
  }
  //initialize ship
  player1 = new Spaceship((float)width/2, (float)height/2);
  //initialize starfield
  starField = new Star[100];
}


/* * * * * * * * * * * * * * * * * * * * * * *
 Drawing work here
 */
public void draw() {
  //your code here
  background(0);

  //Draw Starfield first 
  //TODO: Part I

  for (int i = 0; i < starField.length; i++) {
    int x = (int)(width*Math.random());
    int y = (int)(height*Math.random());
    int r = (int)(Math.random()+3);
    starField[i] = new Star(x, y, r);
    starField[i].show();
  }

  //Check bullet collisions
  //TODO: Part III or IV - for not just leave this comment

  //TODO: Part II, Update each of the Asteroids internals
  for (int i = 0; i<rocks.length; i++) {
    if(rocks[i].isAlive()){
      rocks[i].update();
      rocks[i].show();
    }
  }
  //Check for asteroid collisions against other asteroids and alter course
  //TODO: Part III, for now keep this comment in place
  //Draw asteroids
  //TODO: Part II
  boolean justTouched = false;
  for (int i = 0; i < rocks.length; i++) {
    Asteroid currRock = rocks[i];
    if (currRock.collidingWith(player1)&&currRock.isAlive()) {
      player1.setLives(0);
    }
    for (int j = 0; j < rocks.length; j++) {
      if (rocks[j].equals(currRock)&&currRock.isAlive()) {
        rocks[j].setDirection(rocks[j].getDirection());
      } else if (!(justTouched) && (currRock.collidingWith(rocks[j]) && !(rocks[j] == currRock))&&currRock.isAlive()) {
        currRock.setDirection((float)(Math.random()*180)+rocks[j].getDirection());
        justTouched = true;
      } else {
        justTouched = false;
      }
    }
  }

  //Update spaceship
  //TODO: Part I
  player1.rotation();
  player1.update();
  //Check for ship collision agaist asteroids
  //, rTODO: Part II or III

  //Draw spaceship & and its bullets
  //TODO: Part I, for now just render ship
  if(player1.getLives()>0){
    player1.show();
    player1.checkOnBullets(rocks);
  }else{
    System.out.println("game over");
  }
  if(SPACE_BAR){
    player1.fire();
  }
  //TODO: Part IV - we will use a new feature in Java called an ArrayList, 
  //so for now we'll just leave this comment and come back to it in a bit. 

  //Update score
  //TODO: Keep track of a score and output the score at the top right
}



/* * * * * * * * * * * * * * * * * * * * * * *
 Record relevent key presses for our game
 */
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      ROTATE_LEFT = true;
    } else if ( keyCode == RIGHT ) {
      ROTATE_RIGHT = true;
    } else if (keyCode == UP) {
      MOVE_FORWARD = true;
    }
  }

  //32 is spacebar
  if (keyCode == 32) {  
    SPACE_BAR = true;
  }
}



/* * * * * * * * * * * * * * * * * * * * * * *
 Record relevant key releases for our game.
 */
void keyReleased() {  
  if (key == CODED) { 
    if (keyCode == LEFT) {
      ROTATE_LEFT = false;
    } else if ( keyCode == RIGHT ) {
      ROTATE_RIGHT = false;
    } else if (keyCode == UP) {
      MOVE_FORWARD = false;
    }
  }
  if (keyCode == 32) {
    SPACE_BAR = false;
  }
}

void checkOnAsteroids() {
  for (int i = 0; i < rocks.length; i++) {
    Asteroid a1 = rocks[i];
    for (int j = 0; j < rocks.length; j++) {
      Asteroid a2 = rocks[j];
      if (a1 != a2 && a1.collidingWith(a2)) {
      }
    }
  }
}
