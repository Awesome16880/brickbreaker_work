class Ball {
  int cx;
  int cy;
  int xVel;
  int yVel;
  int radius;
  color c;
  int ADState = LIVEBALL;
  
  Ball (){
    int red = int(random(0, 255));
    int green = int(random(0, 255));
    int blue = int(random(0, 255));
    c = color(red, green, blue);
    radius = 12;
    cx = int(random(radius, width - radius));
    cy = int(random(radius, height - radius));
    xVel = int(random(-20, 20));
    if ((xVel > -15) && (xVel < 15)){
      xVel = 20;
    }
    yVel = int(random(1, 20));
    
  }
  
  Ball(int x, int y, int r, color f){
    this();
    radius = r;
    cx = x;
    cy = y;
    c = f;
  }
  
  Ball(int x, int y, int xv, int yv, int r, color f){
    this();
    radius = r;
    cx = x;
    cy = y;
    xVel = xv;
    yVel = yv;
    c = f;
  }
  
  void display(color cc){
    fill(cc);
    circle(this.cx, this.cy, this.radius * 2);
  }
  
  void move(){
    if ((cx <= radius) || (cx >= (width-radius))) {
      xVel *= -1;
    }
    if ((cy <= radius)) {
      yVel *= -1;
    }
    cx += xVel;
    cy += yVel;
  }
  
  boolean death(){
    float deadzone = width + (2 * radius);
    if (cy > deadzone){
      ADState = DEADBALL;
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean detectBrick(Brick b) {
    int checkX = this.cx;
    int checkY = this.cy;
    float d;
    if (b.state > 0){
      if (this.cx <= b.x) {
        checkX = b.x;
      } 
      else if (this.cx >= b.x+b.brickWidth) {
        checkX = b.x + b.brickWidth;
      }
      if (this.cy <= b.y) {
        checkY = b.y;
      } 
      else if (this.cy >= b.y + b.brickHeight) {
        checkY = b.y+b.brickHeight;
       }
      d = dist(this.cx, this.cy, checkX, checkY);
      if (d <= this.radius) {
        return true;
      }
      else {
        return false;
      }
    }
    else{
      return false;
    }
  }
  
  boolean detectPaddle(Paddle p){
    int checkX = this.cx;
    int checkY = this.cy;
    float d;
    if (this.cx <= p.x){
      checkX = p.x;
    }
    else if (this.cx >= p.x+p.paddleSectionWidth) {
      checkX = p.x + p.paddleSectionWidth;
    }
    if (this.cy <= p.y) {
      checkY = p.y;
    } 
    else if (this.cy >= p.y + p.paddleHeight) {
      checkY = p.y+p.paddleHeight;
     }
     d = dist(this.cx, this.cy, checkX, checkY);
     if (d <= this.radius){
       return true;
     }
     else{
       return false;
     }
  }
}
