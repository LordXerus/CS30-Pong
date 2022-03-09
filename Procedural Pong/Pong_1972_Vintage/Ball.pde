import java.lang.*;

float angle; 
float speed = 1;
float xMove, yMove;
float bounceLeniency;

float xRadius, yRadius;

boolean scored = false;
int scoredMillis = 0;

void drawBall() {
    ellipse(xBall, yBall, ballRadius, ballRadius);
}
void moveBall() {
    if(!focused) return;

    if(!scored) {
        float top = 0, bottom = height;
        
        float ballTop = yBall - ballRadius;
        float ballBottom = yBall + ballRadius;
        if (
            yMove > 0 && yBall + yMove + ballRadius > bottom ||
            yMove < 0 && yBall + yMove - ballRadius < top
            ) { 
            angle = -angle; 
            newVel();
        }
        
        float left = xLeftNet, right = xRightNet;
        
        if (
            xMove > 0 && xBall + xMove > right ||
            xMove < 0 && xBall + xMove < left
            ) { 
            
            if(xMove > 0 && xBall + xMove > right) leftScore ++;
            else rightScore ++;

            scored = true;
            scoredMillis = millis();
        }
        float full_pad1w = 2*pad1w;
        float full_pad2w = 2*pad2w;
        if (
            xMove > 0 && xBall + xMove > pad2x - pad2w && yBall + ballRadius > pad2y - pad2h && yBall - ballRadius < pad2y + pad2h ||
            xMove < 0 && xBall + xMove < pad1x + pad1w && yBall + ballRadius > pad1y - pad1h && yBall - ballRadius < pad1y + pad1h 
            ) {
            angle = 180-angle;
            newVel();
            }
    
        xBall += xMove;
        yBall += yMove;
    } else {
        if (millis() - scoredMillis > 3000) {
            xBall = width/2;
            yBall = height/2;
            scored = false;
            angle = getRandomAngle();
            newVel();
        }
    }
}

ArrayList<PVector> path = new ArrayList<PVector>();

float predict_Y(float target_x) {
    float s_xBall = xBall;
    float s_yBall = yBall;
    float s_yMove = yMove;
    
    float multiplier = 1.0; // next speed step
    
    float delta = target_x - s_xBall;

    // if the signs are different, the ball will move away from the paddle
    
    path.clear();
    path.add(new PVector(xBall, yBall));
    
    while (true) {
        
        if (Math.signum(delta * xMove) <= 0) {
            println("NaNed");
            return Float.NaN;
        }
        
        multiplier = 1.0;
        float req_ystep = ( 
            (s_yMove > 0) ? (height - s_yBall):
            /*(s_yMove < 0) ? */(0 - s_yBall)
        ) / (s_yMove * multiplier);
        
        delta = target_x - s_xBall;
        println(target_x, s_xBall, delta, xMove, multiplier);
        float req_xstep = delta / (xMove * multiplier);
       
        
        multiplier = (req_xstep < req_ystep) ? req_xstep : req_ystep;
        
        // advance simulation
        s_xBall += xMove * multiplier;
        s_yBall += s_yMove * multiplier;
        
        path.add(new PVector(s_xBall, s_yBall));
        
        // ball will hit paddle first
        if (req_xstep <= req_ystep || abs(delta) <= 0.01) return s_yBall;
        
        // ball will hit wall first
        s_yMove *= -1;
    }
}
    
void drawPredictedPath(){
    for (int i = 0; i < path.size() - 1; i++) {
        PVector start = path.get(i);
        PVector end = path.get(i+1);
        line(start.x, start.y, end.x, end.y);
    }
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
