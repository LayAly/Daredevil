
class GameOver
{

  void setupOver()
  {
    background(251, 243, 242);
    font = createFont("Christmas Time Personal Use", 55);
    f = createFont("flicker DEMO", 20);

    drawOver();
  }

  PFont font;
  PFont f;

  void drawOver()
  {

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
    text("Game Over!", 400, 200);

    // Text
    textSize(20);
    fill(0);
    stroke(0);
    textSize(20);
    textFont(f);
    text("High Score", 270, 300);
    text("Your Score", 625, 300);
    
    // displays scores...
    textSize(35);
    text(highScore, 290, 350);
    text(score, 655, 350);
    

    button();

    // Main menu button
    strokeWeight(1);
    stroke(0);
    fill(265, 222, 224);
    rect(320, 460, 110, 60, 5);



    textFont(f);
    textSize(15);
    fill(0);
    stroke(0);
    text("Main menu", 340, 495);

    // Replay button
    strokeWeight(1);
    stroke(0);
    fill(265, 222, 224);
    rect(580, 460, 110, 60, 5);

    textFont(f);
    textSize(15);
    fill(0);
    stroke(0);
    text("Play again?", 600, 495);
  }

  void button()
  {

    float boxWidth = 110;
    float boxHeight = 60;

    if (mouseX > 320 && mouseX < 320+boxWidth && mouseY > 460 && mouseY < 460+boxHeight)
    {
      overBox4 = true;

      if (!locked)
      {
        strokeWeight(2);
        stroke(0);
        rect(320, 460, 110, 60, 5);
      }
    }
    else 
    {
      overBox4 = false;
      strokeWeight(1);
    }

    if (mouseX > 580 && mouseX < 580+boxWidth && mouseY > 460 && mouseY < 460+boxHeight)
    {
      overBox5 = true;

      if (!locked)
      {
        strokeWeight(3);
        stroke(0);
        rect(580, 460, 110, 60, 5);
      }
    } 
    else
    {
      overBox5 = false;
      strokeWeight(3);
    }
  }


  void mousePressed()
  {

    if (overBox4)
    {
      locked = true;
      main.drawMain();
      overBox = false;
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