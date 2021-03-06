class NewGame
{
    int jj;
  
    void setupGame()
    {
        background(251, 243, 242);
        noStroke();
     }

    void makePipes()
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

    void drawPipes() 
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