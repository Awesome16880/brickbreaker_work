//brick states
int DEAD = 0;
int WHITE = 1;
int CYAN = 2;
int BLUE = 3;
int LIVEBALL = 69;
int DEADBALL = 70;

boolean in_play = true;
int lives = 3;

Grid grid;
Ball b;
Paddle uno;
Paddle dos;
Paddle tres;

void setup(){
  size(900, 600);
  background(0);
  frameRate(60);
  uno = new Paddle((width / 2) - 30, height - 10, 10, 30, -1.15, 0, #FFFF00);
  dos = new Paddle((width / 2), height - 10, 10, 60, 1, 1, #00FF00);
  tres = new Paddle((width /2) + 60, height - 10, 10, 30, 1.15, 2, #FFFF00);
  b = new Ball((width / 2), height - 10 - 12, 12, #FF0000);
  grid = new Grid();
  grid.creategrid(1, 30);
  b.display(#FF0000);
  uno.displayIDZero(uno, #FFFF00);
  dos.displayIDOne(dos, #00FF00);
  tres.displayIDTwo(tres, #FFFF00);
}

void draw(){
  //println (b + " " + uno + " " + dos + " " + tres + " " + grid);
  background(0);
  if (b.detectPaddle(uno) == true){
    b.xVel *= -1.15;
    b.yVel *= -1;
    b.move();
  }
  else if (b.detectPaddle(dos) == true){
    b.xVel *= 1;     
    b.yVel *= -1;
    b.move();
  }
  else if (b.detectPaddle(tres) == true){
    b.xVel *= 1.15;
    b.yVel *= -1;
    b.move();
  }
  if (in_play == true){
    b.move();
    uno.moveIDZero();
    dos.moveIDOne();
    tres.moveIDTwo();
    grid.rungrid(b);
    b.display(#FF0000);
    grid.displaygrid();
    uno.PdisplayIDZero(uno, #FFFF00);
    dos.PdisplayIDOne(dos, #00FF00);
    tres.PdisplayIDTwo(tres, #FFFF00);
    textSize(20);
    fill(190);
    text("Number of Bricks Left: " + (int)grid.checkgrid(), 25, 25);
    text("Number of Lives Left: " + (int)lives, 500, 25);
  }
  if (b.death() == true){
    b.xVel = 0;
    b.yVel = 0;
    lives = lives - 1;
  }
  if ((b.ADState == DEADBALL) && (lives > 0) && (grid.checkgrid() != 0)){
    int p = int(random(15, 20));
    int q = int(random(0, 2));
    if (q == 0){
      p = p * -1;
    }
    int r = int(random(-20, -1));
    b = new Ball((width / 2), height - 40, p, r, 12, #FF0000);
  }
  if (lives <= 0){
    in_play = false;
    lives = 0;
    textSize(25);
    fill(#FF0000);
    text("You lost. Better luck next time!", 125, 125);
  }
  if (grid.checkgrid() == 0){
    in_play = false;
    textSize(25);
    fill(#00FF00);
    text("You won!", 125, 125);
  }
}
