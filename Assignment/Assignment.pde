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
static final int NUMPIPES = 1000;
int numPipes;

//Buttons
boolean overBox = false;
boolean overBox2 = false;
boolean overBox3 = false;
boolean overBox4 = false;
boolean overBox5 = false;

boolean locked = false;
boolean goBack = false;
//Added new boolean for music
Boolean playing = true;

boolean fall = false;

int state = 0;
int highScore = 0;

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
  
  game.makePipes();
  in = minim.getLineIn(Minim.STEREO);
 
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
    //if (p.pos.y  > height - 120)  state = 0;
    fill(0);
    text("Score : ",20,40);
    text(p.score,120,40);
    break; 
    
    case 3:
    over.drawOver();
    player.play(); 
    playing = true;
  }    
}


void mousePressed()
{
   main.mousePressed(); 
   instructions.mousePressed(); 
   over.mousePressed();
}