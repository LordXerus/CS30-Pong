int pad1v, pad2v;


void movePaddle(){
    if(!focused) return;
    move_PL();
    move_PR();
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
        float prediction = predict_Y(pad1x);
        stroke(#FF0000);
        drawPredictedPath();
        
        if(Float.isNaN(prediction)) return;
        
        if (prediction < pad1y) move_PL_up();
        else if (prediction > pad1y) move_PL_down();
        
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
        float prediction = predict_Y(pad2x);
        stroke(#0000FF);
        drawPredictedPath();
        if(Float.isNaN(prediction)) return;
        
        if (prediction < pad2y) move_PR_up();
        else if (prediction > pad2y) move_PR_down();
        
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
