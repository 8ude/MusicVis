
class centerEllipse
{
  float initRadius;
  float destRadius;
  float smoothing;
  float displayRadius;
  float speed = 0.05;
  float xpos = width/2;
  float ypos = height/2;
  
  centerEllipse(float iRadius, float smooth)
  {
      initRadius = iRadius;
      smoothing = smooth;
  } 
  
  void expansion()
  {
    destRadius = fft.getBand(1) * 5;
    displayRadius = initRadius + ((destRadius-initRadius)*smoothing);  
    initRadius = displayRadius; 
  }
  
  void move()
  {
    xpos += (mouseX-xpos)*speed;
    ypos += (mouseY-ypos)*speed; 
  }
  
  void display()
  {
    smooth();
    noStroke();
    ellipseMode(CENTER);
    fill(255);
    ellipse(xpos, ypos, displayRadius, displayRadius);
  }
}
