//TP2 Valentino La Gioiosa
//Comision 1
PImage[] imagenes = new PImage[3];
String[] textos = {
  "Star Wars narra la lucha entre la Alianza Rebelde y el Imperio Galáctico",
  "Series, libros y videojuegos expanden el universo Star Wars",
  "Star Wars ha influido en la cultura popular, el cine y los efectos especiales"
};
int pantallaActual = 0; //pantalla en la que se inicia
int ultimoCambioTiempo = 0;
int duracionPantalla = 2500; //duración de cada pantalla en milisegundos (2,5 segundos)
boolean mostrarBotonInicio = true;
boolean mostrarBotonReiniciar = false;

void setup() {
  size(640, 480);
  imagenes[0] = loadImage("imagen1.jpg");
  imagenes[1] = loadImage("imagen2.jpg");
  imagenes[2] = loadImage("imagen3.jpg");
  textAlign(CENTER, CENTER);
  textSize(21); //aumentar el tamaño del texto
}

void draw() {
  background(0);

  if (mostrarBotonInicio) {
    dibujarBotonInicio();
  } else {
    image(imagenes[pantallaActual], 0, 0, width, height);
    dibujarTextoAnimado(textos[pantallaActual]);

    if (!mostrarBotonReiniciar && millis() - ultimoCambioTiempo > duracionPantalla) {
      pantallaActual++;
      if (pantallaActual >= imagenes.length) {
        mostrarBotonReiniciar = true;
        pantallaActual = imagenes.length - 1;
      }
      ultimoCambioTiempo = millis();
    }

    if (mostrarBotonReiniciar) {
      dibujarBotonReiniciar();
    }
  }
}

//funcion para click del mouse
void mousePressed() {
  if (mostrarBotonInicio) {
    mostrarBotonInicio = false;
    ultimoCambioTiempo = millis();
  } else if (mostrarBotonReiniciar) {
    mostrarBotonReiniciar = false;
    pantallaActual = 0;
    ultimoCambioTiempo = millis();
  }
}

void dibujarBotonInicio() {
  fill(255);
  rect(width / 2 - 75, height / 2 - 25, 150, 50);
  fill(0);
  text("Iniciar", width / 2, height / 2);
}

void dibujarBotonReiniciar() {
  fill(255);
  rect(width / 2 - 75, height / 2 - 25, 150, 50);
  fill(0);
  text("Reiniciar", width / 2, height / 2);
}

void dibujarTextoAnimado(String texto) {
  float x = width / 2 + sin(radians(frameCount * 2)) * 10;
  float y = height - 60; //ajustar la posición del texto
  fill(255, 255, 255, 255 * abs(sin(radians(frameCount * 2))));
  text(texto, x, y);
}
