class Camera 
{
  PVector pos; //Camera's position 
  Camera()
  {
    pos = new PVector(0, 0);
  }

  void draw()
  {
    pos.x+=2; 
  }
}