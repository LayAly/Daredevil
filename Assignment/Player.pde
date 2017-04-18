class Player {
  PVector pos;
  int score;
  PImage img1;

  Player() {
    score = 0;
    pos = new PVector(100, 100);
  }

 void draw() {
    drawDevil();
    img1 = loadImage("Devil.png");
    
    for(int i = 0; i < in.bufferSize()-1; i++)
    {
      pos.y += 50 + in.left.get(i+1)*50;
      pos.x += 50 + in.left.get(i)*50;
    }
   
    image(img1, pos.x, pos.y);
    
  }

  void drawDevil() {
    
    image(img1, pos.x, pos.y, 80, 80);
  }
}