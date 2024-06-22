//tp3 Valentino La Gioiosa
//Comision 1
//link del video: https://youtu.be/ds3Pn4WUljI
PImage imagendeltp;
float giro = 0;
boolean pausa = false;

void setup() {
  size(800, 400);
  imagendeltp = loadImage("imagendeltp.png");
  resetVariables();
}

void draw() { //comando para saber la ubicacion que apunto en la consola
  println("X:");
  println(mouseX);
  println("Y:");
  println(mouseY);
  
  background(0);
  image(imagendeltp, 0, 0, width / 2, height); 
  if (!pausa) {
    giro += 0.02; //velocidad de giro
  }
  patron(600 * 1 / 1, height / 2, 200, 13,  giro); //este comando sirve para dibujar el patron
}
//cuerpo de la esfera
void patron(float centerX, float centerY, float maxRadius, int steps, float offset) {
  for (int i = 0; i < steps; i++) {
    float ratio = i / float(steps);
    float radius = maxRadius * ratio;  
    int numEllipses = (int) map(radius, 0, maxRadius, 5, 70);
    for (int j = 0; j < numEllipses; j++) {
      float angle = j * TWO_PI / numEllipses + offset;
      float x = centerX + cos(angle) * radius;
      float y = centerY + sin(angle) * radius;
      float ellipseWidth = calculateEllipseSize(radius, maxRadius);
      float ellipseHeight = map(radius, 0, maxRadius, 1, 17);
      fill(255);
      noStroke();
      ellipse(x, y, ellipseWidth, ellipseHeight);
    }
  }
}

//funcion  con paramentross que no retorna un valor
void resetVariables() {
  giro = 0;
  pausa = false;
}

//funcion propia con parametros que retorna un valor
float calculateEllipseSize(float radius, float maxRadius) {
  return map(radius, 0, maxRadius, 2, 10);
}

void keyPressed() {  //desde aca podes reiniciar el patron apretando R o con la P pausando
  if (key == 'r' || key == 'R') {
    resetVariables();
  } else if (key == 'p' || key == 'P') {
    pausa = !pausa;
  }
}
