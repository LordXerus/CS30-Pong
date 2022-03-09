int pad1v, pad2v;

float AI_lastXMove = xMove;
float AI_lastYMove = yMove;
boolean updatePrediction = true;
float leftPrediction, rightPrediction;
ArrayList<PVector> leftPredictPath = new ArrayList<PVector>(), rightPredictPath = new ArrayList<PVector>();

void movePaddle(){
    if(!focused) return;
    
   if(autoplayMode != 1 && (AI_lastXMove != xMove || AI_lastYMove != yMove)) {
        updatePrediction = true;
        AI_lastXMove = xMove;
        AI_lastYMove = yMove;
   }
        
    move_PL();
    move_PR();
    
    updatePrediction = false;
}

void move_PL(){
    if (autoplayMode == 1 || autoplayMode == 2) {
        if (getKey('w')) {
            move_PL_up();
        }
        
        if (getKey('s')){
            move_PL_down();
        }
    }
    else {
        if (updatePrediction) {
            leftPredictPath.clear();
            leftPrediction = predict_Y(pad1x + pad1w, new PVector(xBall, yBall), new PVector(xMove, yMove), leftPredictPath);
            if(Float.isNaN(leftPrediction)) {
                println("left detected");
                float t_predict = predict_Y(pad2x - pad2w, new PVector(xBall, yBall), new PVector(xMove, yMove), null);
                
                //leftPredictPath.remove(leftPredictPath.size() - 1);
                
                // please double check yMove, it may be correct or incorrect depending on num of bounces
                // there is also strange infinite loop when ball is in the corner
                // diagram drawing is also buggy 
                leftPrediction = predict_Y(
                    pad1x + pad1w,
                    new PVector(pad2x - pad2w, t_predict),
                    new PVector(-xMove, yMove),
                    leftPredictPath
                    );
            }
            printArray(leftPredictPath);
        }
            
            
            
        stroke(#FF0000);
        drawPredictedPath(leftPredictPath);
        
        
        
        if (leftPrediction < pad1y) move_PL_up();
        else if (leftPrediction > pad1y) move_PL_down();
        
    }
}

void move_PR(){
    if (autoplayMode == 1 || autoplayMode == 3) {
        if (getKey(UP)) {
            move_PR_up();
        }
        
        if (getKey(DOWN)){
            move_PR_down();
        }
    }
    else {
         if (updatePrediction) {
            rightPredictPath.clear();
            rightPrediction = predict_Y(pad2x - pad2w, new PVector(xBall, yBall), new PVector(xMove, yMove), rightPredictPath);
            if(Float.isNaN(rightPrediction)) {
                println("right detected");
                float t_predict = predict_Y(pad1x + pad1w, new PVector(xBall, yBall), new PVector(xMove, yMove), null);
                
                //rightPredictPath.remove(leftPredictPath.size() - 1);
                
                rightPrediction = predict_Y(
                    pad2x - pad2w,
                    new PVector(pad1x + pad1w, t_predict),
                    new PVector(-xMove, yMove),
                    rightPredictPath
                    );
            }
   
        }
            
            
            
        stroke(#0000FF);
        drawPredictedPath(rightPredictPath);
        
        
        
        if (rightPrediction < pad2y) move_PR_up();
        else if (rightPrediction > pad2y) move_PR_down();
        
        
    }
}

int paddleTop, paddleBottom; // 0, height in population

void move_PL_up() {
    if(pad1y > paddleTop + pad1h)
            pad1y -= pad1v;
}

void move_PL_down() {
    if(pad1y < paddleBottom - pad1h)
            pad1y += pad1v;
}

void move_PR_up() {
    if(pad2y > paddleTop + pad2h)
        pad2y -= pad2v;
}

void move_PR_down() {
    if(pad2y < paddleBottom - pad2h)
        pad2y += pad2v;
}
