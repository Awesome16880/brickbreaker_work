class Grid {
  int rows;
  int numBricks; //number of bricks per row
  Brick grid[][];
  Grid (){ 
  }
  
  void creategrid(int rows, int numBricks){
    grid = new Brick[rows][numBricks];
    int x = 0; int y = 0;
    for (int r = 0; r < grid.length; r++){ 
        for (int c = 0; c < grid[r].length; c++){
          Brick b;
          b =  new Brick(x, y, 30, 20);
          println("brick " + r + " " + c + " " + x + " " + y );
          b.display();
          x = x + 30;
         } //c
       x = 0;
       y = y + 20;
    }//r 
  }
  void rungrid(Ball bb){
    for (int r = 0; r < grid.length; r++){
      for (int c = 0; c < grid[r].length; r++){
        Brick b = grid[r][c];
        b.changeState(b.detectBall(bb));
        b.updateState();
        }
      }
    }
  void checkgrid(){
    int n = grid.length;
    for (int r = 0; r < grid.length; r++){
      for (int c = 0; c < grid[r].length; r++){
        Brick b = grid[r][c];
        if (b.state == DEAD){
          n = n - 1;
        }
      }
    }
  }
}


/*  void swap (int a, int b) {
    int t = grid[r][a];
    grid[r][a]=grid[r][b];
    grid[r][b] = t;
  }*/
  //to be used to swap bricks
