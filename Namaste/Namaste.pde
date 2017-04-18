
import ddf.minim.*;

Minim minim;
AudioInput p;

PImage img;
 PVector pos;
void setup()
{
  size(512, 200, P2D);

  
  minim = new Minim(this);
  minim.debugOn();
  
  img = loadImage("Devil.png");
  
  // get a line in from Minim, default bit depth is 16
  p = minim.getLineIn(Minim.STEREO, 50, 44100, 16 );
  background(0);
}

void draw()
{

  background(0);
  // Image
  for(int i = 0; i < p.bufferSize()-1; i++)
  {
    pos.y += 50+p.left.get(i+1)*50;
    pos.x += 50 + p.left.get(i)*50;
  }
  image(img, pos.x, pos.y);
  
}
  
void stop()
{
  p.close();
  minim.stop();
  super.stop();
}