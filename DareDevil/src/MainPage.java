/**
 * Created by yasminanunez on 03/04/2017.
 */

import processing.core.PApplet;
import processing.core.PFont;
import processing.core.PImage;

public class MainPage extends PApplet
{

    public void setup()
    {
        textSize(30);
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

        boolean overBox = false;
        boolean overBox1 = false;
        boolean locked = false;

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

    }

    public static void main(String[] args) {
        String[] a = {"MAIN"};
        PApplet.runSketch( a, new MainPage());

    }
}
