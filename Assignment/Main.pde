class Main
{
  void drawMain()
    {
        state = 0;
        background(251, 243, 242);
        textSize(30);
        
        textFont(font, 100);
        fill(0);
        text("Dare Devil" , 275, 200);
        strokeWeight(1);
        fill(265, 222, 224);
        rect(350, 300, 300, 60, 5);
        rect(350, 450, 300, 60, 5);
        
        button();
        fill(0);
        textFont(font2);
        textSize(30);
        text("Play" , 475, 340);
        text("Instructions" , 420, 490);
        drawImage();
    }
    
    

  void drawImage()
    {
        PImage img1,img2;
        img1 = loadImage("Devil.png");
        img2 = loadImage("tri.png");
        //Added - changed position
        image(img1, 40, 590, 160, 160);
        image(img2, 820, 590, 160, 160);
      
    }

void button()
{
   float boxWidth = 300;
   float boxHeight = 60;
        
        if (mouseX > 350 && mouseX < 350+boxWidth &&
                mouseY > 300 && mouseY < 300+boxHeight)
        {
            overBox = true;
            if(!locked)
            {
                strokeWeight(2);
                stroke(0);
                rect(350, 300, 300, 60, 5);

            }
        }
        else
        {
          overBox = false;
          strokeWeight(1);
          
        }

        if (mouseX > 350 && mouseX < 350+boxWidth &&
                mouseY > 450 && mouseY < 450+boxHeight)
        {
            overBox2 = true;
            if(!locked)
            {
                strokeWeight(2);
                stroke(0);
                rect(350, 450, 300, 60, 5);

            }
        }
        else
        {
            overBox2 = false;
            strokeWeight(1);
        }

       

    }

 void mousePressed()
    {
       if(overBox)
        {
          locked = true;
          drawPlay = true;
          overBox = false;
          state = 2;
          locked = false;
          drawMain = false;
          p.score = reset;
        }  
        
      if(overBox2)
        {
          locked = true;
          drawInstructions = true;
          overBox2 = false;
          state = 1;
          locked = false;
          drawMain = false;
        }    
    }
}