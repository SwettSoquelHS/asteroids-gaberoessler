/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 All objects in this world that move must implemnt the Movalbe interface.
 */
interface Movable {
  /*
    Return the x location of the Movable
   */
  float getX();

  /*
    Return the y location of the Movable
   */
  float getY();

  /*
    Return the direction of the Movable in degrees.
   */
  float getDirection();

  /*
   Return the speed of the Movable.
   The speed you use is a relative value and will
   feel different for different frame rates. For example,
   if frameRate is set to 48, then a speed of 1 would move 48 pixels 
   per second.
   */
  float getSpeed();

  /*
   Return the radius of influence. If you could draw a circle
   around your object, then what would this radius be.
   */
  float getRadius();

  /* 
   Sets the direction of the Movable
   */
  void setDirection(float newDirectionInDegrees);

  /* 
   Sets the speed of the Movable
   */
  void setSpeed(float newSpeed);

  /*
   Update the internals of the instance
   */
  void update(); 

  /*
    Display the isntance
   */
  void show();

  /*
   Return true if the instance of Movable is "colliding with" 
   the movable referred to by object.  *Note* An object should not
   be able to collide with iteself.
   */
  boolean collidingWith(Movable object);
}
//END OF Movable Interface




/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 Abstract base class Mover 
 */
abstract class Mover implements Movable {

  protected float x, y;
  protected float speed;
  protected float direction;
  protected int myColor;
  protected float radius; 
  protected float spin;
  protected float size;

  /*
    Default Mover, not actually moving and directionless
   */
  Mover(float x, float y) {
    //The line below shows how we can 
    //link this constructor to the constructor below through "this"
    this(x, y, 0, 0, 0, 0);
  }

  Mover() {
    super();
  }
  /*
    Mover constructor specifying x, y position along with its speed and
   direction (in degrees)
   */
  Mover(float x, float y, float speed, float direction, float spin, float size) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.direction = direction;
    this.spin = spin;
    myColor = 225;
    radius = 0.0;
    this.size = size;
  }

  /*
    Most of your movable objects should follow this pattern.
   */
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
    //todo: You need to decide what to do when X is less than 0 or greater than width
    //todo: You need to decide what to do when Y is less than 0 or greater than height
  }



  /*
    Save this for your subclasses to override.
   but notice how it is tagged with abstract, meaning 
   it is incomplete. (It's like an I.O.U.)
   */
  abstract void show();


  /*
    TODO: Part 4: Implement collision detection
   */
  boolean collidingWith(Movable m) {
    float distance = dist(x, y, m.getX(), m.getY());
    boolean touching = distance < radius + m.getRadius();
    return touching;
  }

  float getX() {
    return x;
  }

  /*
    Return the y location of the Movable
   */
  float getY() {
    return y;
  }

  /*
    Return the direction of the Movable in degrees.
   */
  float getDirection() {
    return direction;
  }

  /*
   Return the speed of the Movable.
   The speed you use is a relative value and will
   feel different for different frame rates. For example,
   if frameRate is set to 48, then a speed of 1 would move 48 pixels 
   per second.
   */
  float getSpeed() {
    return speed;
  }
  /*
   Return the radius of influence. If you could draw a circle
   around your object, then what would this radius be.
   */
  float getRadius() {
    return radius;
  }
  /* 
   Sets the direction of the Movable
   */
  void setDirection(float newDirectionInDegrees) {
    direction = newDirectionInDegrees;
  }

  /* 
   Sets the speed of the Movable
   */
  void setSpeed(float newSpeed) {
    speed = newSpeed;
  }
}
