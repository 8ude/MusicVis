//Master Visualizer For "Donut" by Karaoke Culture
//inspiration and code snippets from processing.org, Abhinav Kr and others 

//import Minim library
  import ddf.minim.*;
  
//for displaying the sound's frequency
  import ddf.minim.analysis.*;

 Minim minim;
  
//to make it play song files
  AudioPlayer song;
  
//for displaying the sound's frequency
  FFT fft;
  
  float timer;
  float t;
  float oldRad = 0;
  float smooth = 0.5;
  float bpm = 135;
  int beat;
  int measure;
  centerEllipse cEllipse;
  
void setup() {

  //sketch size
    size(800, 600);
    beat = 0;
    measure = 0;
    
    minim = new Minim(this);
    
    // this 
    song = minim.loadFile("Donut 712.mp3");
    song.play();
    fft = new FFT(song.bufferSize(), song.sampleRate());
    
    timer = -2;
    t = 0;

    cEllipse = new centerEllipse(0, smooth);
}

void draw() {
    timer += 1/frameRate;
    
    beat = floor(timer*(bpm/60));
    measure = floor(beat/4);
    fft.forward(song.mix);
    
    if (measure < 4)
    {
    fill (0, fft.getBand(1)*150, fft.getBand(10)*100, 50);
    rect(0,0,width, height);
    }
    
    
    else if (measure >= 4 && measure < 12)
    {
    fill(0);
    rect(0,0, width, height);
    
    smooth();
    noStroke();
    ellipseMode(CENTER);
    
    smooth = map(mouseX, 0, width, 0, 1);
    
    cEllipse.expansion();
    cEllipse.display();
    
    }
    
    else if (measure >= 12 && measure < 28)
    {
      fill(125-125*sin(millis()*(PI/2)/1000));
      rect(0,0, width, height);
      
      smooth();
      noStroke();
      ellipseMode(CENTER);
      
      smooth = map(mouseX, 0, width, 0, 1);
      
      cEllipse.expansion();
      cEllipse.move();
      cEllipse.display();
      
      //static sinewaves
      staticSinewaves();
      
    }    
    
    else if (measure >= 28 && measure < 44)
    {
      //trippy rorschach pattern B&W
      
      fill(0, 5);
      rect(0,0,width, height);
      
      //sweeping sinewaves
        t += frameRate/50;
        if (t > height)
       {
         t = 0;
       } 
      movingSinewaves(t);
  
      cEllipse.expansion();
      cEllipse.move();
      cEllipse.display();
      
      smooth();
      noStroke();
      fill(125-50*sin(millis()*(PI/2)/1000), 20);
      ellipseMode(CENTER);
      trippyRorschach();
    }
    
    else if (measure >= 44)  
    {
      //trippy rorschach pattern 2
      
      fill(0,  255-map(mouseX,0,width,0,255), 255-map(mouseY,0,height,0,255), 5);
      rect(0,0,width, height);
      
      cEllipse.expansion();
      cEllipse.move();
      cEllipse.display();
      
      smooth();
      noStroke();
      fill(125-125*sin(millis()*(PI/2)/1000), map(mouseX, 0,width,0,255), map(mouseY,0,height,0,255));
      ellipseMode(CENTER);
      trippyRorschach();
    }
}
