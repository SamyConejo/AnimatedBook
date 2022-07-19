import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim, minimLose;
AudioPlayer player[];
PFont mono;
boolean readOver, listOver, homeOver, nextOver, revOver, soundActive, revActive, nextActive, homeActive= false;
PImage scenes[];
int count, nPage;
Boton bLeer, bEscuchar, bHome, bPage1;
Flecha next, rev;

void setup() {
  size(1000, 820);
  scenes = new PImage[8];
  player = new AudioPlayer[6];
  minim = new Minim(this);
  minimLose = new Minim(this);
  mono = createFont("./data/font/windy.ttf", 32); 
  player[0] = minim.loadFile("./data/sound/fondo.mp3");
  player[1] = minim.loadFile("./data/sound/1.mp3");
  player[2] = minim.loadFile("./data/sound/2.mp3");
  player[3] = minim.loadFile("./data/sound/3.mp3");
  player[4] = minim.loadFile("./data/sound/4.mp3");
  player[5] = minim.loadFile("./data/sound/5.mp3");
  scenes[0] = loadImage("./data/images/portada.jpeg");
  scenes[1] = loadImage("./data/images/home.png");
  scenes[2] = loadImage("./data/images/2.jpg");
  scenes[3] = loadImage("./data/images/3.jpg");
  scenes[4] = loadImage("./data/images/4.jpg");
  scenes[5] = loadImage("./data/images/5.jpg");
  scenes[6] = loadImage("./data/images/6.jpg");
  scenes[7] = loadImage("./data/images/7.jpg");
  player[0].play();
  initStage();
}


void draw() {
  updateButton(); 

  if (count == 0) {
    initStage();
    if(soundActive && homeActive == true){
      player[1].pause();
      player[1].rewind();
    }
  } else if (count == 1) {
    setPage1();
    if(soundActive && revActive == true){
      player[2].pause();
      player[2].rewind();
    }
  } else if (count == 2) {
    setPage2();
    if(soundActive && revActive == true){
      player[3].pause();
      player[3].rewind();
    }else if(soundActive && nextActive == true){
      player[1].pause();
      player[1].rewind();
    }
  } else if (count == 3) {
    setPage3();
    if(soundActive && revActive == true){
      player[4].pause();
      player[4].rewind();
    }else if(soundActive && nextActive == true){
      player[2].pause();
      player[2].rewind();
    }
  
  } else if (count == 4) {
    setPage4();
    if(soundActive && revActive == true){
      player[5].pause();
      player[5].rewind();
    }else if(soundActive && nextActive == true){
      player[3].pause();
      player[3].rewind();
    }
   
  } else if (count == 5) {
    setPage5();
    if(soundActive && revActive == true){
      player[6].pause();
      player[6].rewind();
    }else if(soundActive && nextActive == true){
      player[4].pause();
      player[4].rewind();
    }
    
  } else if (count > 5) {
    setPageFinal();
    player[5].pause();
    player[5].rewind();  
  }
  if (!player[0].isPlaying()) {
    player[0].rewind();
    player[0].play();
  }
}

