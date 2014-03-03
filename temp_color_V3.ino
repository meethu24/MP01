
int TempSensor = 0; //Our AnalogIn is pin A0
int redPin = 11;
int greenPin = 10;
int bluePin = 9;

//Colors
/*int red[3] = {255,0,0}; //ANGER
int green[3] = {0,255,0}; //Neutral
int blue[3] = {0,0,255}; //Calm or relaxed
int yellow[3] = {255,255,0}; //tense or excited
int purple[3] = {80,0,80}; // happy or romantic
int brown[3] = {165,42,42}; //nervous or anxious
*/

void setup()
{
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);
  Serial.flush();
  Serial.begin(9600);
  //establishContact(); 
}

void loop()
{
  
  //INPUT --> everything to do with temperature
  int TempSensor_reading = analogRead(TempSensor);  
  float voltage = TempSensor_reading * 5.0;
  voltage /= 1024.0; 
  float temp_Celsius = (voltage - 0.5) * 100 ;  
  float temp_faren = (temp_Celsius*1.8) + 32;
 
 //Serial.println(temp_faren);
 //OUTPUT --> Setting the ring color to the corresponding mood/emotion
 if(temp_faren>= 68.0 && temp_faren<= 69.0){
    setColor(255, 255, 0);
    Serial.println("BLUE");
    delay(1000);
 }else if(temp_faren>= 69.0 && temp_faren<=70.0) {
    setColor(0, 255, 255);  // blue
    Serial.println("RED");
    delay(1000);
 } else {
   setColor(255, 0, 255);
   Serial.println("GREEN");
   delay(1000);
 }
}

void setColor(int red, int green, int blue)
{
  analogWrite(redPin, 255-red);
  analogWrite(greenPin, 255-green);
  analogWrite(bluePin, 255-blue);  
}
