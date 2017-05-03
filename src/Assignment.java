import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Assignment extends PApplet {



//Added this for the music
AudioPlayer player;
Minim minim;//audio context
AudioInput in;

Instructions instructions;
Main main;
NewGame game;
GameOver over;

//New classes
Player p;
PipeSet[] ps;
Camera c;

//Variable for pipes
static final int NUMPIPES = 20;
int numPipes;

PVector pos; //Camera's position 
int reset = 0;
int reset1 = 100;

//Buttons
boolean overBox = false;
boolean overBox2 = false;
boolean overBox3 = false;
boolean overBox4 = false;
boolean overBox5 = false;
//////////////////////////////////////
boolean drawMain = true;
    boolean drawPlay = false;
    boolean drawInstructions = false;
    boolean drawOver = false;
//////////////////////////////////////
boolean locked = false;
boolean goBack = false;
//Added new boolean for music
boolean playing = true;
    boolean playAgain = false;
boolean fall = false;


PFont font;
PFont font2;
  
public void setup()
{
  
  
  font = createFont("font.ttf", 100);
  font2 = createFont("font2.otf", 30);
    
  instructions = new Instructions();
  main = new Main();
  game = new NewGame();
  over = new GameOver();
  
  //Added
  ps = new PipeSet[NUMPIPES];
  c = new Camera();
  p = new Player();
  
  //Added for music playing
  if(playing == true)
  {
    //laoding the song
    minim = new Minim(this);
    player = minim.loadFile("Sax.mp3", 2048);
    player.play();
  }
  
  game.makePipes();
  in = minim.getLineIn(Minim.STEREO);
 
}

 public void draw()
{
  if(drawMain)
  {
    main.drawMain();
    //Added for playing
    player.play(); 
    playing = true;
  }
  
  if(drawPlay)
  {
    //background.drawBackground();
    game.setupGame();
    //Added for stop music
    player.pause();
    playing = false;
    
    //Moving pipes 
    translate(-c.pos.x, -c.pos.y);
    p.draw();
    c.draw();
    game.drawPipes();
    translate(c.pos.x, c.pos.y);
    //if (p.pos.y  > height - 120)  state = 0;
    fill(0);
    textSize(30);
    text("Score : ",20,40);
    text(p.score,120,40);
  }
  
  if(drawInstructions)
  {
    instructions.setupInstruct();
  }
  
  if(drawOver)
  {
    over.drawOver();
    player.play(); 
    playing = true;
    c.pos = new PVector(reset, reset);
    p.pos = new PVector(reset1, reset1);
    //playAgain = true;
   // p.score = reset;
  }
  

}


public void mousePressed()
{
   main.mousePressed(); 
   instructions.mousePressed(); 
   over.mousePressed();
}
class Camera 
{
  PVector pos; //Camera's position 
  Camera()
  {
    pos = new PVector(0, 0);
  }

  public void draw()
  {
    pos.x+=2; 
  }
}
class GameOver
{
  boolean initiated = false;

  public void setupOver()
  {
    background(251, 243, 242);
    //drawOver();
  }

  public void drawOver()
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

  public void button()
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


  public void mousePressed()
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
class Instructions 
{
  public void setupInstruct()
  {
    background(251, 243, 242);
    img = loadImage("Devil.png");
    
    drawInstruct();
  }


  PImage img;

  public void drawInstruct()
  {

    background(251, 243, 242);

    // Outline
    strokeWeight(15);
    stroke(265, 222, 224);
    fill(251, 243, 242);
    rect(80, 80, 800, 600, 7);

    // Text
    textFont(font2);
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

    //Back Button
    textFont(font2);
    textSize(25);
    fill(0);
    stroke(0);
    text("Back", 155, 160);

    // Obstacle drawing
    fill(255, 202, 204);
    noStroke();

    rect(630, 530, 90, 10, 8);
    rect(640, 540, 70, 100);
    
    //Pipe EG
    fill(247, 250, 126);
    triangle( 640, 530, 660, 530, 650, 480);
    triangle(690, 530, 710, 530, 700, 480);
    fill(255, 188, 108);
    triangle(660, 530, 690, 530, 675, 480);

    button();
    noFill();
    stroke(0);
    rect(130, 120, 100, 60, 5);
  }

  public void button()
  {

    if (mouseX > 130 && mouseX < 130+100 &&
      mouseY > 120 && mouseY < 120+60)
    {
      //Back Button
      overBox3 = true;
      if (!locked)
      {
        strokeWeight(2);
        stroke(0);
        noFill();
        rect(130, 120, 100, 60, 5);
      }
    } else
    {
      strokeWeight(1);
      stroke(0);
      noFill();
      rect(130, 120, 100, 60, 5);
      overBox3 = false;
    }
  }

  public void mousePressed() 
  {
    if (overBox3)
    {
      locked = true;
      drawMain = true;
      overBox3 = false;
      locked = false;
      drawInstructions = false;
    }
  }
}
class Main
{
  public void drawMain()
    {
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
    
    

  public void drawImage()
    {
        PImage img1,img2;
        img1 = loadImage("Devil.png");
        img2 = loadImage("tri.png");
        //Added - changed position
        image(img1, 40, 590, 160, 160);
        image(img2, 820, 590, 160, 160);
      
    }

  public void button()
  {
     float boxWidth = 300;
     float boxHeight = 60;
        
        if (mouseX > 350 && mouseX < 350+boxWidth &&
                mouseY > 300 && mouseY < 300+boxHeight)
        {
           //Play Button
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
           //Instructions
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

 public void mousePressed()
 {
       if(overBox)
        {
          locked = true;
          drawPlay = true;
          overBox = false;
          locked = false;
          drawMain = false;
          p.score = reset;
        }  
        
      if(overBox2)
        {
          locked = true;
          drawInstructions = true;
          overBox2 = false;
          locked = false;
          drawMain = false;
        }    
  }
}
class NewGame
{
    int jj;
  
    public void setupGame()
    {
        background(251, 243, 242);
        noStroke();
     }

    public void makePipes()
    {
        float x = 500;
        float y = random(100, 400);
        float h = random(75, 125);

        for (int i = 0; i < NUMPIPES; i++) 
       {
          ps[i] = new PipeSet(x, y, h);
          y = random(100, 400);
          h = random(75, 125);
          x += random(200, 300);
        }
     }

    public void drawPipes() 
    {
        for (int i = 0; i < NUMPIPES; i++) 
       { 
          if (PVector.dist(p.pos, ps[i].pos) < 650)
          {
            ps[i].draw();
          }
      
          if (p.pos.x > ps[i].pos.x && p.pos.x < ps[i].pos.x + ps[i].bWidth && p.pos.y > ps[i].pos.y && p.pos.y < ps[i].pos.y + ps[i].bHeight)
          {

              if ((!ps[i].scored))
              {
                p.score++;
                ps[i].scored = true;
                jj = i;
              }

            //if(playAgain)
            //{
            //p.score = reset;
            //ps[i].scored = false;
            //playAgain = false;
            //}
          }

      // Check if player dies
          if (p.pos.x >  ps[i].pos.x && p.pos.x < ps[i].pos.x + ps[i].bWidth && (p.pos.y < ps[i].pos.y + 90 || p.pos.y > ps[i].pos.y + 90 + ps[i].bHeight - 250))
          {
             drawOver = true;
             drawPlay = false;
             playAgain = true;

            float x = 500;
            float y = random(100, 400);
            float h = random(75, 125);

            for (int j = 0; j < NUMPIPES; j++) 
            {
                ps[j] = new PipeSet(x, y, h);
                y = random(100, 400);
                h = random(75, 125);
                x += random(200, 300);
            }

        //ps[jj].scored = false;
          }
        }
    }
}
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

  public void draw()
  {
    drawPipes();
  }

  public void drawPipes() 
  {

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

  public void draw()
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

  public void drawDevil() 
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
  public void settings() {  size(1000,800, P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Assignment" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
