/**
 * Created by yasminanunez on 03/04/2017.
 */
import ddf.minim.*;

Instructions instructions;
Main main;
NewGame game;


//Buttons
boolean overBox = false;
boolean overBox2 = false;
boolean overBox3 = false;


boolean locked = false;
boolean goBack = false;

boolean fall = false;


int state = 0;




void setup()
{
  size(1000,800);
  instructions = new Instructions();
  main = new Main();
  game = new NewGame();
 
 /* for(int i =0; i<4; i++)
  {
    p[i] = new pillars(i);
  }*/

}

 void draw()
{
  switch(state)
  {
    case 0:
    main.drawMain();
    break;
    
    case 1:
    instructions.setupInstruct();
    break;
    
    case 2:
    game.setupGame();
    break;
    
    
  }     

}

 void mousePressed()
    {
        main.mousePressed(); 
        instructions.mousePressed();
        
    }