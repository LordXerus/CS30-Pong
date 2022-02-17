int pad1v, pad2v;

void movePaddle(){
    if(!focused) return;
    int top = 0, bottom = height;
    if (getKey('w')) {
        if(pad1y > top + pad1h)
            pad1y -= pad1v;
    }
    
    if (getKey('s')){
        if(pad1y < bottom - pad1h)
            pad1y += pad1v;
    }
        
    
    if (getKey(UP)){
        if(pad2y > top + pad2h)
            pad2y -= pad2v;
    }
    if (getKey(DOWN)) {
        if(pad2y < bottom - pad2h)
            pad2y += pad2v;
    }
}
    
