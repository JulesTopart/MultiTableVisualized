float table, modulus, diameter;

boolean mouseState = false;

Turtle robot;


void setup(){
  size(600,600);
  
  strokeWeight(0.5);
  diameter = 200;
  modulus = 100;
  table = 1.00;
  
  
}


void draw(){
  robot = new Turtle(50,0);
  background(200);
  algorithm();
  
  if (mouseButton == LEFT && mouseState) {
     table += 0.01;
  } else if (mouseButton == RIGHT && mouseState) {
     table -= 0.01;
  } else {
  }
};



void algorithm() {
  
  float result, alpha, beta, phi, eta, dist;
  robot.leverCrayon();

  for (float k = 0.0; k < 10.0; k += 10.0/modulus) {
    result = k * table;
    alpha = k * ((2*PI) / 10.0);
    beta = result * ((2*PI) / 10.0);
    phi = beta - alpha;
    eta = PI - (PI - phi) / 2;
    dist = sqrt(2 * (diameter * diameter) - (2 * (diameter * diameter)) * cos(phi));
    
    //if(k <= 1){
      fill(200);
      rect(0,25,90,450);
      fill(0);
      strokeWeight(0.5);
      textSize(10);
      
      text("table :", 10, 50);   text(table, 40,50);
      text("k :", 10,100);       text(k, 40,100);
      text("result :", 10,150);  text(result, 40,150);
      text("alpha :", 10,200);   text(alpha, 40,200);
      text("beta :", 10,250);    text(beta, 40,250);
      text("phi :", 10,300);     text(phi, 40,300);
      text("eta :", 10,350);     text(eta, 40,350);
      text("dist :", 10,400);    text(dist, 40,400);
    //}

    
    
    
    
    robot.tournerDroite(alpha);
    robot.avancer(diameter);
    robot.tournerDroite(eta);
    robot.poserCrayon();
    robot.avancer(dist);
    robot.leverCrayon();
    robot.tournerDroite(eta);
    robot.avancer(diameter);
    robot.tournerGauche((eta * 2));
    robot.tournerGauche(alpha);
  }
}

void mousePressed(){
  mouseState = true;
}


void mouseReleased(){
    mouseState = false;
}
