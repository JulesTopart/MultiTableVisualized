public class Turtle{

  
  public Turtle(){
    heading = PI;
    posX = width/2;
    posY = height/2;
  };
  
  public Turtle(float x, float y){
    heading = PI;
    posX = width/2 + x;
    posY = height/2 + y;
  };
  
  public void avancer(float distance){
    float curX = posX;
    float curY = posY;
    
    posX += cos(PI/2 + heading) * distance;
    posY += sin(PI/2 + heading) * distance;
    if(pen) line(curX, curY, posX, posY);
  }
  
  public void reculer(float distance){
    avancer(-distance);
  }
  
  public void tournerGauche(float angle){
    heading += angle;
    heading %= 2*PI;
    if (heading < 0) {
      heading += 2*PI;
    }
  }
  
  public void tournerDroite(float angle){
    tournerGauche(-angle);
  }
  
  public void leverCrayon(){
    pen = false;
  }  
  
  public void poserCrayon(){
    pen = true;
  }  
  
  private float heading, posX,posY;
  private boolean pen;
};
