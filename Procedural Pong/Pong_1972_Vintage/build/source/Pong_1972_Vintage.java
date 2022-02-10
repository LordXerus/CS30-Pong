import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Pong_1972_Vintage extends PApplet {

int start = 0;
boolean fullscr = false;
public void setup() {
  

}
public void draw() {
    ellipse(bx, by, bwdiameter, bhdiameter);
    rect(p1x, p1y, p1w, p1h);
    rect(p2x, p2y, p2w, p2h);
    line(nwx1, nwy1, nwx2, nwy2);
    line(nex1, ney1, nex2, nwy2);
    line(nmx1, nmy1, nmx2, nmy2);


}
    public void settings() {  fullScreen(); }
    static public void main(String[] passedArgs) {
        String[] appletArgs = new String[] { "Pong_1972_Vintage" };
        if (passedArgs != null) {
          PApplet.main(concat(appletArgs, passedArgs));
        } else {
          PApplet.main(appletArgs);
        }
    }
}
