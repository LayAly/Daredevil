class Player {
  PVector pos;
  int score;

  Player() {
    score = 0;
    pos = new PVector(100, 100);
  }

 void draw() {
    drawDevil();

    if (keyPressed) {
      if (key == ' ') pos.y-=7;
    }
    pos.y += 4;
    pos.x += 2;
  }

  void drawDevil() {
    
    PImage img1 = loadImage("Devil.png");
    image(img1, pos.x, pos.y, 80, 80);
  }
}