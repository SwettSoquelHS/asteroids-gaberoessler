/*
  Asteroid class
 Should extend Mover class and implement show.
 
 Initially, your asteroid may just be a simple circle or square
 but the final program should use "beginShape(), vertex(), and endShape()"
 to render the asteroid.
 */
class Asteroid extends Mover {   
  boolean alive = true;
  Asteroid(float x, float y) {
    super(x, y);
    boolean alive = true;
  }
  Asteroid(float x, float y, float speed, float direction, float spin, float radius) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.direction = direction;
    this.spin = spin;
    myColor = 100;
    this.radius = radius;
    boolean alive = true;
  }
  void show() {
    pushMatrix();
    smooth();
    translate(x, y);
    rotate(radians(spin));
    beginShape();
    vertex(0, 20);
    vertex(24, 10);
    vertex(13, -10);
    vertex(-10, -7);
    vertex(-9, 10);
    endShape();
    popMatrix();
  }
  void setAlive(boolean life){
    alive = life; 
  }
  boolean isAlive(){
    return alive;
  }
}
