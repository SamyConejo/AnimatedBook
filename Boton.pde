class Boton{
  int x,y,size,ancho,curva;
  color cE;
  Boton(int _x, int _y, int _size, int _ancho, int _curva, color c){
    x=_x;
    y=_y; 
    size=_size;
    ancho=_ancho;
    curva=_curva;
    cE=c;
  }
  
  void display(){
  fill(cE);
  stroke(255,50);
  rect(x, y, size+ancho, size,curva);
  }
  
  void insertarTexto(String texto, color c, PFont _font, float _fX, float _fY){
   fill(c);
   textFont(_font);
   text(texto, _fX, _fY);
    
  }
  boolean overRect()  {
  if (mouseX >= x && mouseX <= x+size+ancho && 
      mouseY >= y && mouseY <= y+size) {
    return true;
  } else {
    return false;
  }
} 
}
