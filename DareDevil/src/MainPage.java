/**
 * Created by yasminanunez on 03/04/2017.
 */

import processing.core.PApplet;
import processing.core.PFont;
import processing.core.PImage;

public class MainPage extends PApplet
{
    boolean overBox = false;
    boolean overBox1 = false;
    boolean overBox3 = false;
    boolean locked = false;
    boolean drawInstruct = false;
    boolean goBack = false;

    int state;

    Instructions instructions;


    public void setup()
    {
        textSize(30);
        instructions = new Instructions(/*this*/);

    }

    public void settings()
    {
        size(1000, 800);
    }

    public void draw()
    {
        PFont font, font2;
        font = createFont("font.ttf", 32);
        font2 = createFont("font2.otf", 32);

        float boxWidth = 300;
        float boxHeight = 60;


        background(251, 243, 242);
        textFont(font, 100);
        fill(0);
        text("Dare Devil" , 275, 200);

        strokeWeight(1);
        fill(265, 222, 224);
        rect(350, 300, 300, 60, 5);
        rect(350, 450, 300, 60, 5);


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

        if (mouseX > 350 && mouseX < 350+boxWidth &&
                mouseY > 450 && mouseY < 450+boxHeight)
        {
            overBox1 = true;
            if(!locked)
            {
                strokeWeight(2);
                stroke(0);
                rect(350, 450, 300, 60, 5);

            }
        }
        else
        {
            overBox = false;
            overBox1 = false;
            strokeWeight(1);
        }

        fill(0);
        textFont(font2, 30);
        text("Play" , 475, 340);
        text("Instructions" , 420, 490);

        PImage img1,img2;
        img1 = loadImage("Devil.png");
        img2 = loadImage("tri.png");
        image(img1, 40, 520, 160, 160);
        image(img2, 820, 520, 160, 160);

        if(drawInstruct == true)
        {
            textFont(font2, 30);
            instructions.draw();

            textFont(font, 30);
            // Title
            textSize(55);
            fill(88, 88,88);
            stroke(88, 88, 88);
            text("How to play", 350, 250);
            image(img1, 240, 490, 160, 160);

            if (mouseX > 130 && mouseX < 130+boxWidth &&
                    mouseY > 120 && mouseY < 120+boxHeight)
            {
                overBox = true;
                if(!locked)
                {
                    strokeWeight(5);
                    stroke( 255);
                    noFill();
                    rect(130, 120, 100, 60, 5);

                }
            }
            else
            {
                overBox3 = false;
                strokeWeight(2);
                stroke( 255);
                noFill();
                rect(130, 120, 100, 60, 5);
            }

        }

        if(goBack == true)
        {
            state=0;
        }

    }

    public void mousePressed()
    {
        if(overBox1)
        {
            drawInstruct =  true;
        }
        if(overBox3)
        {
            goBack =  true;
        }
    }

    public static void main(String[] args) {
        String[] a = {"MAIN"};
        PApplet.runSketch( a, new MainPage());

    }
}
