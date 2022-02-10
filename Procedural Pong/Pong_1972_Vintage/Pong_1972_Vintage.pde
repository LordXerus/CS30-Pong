float xBall, yBall, ballRadius;
float xLeftNet, xRightNet;
float xLeftWall, xRightWall;

void setup() {
  fullScreen();

}

void draw() {
  background(#000000);
  fill(#ffffff);
  stroke(#ffffff);
  ellipse(bx, by, bwdiameter, bhdiameter);
  rect(p1x, p1y, p1w, p1h);
  rect(p2x, p2y, p2w, p2h);
  line(nwx1, nwy1, nwx2, nwy2);
  line(nex1, ney1, nex2, nwy2);
  line(nmx1, nmy1, nmx2, nmy2);


}
