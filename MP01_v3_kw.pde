import processing.serial.*; 

Serial myPort;    // The serial port
String inString;  // Input string from serial port   
String typing="";
PFont font;
char[] message = new char[800];
color[] messageColor = new color[800];
color colorValue; // mood color at time of typing
int k = 0; // counter for the number of letters in the message

  

void setup() { 
  size(400,400);   
  myPort = new Serial(this, Serial.list()[9], 9600); 
  myPort.bufferUntil('\n');   
  font = createFont("Helvetica", 28, true); 
} 
 
void draw() {
  background(255);
  // Shifted code from setup because it was not showing up
  textAlign(LEFT);
  fill(0);
  text("Write your Message", 20, 40);
  colorMode(HSB);
  
  //for (int i = 0; i < typing.length(); i++) {
    if((inString.length()==3) && (inString.charAt(0)=='R' && inString.charAt(1)=='E' && inString.charAt(2)=='D')){
      color r = color(0, 255, 255);
      colorValue = r;
    } else if ((inString.length()==4) && (inString.charAt(0)=='B' && inString.charAt(1)=='L' && inString.charAt(2)=='U' && inString.charAt(3)=='E')){
      color b = color(240, 255, 255);
      colorValue = b;
    } else if ((inString.length()==5) && (inString.charAt(0)=='G') && (inString.charAt(1)=='R')) {
      color gY = color(120, 255, 255);
      colorValue = gY;
    } else {
      fill(0);
    }
    
    char[] type = typing.toCharArray();
    
    for (int i = 0; i < type.length; i++) {
      message[k] = type[i];
      messageColor[k] = colorValue;
    }
    
    int x = 20;
    int y = 60;
    for (int i = 0; i < message.length; i++) {
        fill(messageColor[i]);
        text(message[i], x, y);
        x += textWidth(message[i]);
        if(x > width) {
          x = 20;
          y += 14;
        }
    }
} 

void serialEvent(Serial p) { 
    inString = p.readStringUntil('\n');
    if(inString!=null){
      inString = trim(inString);
      println(inString);
    }
}

void keyPressed() {
  if (key == '\n' ) {
    typing = ""; 
  }else if (keyCode == BACKSPACE) {
    //String message1 = str(message);
    //message1 = message1.substring(0, message1.length() - 1);
    
    /*int x = 20;
    int y = 60;
    for (int i = 0; i < message.length; i++) {
        //fill(messageColor[i]);
        //text(message[i], x, y);
        x += textWidth(message[i]);
        if(x > width) {
          x = 20;
          y += 14;
        }
    }*/
    //text("", x, y);
    k = k + 1;
    //typing = typing.substring(0, typing.length() - 1);
  } else {
    typing = typing + key; 
    k += 1;
  }
}



