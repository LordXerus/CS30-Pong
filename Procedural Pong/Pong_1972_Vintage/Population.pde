void init() {
    xBall = width/2; yBall=height/2;
    ballRadius = height*0.02;
    
    xLeftNet = width / 40; xRightNet = width - xLeftNet;
    yUpperWall = 30; yLowerWall = height - yUpperWall;
    
    pad1h = pad2h = height / 8;
    pad1w = pad2w = width / 80;
    
    pad1x = xLeftNet + pad1w; pad2x = xRightNet - pad2w;
    pad1y = pad2y = height/2;
    
    pad1v = height / 100;
    pad2v = height / 100;
    
    score1x = width / 6; score2x = width - score1x;
    scorey = height / 6;
    
    scoreSize = height / 16;
    
    angle = getRandomAngle();
    speed = ballRadius / 2;
    newVel();
}

float getRandomAngle() {
    return random(0, 360);
    //return Math.signum(random(-1, 1)) * 180 + Math.signum(random(-1, 1)) * 90 - 45;
}
