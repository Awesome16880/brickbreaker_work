class Grid {
  int rows;
  int numBricks; //number of bricks per row
  Brick grid[][];
  float m;
  
  Grid (){ 
  }
  
  void creategrid(int rows, int numBricks){
    grid = new Brick[rows][numBricks];
    int x = 0; int y = 100;
    for (int r = 0; r < grid.length; r++){ 
        for (int c = 0; c < grid[r].length; c++){
          Brick b;
          b = new Brick(x, y, 30, 20);
          b.display();
          grid[r][c] = b;
          m = m + 1;
          x = x + 30;
         } //c
       x = 0;
       y = y + 20;
    }//r 
  }
  void displaygrid(){
    for (int r = 0; r < grid.length; r++){
      for (int c = 0; c < grid[r].length; c++){
        Brick b = grid[r][c];
        b.display();
      }
    }
  }
  void rungrid(Ball bb){
    for (int r = 0; r < grid.length; r++){
      for (int c = 0; c < grid[r].length; c++){
        Brick b = grid[r][c];
        b.changeBallXYVel(bb);
        b.changeState(b.detectBall(bb));
        b.updateState();
        }
      }
    }
  float checkgrid(){
    float n = m;
    for (int r = 0; r < grid.length; r++){
      for (int c = 0; c < grid[r].length; c++){
        Brick b = grid[r][c];
        if (b.state == DEAD){
          n = n - 1;
        }
      }
    }
    return n;
  }
}


/*  void swap (int a, int b) {
    int t = grid[r][a];
    grid[r][a]=grid[r][b];
    grid[r][b] = t;
  }*/
  //to be used to swap bricks
