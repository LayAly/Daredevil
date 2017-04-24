import ddf.minim.*;

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
Boolean drawMain = true;
Boolean drawPlay = false;
Boolean drawInstructions = false;
Boolean drawOver = false;
//////////////////////////////////////
boolean locked = false;
boolean goBack = false;
//Added new boolean for music
Boolean playing = true;
Boolean playAgain = false;
boolean fall = false;


PFont font;
PFont font2;
  
void setup()
{
  size(1000,800, P2D);
  
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

 void draw()
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


void mousePressed()
{
   main.mousePressed(); 
   instructions.mousePressed(); 
   over.mousePressed();
}