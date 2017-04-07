/**
 * Created by yasminanunez on 04/04/2017.
 */

import processing.core.PApplet;
import processing.core.PFont;
import processing.core.PImage;

public class Instructions extends PApplet
{
    public void draw()
    {
        background(251, 243, 242);
    }
}
public class Instructions
{
    MainPage proc;

    Instructions(MainPage proc)
    {
        this.proc = proc;
    }

    public void displayPage()
    {

        float boxWidth = 100;
        float boxHeight = 60;
        boolean overBox = false;
        boolean locked = false;

        proc.background(251, 243, 242);

        // Outline
        proc.strokeWeight(15);
        proc.stroke(265, 222, 224);
        proc.fill(251, 243, 242);
        proc.rect(100, 100, 800, 600, 7);

        // Text
        proc.textSize(20);
        proc.fill(88, 88, 88);
        proc.stroke(88,88,88);
        proc.textSize(22);
        proc.text("Use your voice to navigate through the obstacles", 270, 360);
        proc.textSize(20);
        proc.text("This is you", 270, 450);
        proc.text("Avoid these", 625, 450);

        proc.textSize(25);
        proc.fill( 88, 88, 88);
        proc.stroke( 88, 88, 88);
        proc.text("Back", 155, 160);

        // Obstacle drawing
        proc.fill(265, 222, 224);
        proc.noStroke();
        proc.rect(620, 500, 130, 20);
        proc.rect(640, 500, 90,150);

    }
}