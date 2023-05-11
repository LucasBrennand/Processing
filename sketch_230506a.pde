int sunY;
int x1Corpo, x2Corpo, x3Corpo, x4Corpo;
int xCabeca, yCabeca;
int x1BracoDireito, x2BracoDireito;
int x1BracoEsquerdo, x2BracoEsquerdo;
int x1PernaDireita, x2PernaDireita;
int x1PernaEsquerda, x2PernaEsquerda;
int coord;
int x1Casa, x2Casa, y1Casa, y2Casa;


void setup(){
  size(1000,600);
  sunY = 100;
  x1Corpo = 94;
  x2Corpo = 419;
  x3Corpo = 9;
  x4Corpo = 49;
  xCabeca = 98;
  yCabeca = 415;
  x1BracoDireito = 100;
  x2BracoDireito = 140;
  x1BracoEsquerdo = 90;
  x2BracoEsquerdo = 60;
  x1PernaDireita = 80;
  x2PernaDireita = 150;
  x1PernaEsquerda = 
  x2PernaEsquerda = 
  coord = 50;
  x1Casa = 600;
  x2Casa = 200;
  y1Casa = 300;
  y2Casa = 200;
}


void draw(){
   //Ceu
  background(128, 219, 242);
  
  //Estrela
   pushMatrix();
  fill (255, 280, 80);
  stroke (255, 280, 80);
  translate(width*0.2, height*0.2);
  rotate(frameCount / -100.0);
  star(0, 0, 30, 9, 5); 
  popMatrix();
  
  //Sol
  fill (255, 255, 255);
  stroke (255, 255, 255);
  circle (800,sunY,100);
  
  //Nuvem
  fill(82, 95, 97);
  stroke(82, 95, 97);
  cloud();

  //Casa
  fill(207, 31, 4);
  stroke(207, 31, 4);
  rect(x1Casa,y1Casa,x2Casa,y2Casa);
  
  //Porta
  fill(0, 0, 0);
  stroke(0, 0, 0);
  rect(675,420,50,80);
  
  //Janela
  fill (171, 247, 246);
  stroke(0, 0, 0);
  strokeWeight(4);
  square(720, 340, 50);
  line(745, 340, 745, 390); //vertical
  line(720, 365, 770, 365);
  
  //Telhado
  fill(153, 60, 6);
  stroke(153, 60, 6);
  triangle(550, 300, 700, 200, 850, 300);
  
  //Braços
  fill(255, 255, 255);
  stroke(255, 255, 255);
  line(x1BracoDireito, 430, x2BracoDireito, 452); //direito
  line(x1BracoEsquerdo,430, x2BracoEsquerdo, 452); //esquerdo
  if (x1BracoDireito > 700){
  x1BracoDireito = x1BracoDireito - 1;
  x2BracoDireito = x2BracoDireito - 1;
  x1BracoEsquerdo = x1BracoEsquerdo - 1;
  x2BracoEsquerdo = x2BracoEsquerdo - 1;
  }
  x1BracoDireito = x1BracoDireito + 1;
  x2BracoDireito = x2BracoDireito + 1;
  x1BracoEsquerdo = x1BracoEsquerdo + 1;
  x2BracoEsquerdo = x2BracoEsquerdo + 1;
  
  //Pernas
  fill(255, 255, 255);
  stroke(255, 255, 255);
  line(x1PernaDireita, 440, x2PernaDireita, 500);
  if (x1PernaDireita > 700){
    x1PernaDireita = x1PernaDireita - 1;
  }
  x1PernaDireita = x1PernaDireita + 1;

  
  //Tronco do boneco
  fill(255, 255, 255);
  stroke(255, 255, 255);
  rect(x1Corpo, x2Corpo, x3Corpo, x4Corpo);
  if (x1Corpo > 695){
    x1Corpo = x1Corpo - 1;
  }
  x1Corpo = x1Corpo + 1;
  
    //Cabeça do boneco
  fill(255, 255, 255);
  stroke(255, 255, 255);
  ellipse(xCabeca, yCabeca, 30, 30);
  if (xCabeca > 700){
    xCabeca = xCabeca - 1;
  }
  xCabeca = xCabeca + 1;
  
   //Grama
  fill(7, 110, 39);
  stroke(7, 110, 39);
  rect(-1,500,1050,500);
  
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void cloud(){
  ellipse (coord, 150, 100, 100);
  ellipse (coord, 200, 100, 100);
  ellipse (coord-50, 200, 100, 100);
  ellipse (coord+50, 200, 100, 100);
coord = coord + 2;
}
