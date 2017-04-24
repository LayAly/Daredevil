class GameOver
{
  boolean initiated = false;

  void setupOver()
  {
    background(251, 243, 242);
    //drawOver();
  }

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
    textFont(font);
    fill(0);
    stroke(0);
    textSize(55);
    text("Game Over!", 380, 200);

    // Text
    textSize(20);
    fill(0);
    stroke(0);
    textFont(font2);
    textSize(20);
    text("High Score", 260, 300);
    text("Your Score", 625, 300);
    
    // displays scores...
    textSize(35);
    text(p.highScore, 290, 350);
    text(p.score, 655, 350);
    

    button();

    // Main menu button
    strokeWeight(1);
    stroke(0);
    fill(265, 222, 224);
    rect(240, 460, 110, 60, 5);
    
    //Main Menu
    textFont(font2);
    textSize(15);
    fill(0);
    stroke(0);
    text("Main menu", 260, 495);

    // Replay button
    strokeWeight(1);
    stroke(0);
    fill(265, 222, 224);
    rect(620, 460, 110, 60, 5);

    textFont(font2);
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
      //Main Menu Button
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
      //Play Again Button
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
      drawMain = true;
      overBox = false;
      locked = false;
      drawOver = false;
      //locked = false;
      //playAgain = true;
    }  

    if (overBox5)
    {
      locked = true;
      drawPlay = true;
      overBox5 = false;
      locked = false;
      drawOver = false;
      //playAgain = true;
      p.score = reset;
      //playAgain = false;
      //locked = false;
    }
  }
}