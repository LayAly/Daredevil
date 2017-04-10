class NewGame
{
  void setupGame()
  {
    state = 2;
    
    background(251, 243, 242);
    //fill(221, 0, 0);
    stroke(0);
    fill(255, 202, 204);
    rect(10, 470, 90, 10, 5);
    noStroke();
   
   // Pillars
    rect(200, 0, 100, 180);
    rect(180, 180, 140, 20, 10);
    rect(400, 550, 100, 450);
    rect(380, 550, 140, 20, 10);
    
    fill(247, 250, 126);
    
    triangle(190, 200, 210, 260, 230, 200);
    triangle(270, 200, 290, 260, 310, 200);
    triangle(390, 550, 410, 480, 430, 550); 
    triangle(470, 550, 490, 480, 510, 550);
    fill(255, 188, 108);
    triangle(230, 200, 250, 290, 270, 200);
    triangle(430, 550, 450, 450, 470, 550);
    
    drawImage();
  }
  
  void drawImage()
  {
    PImage img1 = loadImage("Devil.png");
    image(img1, 20, 400, 80, 80);
  }
  

}