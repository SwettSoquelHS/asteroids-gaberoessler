//note that this class does NOT *NEED* to extend Mover but can if you like
class Star {
  float x_pos;
  float y_pos;
  float radius;
  
  Star(float x, float y, float radius){
    x_pos = x;
    y_pos = y;
    this.radius = radius;
  }  
  
  void show(){
    fill(251,255,227);
    ellipse(x_pos,y_pos,radius,radius);

  }
  
  
  //your code here
}
