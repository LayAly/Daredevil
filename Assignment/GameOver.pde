class GameOver
{
  
  boolean initiated = false;

  void setupOver()
  {
    state = 3;
    background(251, 243, 242);
    font = createFont("font.ttf", 55);
    f = createFont("font2.otf", 20);

    //drawOver();
  }

  PFont font;
  PFont f;

  void drawOver()
  {
    if(!initiated) {setupOver(); initiated = false;}
    background(251, 243, 242);

    // Outline
    strokeWeight(15);
    stroke(265, 222, 224);
    fill(251, 243, 242);
    rect(90, 90, 800, 500, 7);

    //Game over
    textSize(55);
    textFont(font);
    fill(0);
    stroke(0);
    text("Game Over!", 380, 200);

    // Text
    textSize(20);
    fill(0);
    stroke(0);
    textSize(20);
    textFont(f);
    text("High Score", 260, 300);
    text("Your Score", 625, 300);
    
    // displays scores...
    textSize(35);
    text(highScore, 290, 350);
    text(p.score, 655, 350);
    

    button();

    // Main menu button
    strokeWeight(1);
    stroke(0);
    fill(265, 222, 224);
    rect(240, 460, 110, 60, 5);



    textFont(f);
    textSize(15);
    fill(0);
    stroke(0);
    text("Main menu", 260, 495);

    // Replay button
    strokeWeight(1);
    stroke(0);
    fill(265, 222, 224);
    rect(620, 460, 110, 60, 5);

    textFont(f);
    textSize(15);
    fill(0);
    stroke(0);
    text("Play again?", 640, 495);

  }

  void button()
  {

    float boxWidth = 110;
    float boxHeight = 60;

    if (mouseX > 240 && mouseX < 240+boxWidth && mouseY > 460 && mouseY < 460+boxHeight)
    {
      overBox4 = true;

      if (!locked)
      {
        strokeWeight(2);
        stroke(0);
        rect(240, 460, 110, 60, 5);
      }
    }
    else 
    {
      overBox4 = false;
      strokeWeight(1);
    }

    if (mouseX > 620 && mouseX < 620+boxWidth && mouseY > 460 && mouseY < 460+boxHeight)
    {
      overBox5 = true;

      if (!locked)
      {
        strokeWeight(3);
        stroke(0);
        rect(620, 460, 110, 60, 5);
      }
    } 
    else
    {
      overBox5 = false;
      strokeWeight(1);
    }
  }


  void mousePressed()
  {
    if (overBox4)
    {
      locked = true;
      main.drawMain();
      overBox4 = false;
      state = 0;
      locked = false;
    }  

    if (overBox5)
    {
      locked = true;
      game.setupGame();
      overBox5 = false;
      state = 2;
      locked = false;
    }
  }
}