class Brick {
  int x;
  int y;
  int brickHeight;
  int brickWidth;
  int protoState;
  int state;
  int nextState;
  
  Brick (){
    brickWidth = 30;
    brickHeight = 20;
    protoState = int(random(0, 100));
    if (protoState <= 90){
      state = WHITE; //approximately 60% chance of white brick (state = 1)
    }
    else if ((protoState <= 98) && (protoState > 90)){
      state = CYAN; //approximately 30% chance of cyan brick (state = 2)
    }
    else if (protoState > 98){
      state = BLUE; //approximately 10% chance of blue brick (state = 3)
    }
  }
  Brick (int xx, int yy, int brickWidthh, int brickHeightt){
    this();
    x = xx;
    y = yy;
    brickWidth = brickWidthh;
    brickHeight = brickHeightt;
    //statee = state;
  }
  
  void display(){
    if (state == DEAD){
      fill(#000000);
      rect(x, y, brickWidth, brickHeight);
    }
    else if (state == BLUE){
      fill(#00008B);
      rect(x, y, brickWidth, brickHeight);
    }
    else if (state == CYAN){
      fill(#00FFFF);
      rect(x, y, brickWidth, brickHeight);
    }
    else if (state == WHITE){
      fill(#FFFFFF);
      rect(x, y, brickWidth, brickHeight);
    }
  }
  
  void changeBallXYVel(Ball b){
    if (detectBall(b) == true){
      b.yVel *= -1;
      b.xVel *= -1;
    }
  }
  
  boolean detectBall(Ball b){
    int checkX = this.x;
    int checkY = this.y;
    float d;
    //brick x, y
    //(x, y), (x + brickWidth, y), (x, y + brickHeight), (x + brickWidth, y + brickHeight)
    
    if (this.x <= b.cx) {
      checkX = b.cx;
    } 
    else if (this.x >= b.cx+brickWidth) {
      checkX = b.cx + brickWidth;
    }
    if (this.y <= b.cy) {
      checkY = b.cy;
    } 
    else if (this.y >= b.cy + brickHeight) {
      checkY = b.cy+brickHeight;
    }
    d = dist(this.x, this.y, checkX, checkY);
    return (d <= b.radius);
  }
  
  void updateState(){
    state = nextState;
  }
  
  void changeState(boolean detectBall){
    if (detectBall == true){
      if (state == WHITE){
        nextState = DEAD;
      }
      else if (state == CYAN){
        nextState = WHITE;
      }
      else if (state == BLUE){
        nextState = CYAN;
      }
      else{
        nextState = state;
      }
    }
    else{
      nextState = state;
    }
  }
}
