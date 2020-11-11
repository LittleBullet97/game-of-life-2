void createGrid(grid[][] gr) {
  for (int i = 0; i < sqr_x; i ++) {
    for (int j = 0; j < sqr_y; j ++) {
      gr[i][j] = new grid(new PVector(i*sqr_size, j*sqr_size));
    }
  }
}

void showGrid(grid[][] gr) {
  for (int i = 0; i < sqr_x; i ++) {
    for (int j = 0; j < sqr_y; j ++) {
      gr[i][j].show();
    }
  }
}
void copyGrid(grid[][] gr, grid[][] cp_gr){
  for (int i = 0; i < sqr_x; i++) {
    for (int j = 0; j < sqr_y; j++) {
      cp_gr[i][j].setAlive(gr[i][j].getAlive());
    }
  }
}

void initSqr(int number) {
  Set<Integer>rand = new LinkedHashSet<Integer>();
  
  while (rand.size() < number) {
    rand.add((int)random(sqr_x*sqr_y));
  }
  
  for(int i : rand){
    int x = i % sqr_x;
    int y = i / sqr_x;
    grid[x][y].setAlive(true);
  }
}

int neighbours(int x, int y,grid[][] grid) {
  int br = 0;
  int[] dx = {-1,0,1,
              -1,0,1,
             -1,0,1};
             
  int[] dy = {-1,-1,-1,
              0,0,0,
              1,1,1};
                  
  for(int i = 0; i < 9; i++){
     if(i == 4) continue;
  
      boolean temp = false;
      
      try{
        temp = grid[x+dx[i]][y+dy[i]].getAlive();
      }catch(ArrayIndexOutOfBoundsException e){
        //print("Out of range");
      }

      br = (temp) ? br +=1 : br;
  }
  return br;
}

void nextGen() {
  createGrid(cp);
  copyGrid(grid,cp);
  
  for (int i = 0; i < sqr_x; i++) {
    for (int j = 0; j < sqr_y; j++) {
      boolean isAlive = grid[i][j].getAlive();
      int count_neighbours = neighbours(i,j,grid);
      cp[i][j].setAlive(false);
      if(isAlive){ 
         if(count_neighbours == 2 || count_neighbours == 3){
           cp[i][j].setAlive(true);      
         }
      }else{
        if(count_neighbours == 3){
           cp[i][j].setAlive(true);
        }
      }
    }
    println();
  }
  // update
  copyGrid(cp,grid);
}
