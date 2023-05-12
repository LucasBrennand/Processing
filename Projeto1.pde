int sunY;
int coord;
int x1Casa, x2Casa, y1Casa, y2Casa;
int x1Telhado, x2Telhado, x3Telhado, y1Telhado, y2Telhado, y3Telhado;
int x1Porta, x2Porta, y1Porta, y2Porta;
float xPessoa = 0;  // posição horizontal da pessoa
float yPessoa = 400;  // posição vertical da pessoa
int radius = 10, directionX = 1, directionY = 0;
float x=20, y=20, speed=0.5;


void setup(){
  size(1000,600);
  sunY = 100;
  coord = 0;
  //Casa
  x1Casa = 600;
  x2Casa = 200;
  y1Casa = 300;
  y2Casa = 200;
  //Telhado
  x1Telhado = 500;
  x2Telhado = 660;
  x3Telhado = 800;
  y1Telhado = 300;
  y2Telhado = 200;
  y3Telhado = 300;
  //Porta
  x1Porta = 660;
  x2Porta = 50;
  y1Porta = 420;
  y2Porta = 80;
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
  if(x1Casa > 500){
  x1Casa=x1Casa-1;
  y1Casa=y1Casa-1;
  x2Casa=x2Casa+1;
  y2Casa=y2Casa+1;
  }
  
  //Porta
  fill(0, 0, 0);
  stroke(0, 0, 0);
  rect(x1Porta, y1Porta, x2Porta, y2Porta);
  if (x1Porta > 600){
  x1Porta -= 1;
  y1Porta -= 1;
  x2Porta += 1;
  y2Porta += 1;
  }
  
  //Telhado
  fill(153, 60, 6);
  stroke(153, 60, 6);
  triangle(x1Telhado, y1Telhado, x2Telhado, y2Telhado, x3Telhado, y3Telhado);
  if(x1Telhado > 400){
  x1Telhado -= 1;
  y1Telhado -= 1;
  y2Telhado -= 2;
  x3Telhado += 1;
  y3Telhado -= 1;
  }
  
  //Braços
  fill(0);
  stroke(0);
  rect(xPessoa - 10, yPessoa + 10, 10, 30);
  rect(xPessoa + 30, yPessoa + 10, 10, 30);

  
  //Pernas
  fill(0);
  stroke(0);
  rect(xPessoa, yPessoa + 50, 10, 50);
  rect(xPessoa + 20, yPessoa + 50, 10, 50);
 
  
  //Tronco do boneco
  fill(255, 70, 0);
  stroke(255, 70 ,0);
  rect(xPessoa, yPessoa, 30, 50);
 
  
  //Cabeça do boneco
  fill(255, 255, 0);
  stroke (255, 255, 0);
  ellipse(xPessoa + 15, yPessoa, 30, 30);
  
  //Movimento do boneco
   xPessoa += 3;
    if (xPessoa > width) {
    xPessoa = -30;
  }
 
 
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
  coord += 4;
  ellipse (coord, 150, 100, 100);
  ellipse (coord, 200, 100, 100);
  ellipse (coord-50, 200, 100, 100);
  ellipse (coord+50, 200, 100, 100);
  if(coord > 2000){
coord = coord -50;
}
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      //if (directionX>0) { 
      directionX=-1;
      directionY=0;
      //}
    }
    else if (keyCode == RIGHT)
    {
      //if (directionX<0) {  
      directionX=1;
      directionY=0;
      //}
    }
    else if (keyCode == UP)
    {
      //if (directionY<0) {
      directionY=-1;
      directionX=0;
      //}
    }
    else if (keyCode == DOWN)
    {
      //if (directionY<0) { 
      directionY=1;
      directionX=0;
      //}
    }
  }
}
