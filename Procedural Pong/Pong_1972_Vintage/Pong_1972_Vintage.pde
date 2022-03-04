float xBall, yBall, ballRadius;
float xLeftNet, xRightNet;
float yUpperWall, yLowerWall;

float pad1x, pad1y, pad1w, pad1h;
float pad2x, pad2y, pad2w, pad2h;

float score1x, score2x, scorey;

int leftScore = 0, rightScore = 0;
int scoreSize;

int startState = 0;
void setup() {
  //fullScreen();
  size(500, 500);
  rectMode(RADIUS);
  ellipseMode(RADIUS);
  textAlign(CENTER, CENTER);
  init();
  //surface.setAlwaysOnTop(true);
}

void draw() {
  background(focused ? #000000 : #444444);
  
  if (startState == 0) {
      textSize(40);
      textSize(40 * (width / textWidth("Choose Left Paddle Speed using 123")));
      text("Choose Left Paddle Speed using 123", width*0.5, height*0.2);
      if(keyPressed) {
          if (key == '1') pad1v *= 0.5;
          else if (key == '2');
          else if (key == '3') pad1v *= 1.5;
          if('1' <= key && key <= '3') startState = 1;
          
      }
      
      return;
  }
  else if (startState == 1) {
      if (keyPressed) return;
      startState = 2;
      return;
  }
  else if (startState == 2) {
      textSize(40);
      textSize(40 * (width / textWidth("Choose Left Paddle Speed using 123")));
      text("Choose Right Paddle Speed using 123", width*0.5, height*0.5);
      if(keyPressed) {
          if (key == '1') pad2v *= 0.5;
          else if (key == '2');
          else if (key == '3') pad2v *= 1.5;
          if('1' <= key && key <= '3') startState = 3;
      }
      
      return;
  }
  
  
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
  text(leftScore, score1x, scorey);
  text(rightScore, score2x, scorey);
}
