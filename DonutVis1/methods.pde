//methods for visual effects



void trippyRorschach ()
//specify color before applying
{
 for(int i=0; i < fft.specSize(); i++)
    {
      ellipse(width/2 + 5*i, (height/2) - fft.getBand(i)*50, 
              song.left.get(i)*300, song.right.get(i)*300);
      ellipse(width/2 + 5*i, (height/2) + fft.getBand(i)*50, 
              song.left.get(i)*300, song.right.get(i)*300);
      ellipse(width/2 - 5*i, (height/2) - fft.getBand(i)*50, 
              song.left.get(i)*300, song.right.get(i)*300);
      ellipse(width/2 - 5*i, (height/2) + fft.getBand(i)*50, 
              song.left.get(i)*300, song.right.get(i)*300);
    }
}


void staticSinewaves ()
{
      beginShape();
      noFill();
      stroke(255, 255);
      for (int i = 0; i < song.left.size() - 5; i+=5)
      {
         curveVertex(i, height + (song.mix.get(i)*50));
      }
      endShape();
      
      beginShape();
      noFill();
      stroke(255, 255);
      for (int i = 0; i < song.left.size() - 5; i+=5)
      {
         curveVertex(i, 0 + (song.mix.get(i)*50));
      }
      endShape();
}

void movingSinewaves (float t)
{
      
      beginShape();
      noFill();
      stroke(255, 255);
      for (int i = 0; i < song.left.size() - 5; i+=5)
      {
         curveVertex(i, height + (song.mix.get(i)*80) - t);
      }
      endShape();
      
      beginShape();
      noFill();
      stroke(255, 255);
      for (int i = 0; i < song.left.size() - 5; i+=5)
      {
         curveVertex(i, 0 + (song.mix.get(i)*80) + t);
      }
      endShape();
}
