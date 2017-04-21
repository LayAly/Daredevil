class Instructions 
{

  void setupInstruct()
    {
        state = 1;
        background(251, 243, 242);

       img = loadImage("Devil.png");
 
      
       drawInstruct();
    }


    PImage img;
    
    void drawInstruct()
    {

        background(251, 243, 242);
        
        PFont font = createFont("font.ttf", 32);
        PFont font2 = createFont("font2.otf", 32);

        // Outline
        strokeWeight(15);
        stroke(265, 222, 224);
        fill(251, 243, 242);
        rect(80, 80, 800, 600, 7);

        // Text
        textFont(font2);
        textSize(20);
        fill(0);
        strokeWeight(0);
        textSize(22);
        text("Use your voice to navigate through the obstacles", 270, 360);
        textSize(20);
        text("This is you: ", 270, 450);
        text("Avoid these: ", 625, 450);

        // Title
        textFont(font);
        textSize(64);
        fill(0);
        text("How to play", 350, 250);

        //Added - Changed position
        image(img, 250, 480, 130, 130);

        textFont(font2);
        textSize(25);
        fill(0);
        stroke(0);
        text("Back", 155, 160);
     
       

        // Obstacle drawing
        fill(255, 202, 204);
        noStroke();

        rect(630, 530, 90, 10, 8);
        rect(640,  540, 70, 100);

        fill(247, 250, 126);
        triangle( 640, 530,  660, 530, 650, 480);
        triangle(690, 530,  710, 530, 700, 480);
        fill(255, 188, 108);
        triangle(660, 530, 690, 530, 675, 480);
        
       button();
       noFill();
       stroke(0);
       rect(130, 120, 100, 60, 5);
       

    }

   void button()
  {
        
        if (mouseX > 130 && mouseX < 130+100 &&
                mouseY > 120 && mouseY < 120+60)
        {
            overBox3 = true;
            if(!locked)
            {
                strokeWeight(2);
                stroke(0);
                noFill();
                rect(130, 120, 100, 60, 5);

            }
        }
        else
        {
          strokeWeight(1);
          stroke(0);
          noFill();
          rect(130, 120, 100, 60, 5);
          overBox3 = false;

        }
  }
  
  void mousePressed() 
  {
      if(overBox3)
        {
          locked = true;
          main.drawMain();
          overBox3 = false;
          state = 0;
          locked = false;
        }
  }
}