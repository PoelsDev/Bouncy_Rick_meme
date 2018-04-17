//libraries  
import processing.sound.*;
import ddf.minim.*;

// enkele constanten:
final int startX = 20;
final int startY = 100;
final int afmeting = 100;
final int imgH = 100;
final int imgW = 75;

// de toestandsvariabelen van het vierkant:
int xRichting = 1;      // naar rechts
int yRichting = -1;     // naar boven
int xpos = startX;
int ypos = startY;
int imgX = xpos;
int imgY = ypos + 13;

//toevoegingen
PImage img;
PImage img2;
Minim minim;
AudioPlayer song;
//SoundFile file;

void setup() {
  size(625,351);
  frameRate(60);
  stroke(255);
  frameRate(60);
  
  img = loadImage("rickastley.png");
  img2 = loadImage("rick2.jpg");
  
  minim = new Minim(this);
  song = minim.loadFile("Never.mp3");
  song.play();
  
  //file = new SoundFile(this,"Never.mp3");
  //file.play();
}

void draw() {
  // update toestand
  if(xpos <= 0 || xpos+afmeting >= width) xRichting *= -1;
  if(ypos <= 0 || ypos+afmeting >= height) yRichting *= -1;
  xpos += xRichting;
  ypos += yRichting;
  
  imgX = xpos;
  imgY = ypos + 14;
  
  
  // teken
  clear();
  background(img2);
  fill(255);
  rect(xpos, ypos, afmeting, afmeting);
  image(img,imgX,imgY,imgH,imgW);
}
