class Paddle {
  int paddleHeight;
  int paddleSectionWidth;
  float sectionEffect;
  int sectionID;
  int x;
  int y;
  color c;
  
  Paddle (int xx, int yy, int paddleHeightt, int paddleSectionWidthh, float sectionEffectx,
  int sectionIDx, color f){
    x = xx;
    y = yy;
    paddleHeight = paddleHeightt;
    paddleSectionWidth = paddleSectionWidthh;
    sectionEffect = sectionEffectx;
    sectionID = sectionIDx;
    c = f;
  }
  
  void displayIDZero(Paddle p, color c){
    int startingY = height - p.paddleHeight;
    fill(c);
    rect(width/2 - p.paddleSectionWidth, startingY, p.paddleSectionWidth, p.paddleHeight);
  }
  
  void PdisplayIDZero(Paddle p, color c){
    int startingY = height - p.paddleHeight;
    fill(c);
    rect(mouseX - p.paddleSectionWidth, startingY, p.paddleSectionWidth, p.paddleHeight);
  }
  
  void displayIDOne(Paddle p, color c){
    int startingY = height - p.paddleHeight;
    fill(c);
    rect(width/2, startingY, p.paddleSectionWidth, p.paddleHeight);
  }
  
  void PdisplayIDOne(Paddle p, color c){
    int startingY = height - p.paddleHeight;
    fill(c);
    rect(mouseX, startingY, p.paddleSectionWidth, p.paddleHeight);
  }
  
  void displayIDTwo(Paddle p, color c){
    int startingY = height - p.paddleHeight;
    fill(c);
    rect(width/2 + (2 * p.paddleSectionWidth), startingY, 
    p.paddleSectionWidth, p.paddleHeight);
  }
  
  void PdisplayIDTwo(Paddle p, color c){
    int startingY = height - p.paddleHeight;
    fill(c);
    rect(mouseX + (2 * p.paddleSectionWidth), startingY, 
    p.paddleSectionWidth, p.paddleHeight);
  }
  
  void moveIDZero(){
    x = mouseX;
  }
  
  void moveIDOne(){
    x = mouseX + paddleSectionWidth;
  }
  
  void moveIDTwo(){
    x = mouseX + paddleSectionWidth;
  }
  
  void changeBallAllVel(Ball b){
    if (detectBall(b) == true){
      b.yVel *= -1;
      b.xVel *= sectionEffect;
    }
  }
  
  boolean detectBall(Ball b){
    int checkX = this.x;
    int checkY = this.y;
    float d;
    if (this.x <= b.cx) {
      checkX = b.cx;
    } 
    else if (this.x >= b.cx+paddleSectionWidth) {
      checkX = b.cx + paddleSectionWidth;
    }
    if (this.y <= b.cy) {
      checkY = b.cy;
    } 
    else if (this.y >= b.cy + paddleHeight) {
      checkY = b.cy+paddleHeight;
    }
    d = dist(this.x, this.y, checkX, checkY);
    return (d <= b.radius);
  }
}
