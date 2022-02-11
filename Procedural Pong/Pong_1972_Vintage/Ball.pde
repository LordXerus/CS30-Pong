float angle; 
float speed = 1;
float xMove, yMove;
float bounceLeniency;

float xRadius, yRadius;

void drawBall() {
    ellipse(xBall, yBall, ballRadius, ballRadius);
}
void moveBall() {
    float top = 0, bottom = height;

    if (
        yMove > 0 && yBall + yMove + ballRadius > bottom + bounceLeniency ||
        yMove < 0 && yBall + yMove - ballRadius < top - bounceLeniency
        ) { 
        angle = -angle; 
        newVel();
    }
    
    float left = xLeftNet, right = xRightNet;
    
    if (
        xMove > 0 && xBall + xMove + ballRadius > right + bounceLeniency||
        xMove < 0 && xBall + xMove - ballRadius < left - bounceLeniency
        ) { 
        angle = 180-angle; /*speed=0;*/
        newVel();
    }

    xBall += xMove;
    yBall += yMove;
}

float g;
void newVel() {
    float new_angle;
    do {
        g = repGaussian(50) * 2;
        new_angle = angle + g;
        float r = radians(new_angle);

        xMove = floor(cos(r) * speed);
        yMove = floor(sin(r) * speed);
    } while (abs(xMove) > abs(3*yMove) || abs(yMove) > abs(3*xMove));
    angle = new_angle;
}

float repGaussian(int t) {
    float s = 0;   
    for (int i = 0; i < t; i++) s += randomGaussian();
    return s;
}
