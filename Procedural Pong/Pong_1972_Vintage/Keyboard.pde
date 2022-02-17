HashMap<Character, Boolean> _KEYMAP = new HashMap();
HashMap<Integer, Boolean> _KEYMAPCODED = new HashMap();

void keyPressed(){
    if (key == CODED) {
        _KEYMAPCODED.put(keyCode, true);
    }
    else {
        _KEYMAP.put(key, true);
    }
}

void keyReleased(){
    if (key == CODED) {
        _KEYMAPCODED.put(keyCode, false);
    }
    else {
        _KEYMAP.put(key, false);
    }
}

boolean getKey(char c) {
    return _KEYMAP.getOrDefault(c, false);
}
boolean getKey(int c) {
    return _KEYMAPCODED.getOrDefault(c, false);
}
