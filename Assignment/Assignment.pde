import ddf.minim.*;

//Added this for the music
AudioPlayer player;
AudioInput in;
Minim minim;//audio context

Instructions instructions;
Main main;
NewGame game;
GameOver over;

//New classes
Player p;
PipeSet[] ps;
Camera c;

//Variable for pipes
static final int NUMPIPES = 1000;
int numPipes;

//Buttons
//Play button
boolean overBox = false;

//Instruction button
boolean overBox2 = false;

//Back button on Instruction page
boolean overBox3 = false;

//Main menu button on gameOver page
boolean overBox4 = false;

//Play again button on gameOver page
boolean overBox5 = false;

boolean locked = false;
boolean goBack = false;

//Added new boolean for music
Boolean playing = true;

boolean fall = false;

int state = 0;

void setup()
{
  size(1000,800, P2D);
  
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
  
  //Audio input
  minim.debugOn();
  //Load image on input (stereo, bufferSize, sampeRate, bitDepth)
  in = minim.getLineIn(Minim.STEREO, 50, 44100, 16 );
  game.makePipes();
 
}

 void draw()
{
  switch(state)
  {
    case 0:
    main.drawMain();
    //Added for playing
    player.play(); 
    playing = true;
    break;
    
    case 1:
    instructions.setupInstruct();
    break;
    
    case 2:
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
    if (p.pos.y  > height - 120)  state = 3;
    break; 
    
    case 3:
    over.setupOver();
    break;
  }    
}


void mousePressed()
{
   main.mousePressed(); 
   instructions.mousePressed(); 
   over.mousePressed();
   
}