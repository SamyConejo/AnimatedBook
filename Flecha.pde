class Flecha {
  float px = 0;        
  float py = 0;

  float x1,y1,x2,y2,x3,y3;   
 
  Flecha(float _x1, float _y1, float _x2, float _y2, float _x3, float _y3) {
    x1 = _x1;
    y1 = _y1;
    x2 = _x2;
    y2 = _y2;
    x3 = _x3;
    y3 = _y3;
    
  }

  void display() {

    px = mouseX;
    py = mouseY;

    strokeWeight(5);
    stroke(0);
    fill(255);
    triangle(x1, y1, x2, y2, x3, y3);
    noStroke();
    strokeWeight(1);
  }


  boolean overTriang() {

    float areaOrig = abs( (x2-x1)*(y3-y1) - (x3-x1)*(y2-y1) );

    float area1 =    abs( (x1-px)*(y2-py) - (x2-px)*(y1-py) );
    float area2 =    abs( (x2-px)*(y3-py) - (x3-px)*(y2-py) );
    float area3 =    abs( (x3-px)*(y1-py) - (x1-px)*(y3-py) );

    if (area1 + area2 + area3 == areaOrig) {
      return true;
    }
    return false;
  }
}
