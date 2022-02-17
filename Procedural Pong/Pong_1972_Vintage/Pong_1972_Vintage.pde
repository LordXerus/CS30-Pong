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
  background(focused ? #000000 : #444444);
  fill(#ffffff);
  stroke(#ffffff);
  
  moveBall();
  drawBall();
  
  movePaddle();
  
  
  rect(pad1x, pad1y, pad1w, pad1h); // left
  rect(pad2x, pad2y, pad2w, pad2h); // right
  line(xLeftNet, 0, xLeftNet, height); 
  line(xRightNet, 0, xRightNet, height);
  
  fill(0, 0, 0, 0);
  rect(score1x, scorey, 100, scoreSize);
  rect(score2x, scorey, 100, scoreSize);
  
  fill(#ffffff);
  textSize(scoreSize);
  text(Float.toString(g), score1x, scorey);
  text(Float.toString(angle), score2x, scorey);
}