void initStage() {
  nPage = 0;
  bLeer = new Boton(300, height-120, 70, 90, 10, #D7EAE0);
  bEscuchar = new Boton(590, height-120, 70, 90, 10, #D7EAE0);
  scenes[0].resize(width, height);
  image(scenes[0], 0, 0);
  bLeer.display();
  bLeer.insertarTexto("Leer", #000000, mono, width/2-150, height-75);
  bEscuchar.display();
  bEscuchar.insertarTexto("Escuchar", #000000, mono, width/2+113, height-75);
}

void setPage1() {
  if (soundActive) { 
    player[1].play();
  }
  readOver = false;
  listOver = false;
  nPage = 1;
  scenes[2].resize(width, height);
  image(scenes[2], 0, 0);
  bPage1 = new Boton(20, height-220, 120, width-160, 10, color(#D7EAE0, 90));
  bPage1.display();
  fill(#FFFFFF);
  String p1= "En el corazón del bosque vivían tres cerditos que eran hermanos. El lobo siempre andaba persiguiéndolos para comérselos. Para escapar del lobo, los cerditos decidieron hacerse una casa.";
  textSize(28);
  text(p1, 40, height-215, width-30, height-160);
  next = new Flecha(920, 760, 960, 780, 920, 800);
  next.display();
  bHome = new Boton(20, height-85, 75, 1, 10, color(#FFFFFF, 0));
  bHome.display();
  scenes[1].resize(70, 70);
  image(scenes[1], 24, height-85);
  fill(0, 80);
  noStroke();
  rect(width/2-20, height-60, 50, 35, 8);
  fill(255);
  text(nPage, width/2, height-30);
  if (bHome.overRect()) {
    homeOver = true;
    readOver = false;
    listOver = false;
    nextOver = false;
    revOver = false;
  } else if (next.overTriang()) {
    nextOver = true;
    homeOver = false;
    readOver = false;
    listOver = false;
    revOver = false;
  }
}
void setPage2() {
  if (soundActive) {
    player[2].play();
  }
  readOver = false;
  listOver = false;
  nPage = 2;
  scenes[3].resize(width, height);
  image(scenes[3], 0, 0);
  bPage1 = new Boton(20, height-220, 120, width-160, 10, color(#D7EAE0, 90));
  bPage1.display();
  fill(255);
  String p2="El pequeno la hizo de paja, para acabar antes y poder irse a jugar. El mediano construyó una casita de madera. Se dio prisa para irse a jugar con su hermano. El mayor trabajaba en su casa de ladrillo.";
  textSize(28);
  text(p2, 40, height-215, width-50, height-160);
  next = new Flecha(920, 760, 960, 780, 920, 800);
  next.display();
  rev = new Flecha(80, height-20, 40, height-40, 80, height-60);
  rev.display();
  fill(0, 80);
  noStroke();
  rect(width/2-20, height-60, 50, 35, 8);
  fill(255);
  text(nPage, width/2, height-30);
  if (next.overTriang()) {
    nextOver = true;
    readOver = false;
    listOver = false;
    homeOver = false;
    revOver = false;
  } else if (rev.overTriang()) {
    revOver = true;
    nextOver = false;
    homeOver = false;
    readOver = false;
    listOver = false;
  }
}
void setPage3() {
  if (soundActive) { 
    player[3].play();
  }
  readOver = false;
  listOver = false;
  nPage = 3;
  scenes[4].resize(width, height);
  image(scenes[4], 0, 0);
  bPage1 = new Boton(20, height-220, 120, width-160, 10, color(#D7EAE0, 90));
  bPage1.display();
  fill(255);
  String p3="El lobo salió detrás del cerdito pequeno y él corrió hasta su casita de paja, pero el lobo sopló y sopló y la casita de paja derrumbó. El cerdito pequeno corrió a refugiarse en casa de su hermano mediano.";
  textSize(28);
  text(p3, 40, height-215, width-50, height-160);
  next = new Flecha(920, 760, 960, 780, 920, 800);
  next.display();
  rev = new Flecha(80, height-20, 40, height-40, 80, height-60);
  rev.display();
  fill(0, 80);
  noStroke();
  rect(width/2-20, height-60, 50, 35, 8);
  fill(255);
  text(nPage, width/2, height-30);
  if (next.overTriang()) {
    nextOver = true;
    readOver = false;
    listOver = false;
    homeOver = false;
    revOver = false;
  } else if (rev.overTriang()) {
    revOver = true;
    nextOver = false;
    homeOver = false;
    readOver = false;
    listOver = false;
  }
}
void setPage4() {
  if (soundActive) {
    player[4].play();
  }
  readOver = false;
  listOver = false;
  nPage = 4;
  scenes[5].resize(width, height);
  image(scenes[5], 0, 0);
  bPage1 = new Boton(20, height-220, 120, width-160, 10, color(#D7EAE0, 90));
  bPage1.display();
  fill(255);
  String p4="Pero el lobo sopló y sopló y la casita de madera derribó. Los dos cerditos salieron pitando a la casa del hermano mayor. Los tres se metieron dentro y cerraron bien todas las puertas y ventanas.";
  textSize(28);
  text(p4, 40, height-215, width-70, height-160);
  next = new Flecha(920, 760, 960, 780, 920, 800);
  next.display();
  rev = new Flecha(80, height-20, 40, height-40, 80, height-60);
  rev.display();
  fill(0, 80);
  noStroke();
  rect(width/2-20, height-60, 50, 35, 8);
  fill(255);
  text(nPage, width/2, height-30);
  if (next.overTriang()) {
    nextOver = true;
    readOver = false;
    listOver = false;
    homeOver = false;
    revOver = false;
  } else if (rev.overTriang()) {
    revOver = true;
    nextOver = false;
    homeOver = false;
    readOver = false;
    listOver = false;
  }
}
void setPage5() {
  if (soundActive) {
    player[5].play();
  }
  readOver = false;
  listOver = false;
  nPage = 5;
  scenes[6].resize(width, height);
  image(scenes[6], 0, 0);
  bPage1 = new Boton(20, height-220, 120, width-160, 10, color(#D7EAE0, 90));
  bPage1.display();
  fill(255);
  String p5="El lobo con una escalera trepó hasta la chimenea, el cerdito mayor puso una olla con agua caliente. El lobo cayó sobre el agua y se quemó. Escapó de allí aullando. Se cuenta que nunca jamás quiso comer cerditos.";
  textSize(28);
  text(p5, 40, height-215, width-80, height-160);
  next = new Flecha(920, 760, 960, 780, 920, 800);
  next.display();
  rev = new Flecha(80, height-20, 40, height-40, 80, height-60);
  rev.display();
  fill(0, 80);
  noStroke();
  rect(width/2-20, height-60, 50, 35, 8);
  fill(255);
  text(nPage, width/2, height-30);
  if (next.overTriang()) {
    nextOver = true;
    readOver = false;
    listOver = false;
    homeOver = false;
    revOver = false;
  } else if (rev.overTriang()) {
    revOver = true;
    nextOver = false;
    homeOver = false;
    readOver = false;
    listOver = false;
  }
}
void setPageFinal() {
  readOver = false;
  listOver = false;
  scenes[7].resize(width, height);
  image(scenes[7], 0, 0);
  bHome = new Boton(20, height-85, 75, 1, 10, color(#FFFFFF, 0));
  bHome.display();
  scenes[1].resize(70, 70);
  image(scenes[1], 24, height-85);
  if (bHome.overRect()) {
    homeOver = true;
    readOver = false;
    listOver = false;
    nextOver = false;
    revOver = false;
  }
}
void updateButton() {
  if (bLeer.overRect()) {
    readOver = true; 
    listOver = false;
    homeOver = false;
    nextOver = false;
    revOver = false;
  } else if (bEscuchar.overRect()) {
    listOver = true;
    readOver = false;
    homeOver = false;
    nextOver = false;
    revOver = false;
  } else {
    readOver = false;
    listOver = false;
    homeOver = false;
    nextOver = false;
    revOver = false;
  }
}

void mouseClicked() {

  if (readOver) {
    soundActive = false;
    println("leer");
    count++;
  } else if (listOver) {
    soundActive = true;
    println("escuchar");
    count++;
  } else if (homeOver) {
    homeActive = true;
    nextActive = false;
    revActive = false;
    println("home");
    count = 0;
  } else if (nextOver) {
    homeActive = false;
    nextActive = true;
    revActive = false;
    count++;
    println("next");
  } else if (revOver) {
    homeActive = false;
    nextActive = false;
    revActive = true;
    count--;
    println("rev");
  } else {
    println("out");
  }
}
