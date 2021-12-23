//brick states
int DEAD = 0;
int WHITE = 1;
int CYAN = 2;
int BLUE = 3;

boolean in_play = true;

Grid grid;
Ball b;
Paddle uno;
Paddle dos;
Paddle tres;
//How do I get the paddle to work? 

void setup(){
  size(900, 600);
  background(0);
  frameRate(60);
  uno = new Paddle((width / 2) - 30, height - 10, 10, 30, -1.15, 0, #FFFF00);
  dos = new Paddle((width / 2), height - 10, 10, 30, 1, 1, #00FF00);
  tres = new Paddle((width /2) + 30, height - 10, 10, 30, 1.15, 2, #FFFF00);
  b = new Ball((width / 2), height - 10 - 12, 12, #FF0000);
  grid = new Grid();
  grid.creategrid(8, 30);
  b.display(#FF0000);
  uno.displayIDZero(uno, #FFFF00);
  dos.displayIDOne(dos, #00FF00);
  tres.displayIDTwo(tres, #FFFF00);
}

void draw(){
  println (b + " " + uno + " " + dos + " " + tres + " " + grid);
  if (b.detectPaddle(uno) == true){
    b.xVel *= -1.15;
    b.yVel *= -1;
    b.move();
  }
  else if (b.detectPaddle(dos) == true){
    b.xVel *= 1;     b.yVel *= -1;
    b.move();
  }
  else if (b.detectPaddle(tres) == true){
    b.xVel *= 1.15;
    b.yVel *= -1;
    b.move();
  }
  b.move();
  uno.moveIDZero();
  dos.moveIDOne();
  tres.moveIDTwo();
  grid.rungrid(b);
  
}