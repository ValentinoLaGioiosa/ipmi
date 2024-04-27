//tp1 Valentino La Gioiosa
//Comision 1

PImage koala;
void setup(){
  size(800,400);
  koala = loadImage("koala.jpeg");
  koala.resize(400,400);
  image(koala,0,24);
  
}

void draw() { //Comando para saber la ubicacion que apunto en la consola
  println("X:");
  println(mouseX);
  println("Y:");
  println(mouseY);
  
  
  
  //cuerpo
  
  fill(121, 120, 118); // color de la cabeza
  ellipse(565,394,180,215);
  ellipse(565,394,145,200);
  ellipse(564,259,180,215); //cabeza

  
  //orejas
  fill(182); // Color blanco
  ellipse(477,203,95,95);
  ellipse(477,203,45,45);
  ellipse(650,203,95,95);
  ellipse(650,203,45,45);


  
  //cabeza
  fill(121, 120, 118); // color de la cabeza
  ellipse(564,259,180,215); //cabeza
  
  //ojos
  fill(54,25,17); //color del ojo
  ellipse(600, 258, 15, 15); //ojo de la derecha
  ellipse(529, 258, 15, 15); // ojo de la izquierda
  fill(54); //color de la pupila
  ellipse(529, 258,5,5);//pupila izquierda
  ellipse(600, 258, 5, 5); // pupila derecha
  
  // Nariz
  fill(0); // Color negro
  ellipse(565, 282, 30, 60); // Nariz
  
  
  
}
