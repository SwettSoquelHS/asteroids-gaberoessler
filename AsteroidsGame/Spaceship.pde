/*
  Spaceship class
 Should extend Mover class and implement show.
 You may add additional methods to this class, for example "rotate" and "accelerate" 
 might be useful.
 */
class Spaceship extends Mover { 
  int live;
  Bullet myBullet;
  ArrayList <Bullet> bullets;
  Spaceship(float x, float y) {
    super(x, y);
    bullets = new ArrayList<Bullet>();
    live = 1;
  }
  Spaceship(float x, float y, float speed, float direction) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.direction = direction;
    myColor = 225;
    radius = 10.0;
    bullets = new ArrayList<Bullet>();
    live =1;
  }
  void show() {
    fill(#4BEC13);
    pushMatrix();
    translate(x, y);
    rotate(radians(direction));
    triangle(-10, -10, -10, 10, 20, 0);  
    popMatrix();
    for (int i=0; i<bullets.size(); i++) {
      Bullet b = bullets.get(i);
      if (b != null)
        b.show();
    }
  }
  void rotation() {
    if (ROTATE_LEFT)
      direction -= 4.5;
    if (ROTATE_RIGHT)
      direction += 4.5;

    if (MOVE_FORWARD == true) {
      if (speed < 3) {
        speed += 0.5;
      }
    } else {
      if (speed > 0) {
        speed -= 0.5;
      }
      if (speed < 0)
        speed = 0;
    }
  }
  void fire() {
    if (bullets.size() < 50 && x != 300 && y != 200) {
      myBullet = new Bullet(this.x, this.y, this.speed + 5, this.direction, 10);
      bullets.add(myBullet);
    }
  }
  void update() {

    x = x + speed*(float)Math.cos(radians(direction));
    y = y + speed*(float)Math.sin(radians(direction));
    spin = spin+0.3*(float)Math.sin(radians(direction));  

    if (x>width+10)
      x = -9;
    if (x<-10)
      x = width+9;
    if (y>height+10)
      y = -9;
    if (y<-10)
      y = height+9;
    spin = spin+0.3*(float)Math.sin(radians(direction)); 
    for (int i=0; i<bullets.size(); i++) {
      Bullet b = bullets.get(i);
      if (b != null)
        b.update();
      if (b.getLive() < 0) {
        bullets.remove(b);
      }
    }
    //todo: You need to decide what to do when X is less than 0 or greater than width
    //todo: You need to decide what to do when Y is less than 0 or greater than height
  }
  void setLives(int lives){
    live = lives;
  }
  int getLives(){
    return live;
  }
  void checkOnBullets(Asteroid[] rocks){
    for(Bullet b: bullets){
      for(int i = 0; i < rocks.length; i++){
        if(b.collidingWith(rocks[i])){
          rocks[i].setAlive(false);
        }
      } 
    }
  }
}
