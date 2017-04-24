class Player 
{
  PVector pos;
  int score;
  int fall = 0;
  int highScore = 0;

  Player()
  {
    score = 0;   
    pos = new PVector(100, 100);
  }

  void draw()
  {
    drawDevil();

   /* if (keyPressed)
    {
      if (key == ' ') pos.y-=18;
    }*/

    //if (
    pos.y += 9;
    pos.x += 2;
  }

  void drawDevil() 
  {
      float avg = 0;
    
      for (int i = 0; i < in.bufferSize(); i++)
      {
        avg -= abs(in.left.get(i));
      }
    //println(avg);
    //avg = avg / in.bufferSize();
    //println(avg);
    // println("");

    PImage img1 = loadImage("Devil.png");
    if (avg < -75)
    {  
      avg = -75;
    }
    pos.y = pos.y + avg/7;
    image(img1, pos.x, pos.y, 80, 80);

    // Check highscore
    if (score > highScore)
    {
      highScore = score;
    }
  }
}