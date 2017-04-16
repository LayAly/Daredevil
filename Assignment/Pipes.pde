class PipeSet 
{
  PVector pos;
  float bHeight, bWidth;
  boolean scored;

  PipeSet(float x, float y, float h) 
  {
    pos = new PVector(x, y);
    bHeight = h + 350;
    bWidth = 10;
    scored = false;
  }

  void draw() {
    drawPipes();
  }

  void drawPipes() {
    
    fill(247, 250, 126);
    //Top Spikes
    triangle(pos.x - 10, pos.y + 10, pos.x + 10, pos.y+70, pos.x+30, pos.y+10);
    triangle(pos.x +70, pos.y + 10, pos.x + 90, pos.y+70, pos.x+110, pos.y+10);
    
    //Bottom Spikes
    triangle(pos.x - 10, pos.y+bHeight, pos.x+10, pos.y+bHeight - 60, pos.x +30, pos.y+bHeight);
    triangle(pos.x +70, pos.y+bHeight, pos.x + 90, pos.y+bHeight - 60, pos.x+110, pos.y+bHeight);
    
    fill(255, 188, 108);
    //Top Middle
    triangle(pos.x+30, pos.y + 10, pos.x + 50, pos.y+100, pos.x+70, pos.y+10);
    //Bottom Middle
    triangle(pos.x +30, pos.y+bHeight, pos.x + 50, pos.y+bHeight - 90, pos.x+70, pos.y+bHeight);

    fill(255, 202, 204);
    //Top rect
    rect(pos.x, 0, 100, pos.y);
    rect(pos.x-20, pos.y-2, 140, 20, 10);
    
    //Bottom rect
    rect(pos.x, pos.y+bHeight, 100, height);
    rect(pos.x-20, pos.y+bHeight, 140, 20, 10);
  }
}