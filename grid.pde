class grid {
  PVector vec;
  boolean alive = false;
  
  grid(PVector vec) {
    this.vec = vec;
  }
  
  void setAlive(boolean alive) {
    this.alive = alive;
  }
  
  boolean getAlive(){
    return this.alive;
  }
  
  void show() {
    if (this.alive) {
      fill(0);
    }else{
      fill(255);
    } 
    square(this.vec.x, this.vec.y, sqr_size);
  }
}
