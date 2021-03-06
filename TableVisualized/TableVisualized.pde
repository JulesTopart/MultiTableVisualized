float table, modulus, radius;

boolean mouseState = false;

Turtle robot;

float selectedPoint = 0.0;

void setup(){
  size(600,600);
  
  strokeWeight(0.5);
  radius = 200;
  modulus = 100;
  table = 2.00;
  
  
}


void draw(){
  robot = new Turtle(50,0);
  background(200);
  
  
  selectedPoint = calulateDebugPoint();
  algorithm();
  

  
  if (mouseButton == LEFT && mouseState) {
     table += 0.01;
  } else if (mouseButton == RIGHT && mouseState) {
     table -= 0.01;
  } else {
  }
  
  if(table < 1) table = 1;
};



void algorithm() {
  
  float result, alpha, beta, phi, eta, dist;
  robot.leverCrayon();

  for (float k = 0.0; k < 10.0; k += 10.0/modulus) {
    result = k * table;
    alpha = k * ((2*PI) / 10.0);
    alpha = alpha % (2*PI);
    beta = result * ((2*PI) / 10.0);
    beta = beta;
    phi = beta - alpha;
    phi = phi % (2*PI);
    eta = PI - (PI - phi) / 2;
    dist = sqrt(2 * (radius * radius) - (2 * (radius * radius)) * cos(phi));
    

    if(k <= selectedPoint){
      fill(200);
      rect(0,25,90,450);
      fill(0);
      strokeWeight(0.5);
      textSize(10);
      
      text("table :", 10, 50);   text(table, 40,50);
      text("k :", 10,100);       text(k, 40,100);
      text("result :", 10,150);  text(result, 40,150);
      text("alpha :", 10,200);   text(alpha * RAD_TO_DEG, 40,200);
      text("beta :", 10,250);    text(beta * RAD_TO_DEG, 40,250);
      text("phi :", 10,300);     text(phi * RAD_TO_DEG, 40,300);
      text("eta :", 10,350);     text(eta * RAD_TO_DEG, 40,350);
      text("dist :", 10,400);    text(dist, 40,400);
    }

    
    robot.tournerDroite(alpha);
    robot.avancer(radius);
    robot.tournerDroite(eta);
    robot.poserCrayon();
    robot.avancer(dist);
    robot.leverCrayon();
    robot.tournerDroite(eta);
    robot.avancer(radius);
    robot.tournerGauche((eta * 2));
    robot.tournerGauche(alpha);
  }
}


float calulateDebugPoint() {
  float x = (width/2) + robot.offSetX();
  x = mouseX - x;
  float y = (height/2) + robot.offSetY();
  y = - mouseY + y;
  
  float angle = -(atan2(y,x));
  if(angle < 0) angle += 2*PI;
  angle += (PI/2);
  angle = angle % (2*PI);
  angle -= angle % ((2*PI)/modulus);
  
  fill(200);
  rect(width,25,width - 90,450);
  fill(0);
  strokeWeight(0.5);
  textSize(10);
  
  text("angle :", width - 70, 50);   text(angle*RAD_TO_DEG, width - 40,50);
  
  strokeWeight(2);
  line((width/2) + robot.offSetX() + cos(angle - (PI/2))*(radius), 
      (height/2) + robot.offSetY() + sin(angle - (PI/2))*(radius), 
      (width/2)  + robot.offSetX() + cos(angle - (PI/2))*((radius + 10)), 
      (height/2) + robot.offSetY() + sin(angle - (PI/2))*((radius + 10)));
  
  float point = (10 * angle) / (2*PI);
  return point;
}



void mousePressed(){
  mouseState = true;
}


void mouseReleased(){
    mouseState = false;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  modulus -= e;
  if(modulus < 10) modulus = 10;
}
