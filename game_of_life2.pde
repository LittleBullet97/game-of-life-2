import java.util.LinkedHashSet;
import java.util.Set;
int sqr_size = 10;
int sqr_x = 100;
int sqr_y = 100;
grid[][] grid = new grid[sqr_x][sqr_y];
grid[][] cp = new grid[sqr_x][sqr_y];

void setup() {
  size(1000, 1000);
  createGrid(grid);
  initSqr(5000);
}

void draw() { 
  showGrid(grid);
  nextGen();
  //sigle step
  noLoop();
}
void keyPressed() {

  if (key == ' ') {
    loop();
  }
}
