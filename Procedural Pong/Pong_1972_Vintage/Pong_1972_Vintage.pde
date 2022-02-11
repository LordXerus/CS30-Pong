float xBall, yBall, ballRadius;
float xLeftNet, xRightNet;
float yUpperWall, yLowerWall;

float pad1x, pad1y, pad1w, pad1h;
float pad2x, pad2y, pad2w, pad2h;

float score1x, score2x, scorey;

int scoreSize;

void setup() {
  fullScreen();
  //size(500, 500);
  rectMode(RADIUS);
  ellipseMode(RADIUS);
  textAlign(CENTER, CENTER);
  init();
  surface.setAlwaysOnTop(true);
}

void draw() {
  background(#000000);
  fill(#ffffff);
  stroke(#ffffff);
  
  moveBall();
  drawBall();
  
  
  rect(pad1x, pad1y, pad1w, pad1h); // left
  rect(pad2x, pad2y, pad2w, pad2h); // right
  line(xLeftNet, 0, xLeftNet, height); 
  line(xRightNet, 0, xRightNet, height);
  
  textSize(scoreSize);
  text(Float.toString(g), score1x, scorey);
  text(Float.toString(angle), score2x, scorey);
}
