
#include <SoftwareSerial.h>
SoftwareSerial BTserial(2,3); // BT RX (Arduino TX) at pin 2, BT TX (Arduino RX) at pin 3
#include <ezBuzzer.h>

ezBuzzer buzzer(6);

short h8_melody[] = { // "I'm Henry The Eighth I am"
  NOTE_D4, NOTE_B3, NOTE_B3, NOTE_C4, NOTE_D4, 
  NOTE_B4, NOTE_B4, NOTE_G4,
  NOTE_G4, NOTE_G4, NOTE_G4, NOTE_G4, NOTE_A4, NOTE_G4,
  NOTE_E4, NOTE_G4, NOTE_D4, 0,

  NOTE_D4, NOTE_D4, NOTE_B3, NOTE_B3, NOTE_C4, NOTE_D4,
  NOTE_B4, NOTE_B4, NOTE_B4, NOTE_G4,
  NOTE_A4, NOTE_E4, NOTE_E4, NOTE_FS4, NOTE_G4, NOTE_A4,

  0, NOTE_B4, NOTE_A4, NOTE_FS4, NOTE_D4, 
  NOTE_G4, NOTE_A4, NOTE_B4, NOTE_A4, NOTE_G4,
  NOTE_FS4, NOTE_G4, NOTE_A4, 0, NOTE_FS4, 
  NOTE_E4, NOTE_DS4, NOTE_E4, NOTE_FS4, NOTE_A4, NOTE_G4, NOTE_FS4, NOTE_E4,

  NOTE_D4, 0, NOTE_G4, NOTE_A4, 
  NOTE_B4, NOTE_G4, NOTE_A4, NOTE_FS4, 
  NOTE_G4, NOTE_FS4, NOTE_E4, 0,
  NOTE_B4, NOTE_AS4, NOTE_B4, NOTE_G4, NOTE_A4, NOTE_FS4, NOTE_G4
};

byte h8_rhythm[] = {
  4, 16, 16, 16, 16, 
  8, 8, 4, 
  16, 16, 16, 16, 8, 8,
  16, 8, 4, 16, 

 8, 8, 16, 16, 16, 16, 
  16, 16, 8, 4,
  8, 8, 16, 16, 16, 16, 

  16, 8, 16, 6, 16, 
  6, 16, 8, 16, 16,
  16, 16, 4, 16, 16, 
   16, 16, 16, 16, 16, 16, 16, 16, 

  4, 16, 8, 16,
  8, 8, 8, 8,
  16, 16, 4, 8,
   16, 16, 16, 16, 8, 8, 4
};

int h8_size = sizeof(h8_rhythm) / sizeof(byte);

short tf_melody[] = { // "Toccato and Fugue in D Minor"
  NOTE_A5, NOTE_G5, NOTE_A5, NOTE_G5, NOTE_F5, NOTE_E5, NOTE_D5, NOTE_CS5, NOTE_D5, NOTE_D5
};

byte tf_rhythm[] = {
  16, 16, 1, 16, 16, 16, 16, 4, 8, 3
};

int tf_size = sizeof(tf_rhythm) / sizeof(byte);

short at_melody[] = { // Theme from "The A-Team"
  NOTE_F5, NOTE_C5, NOTE_F5, NOTE_AS4, NOTE_C5, NOTE_F4,
  NOTE_A4, NOTE_C5, NOTE_F5, NOTE_C5, NOTE_G5, NOTE_F5, 
  NOTE_DS5, NOTE_D5, NOTE_D5, NOTE_AS4, NOTE_C5
};

byte at_rhythm[] = {
  4, 8, 2, 8, 4, 2, 16, 16, 8, 8, 8, 2, 8, 16, 16, 8, 2
};

int at_size = sizeof(at_rhythm) / sizeof(byte);

short ss_melody[] = { // Guitar riff from "Sunshine of your Love"
  NOTE_D5, NOTE_D5, NOTE_C5, NOTE_D5, NOTE_A4, NOTE_GS4, NOTE_G4, NOTE_D4, NOTE_F4, NOTE_D4
};

byte ss_rhythm[] = {
  8, 8, 8, 4, 4, 4, 4, 8, 4, 4
};

int ss_size = sizeof(ss_rhythm) / sizeof(byte);

short rk_melody[] = { // Theme from "Rocky"
  NOTE_G4, NOTE_G4, NOTE_G4, NOTE_G4, NOTE_G4, NOTE_G4, NOTE_G4,
  NOTE_B4, NOTE_G4, NOTE_G4, NOTE_G4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, 
  NOTE_D5, NOTE_B4, NOTE_B4, NOTE_B4, 
  NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, 
  NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, NOTE_B4, 
  NOTE_D5, NOTE_E5, NOTE_E5, NOTE_FS5, NOTE_B4, NOTE_B4, NOTE_D5, NOTE_E5, NOTE_E5, NOTE_FS5, NOTE_B4, 0,
  NOTE_A4, NOTE_G4, NOTE_A4, NOTE_G4, NOTE_A4, NOTE_B4, 0,
  NOTE_G4, NOTE_G4, NOTE_G4, NOTE_G4, NOTE_G4, NOTE_G4, NOTE_G4, NOTE_C5, NOTE_B4
};

byte rk_rhythm[] = {
  8, 8, 16, 16, 8, 16, 16, 8, 16, 16, 8, 8, 8, 16, 16, 8, 16, 16, 8, 16, 16, 4, 
  8, 16, 16, 8, 16, 8, 16, 4, 16, 16, 8, 16, 16, 16, 8, 4, 16, 3, 1, 
  16, 3, 1, 16, 3, 1, 16, 3, 1, 8, 16, 16, 5, 16, 8, 3, 8, 16, 16, 8, 16, 5, 16, 8, 8, 1
};

int rk_size = sizeof(rk_rhythm) / sizeof(byte);

short jp_melody[] = { // Theme from "Jeopardy!"
  NOTE_C5, NOTE_F5, NOTE_C5, NOTE_F4, NOTE_C5, NOTE_F5, NOTE_C5, 
  NOTE_C5, NOTE_F5, NOTE_C5, NOTE_F5, NOTE_A5, NOTE_G5, NOTE_F5, NOTE_E5, NOTE_D5, NOTE_CS5, 
  NOTE_C5, NOTE_F5, NOTE_C5, NOTE_F4, NOTE_C5, NOTE_F5, NOTE_C5, 
  NOTE_F5, NOTE_D5, NOTE_C5, NOTE_AS4, NOTE_A4, NOTE_G4, NOTE_F4
};

byte jp_rhythm[] = {
  4, 4, 4, 4, 4, 4, 2,
   4, 4, 4, 4, 3, 8, 8, 8, 8, 8, 
   4, 4, 4, 4, 4, 4, 2,
    3, 8, 4, 4, 4, 4, 4
};

int jp_size = sizeof(jp_rhythm) / sizeof(byte);

short im_melody[] = { // "Iron Man"
  NOTE_B3, NOTE_D4, NOTE_D4, NOTE_E4, NOTE_E4, NOTE_G4, NOTE_FS4, NOTE_G4, NOTE_FS4, NOTE_G4, NOTE_FS4, NOTE_D4, NOTE_D4, NOTE_E4, NOTE_E4, 
};

byte im_rhythm[] = {
  2, 2, 4, 4, 2, 8, 8, 8, 8, 8, 8, 4, 4, 4, 2
};

int im_size = sizeof(im_rhythm) / sizeof(byte);
 
const int pinRightFWD = 7;
const int pinRightBWD = 8;
const int pinRightPWM = 9;
const int pinLeftPWM = 10;
const int pinLeftFWD = 11;
const int pinLeftBWD = 12;
char c = " ";
byte x = 0;
byte y = 0;
bool prev_y = 0;
int r = 0;
int int_x, int_y;
bool x_pos, y_pos;
byte state = 0;
 
void setup() 
{
    BTserial.begin(9600); // set baud rate for bluetooth module
    Serial.begin(9600);

    pinMode(pinLeftPWM, OUTPUT);
    pinMode(pinRightFWD, OUTPUT);
    pinMode(pinLeftFWD, OUTPUT);
    pinMode(pinRightBWD, OUTPUT);
    pinMode(pinLeftBWD, OUTPUT);
    analogWrite(pinRightPWM, 0); // Vref average of pwm, start at 0
    analogWrite(pinLeftPWM, 0);
    digitalWrite(pinRightFWD, LOW); // Start not moving
    digitalWrite(pinLeftFWD, LOW);
    digitalWrite(pinRightBWD, LOW); 
    digitalWrite(pinLeftBWD, LOW); 
}
 
void loop()
{
  buzzer.loop();
  BTserial.listen();
  while (BTserial.available()<1){}
  if (BTserial.available()) // if bt module has written byte to buffer
    {
        c = BTserial.read(); // read byte
      //  Serial.write(c); // print to serial monitor
    }
    if (c==74){ // Joystick button 'J'
      if (buzzer.getState() != BUZZER_IDLE){
        buzzer.stop(); // Terminate song
      } 
    } else if (c==66){ // Bottom button 'B'
      if (buzzer.getState() == BUZZER_IDLE) {
      state = (state+1)%7; // Change to next song
      delay(250);
        }
    } else if (c==84){ // Top button 'T'
    Serial.println(state);
      if (buzzer.getState() == BUZZER_IDLE) {
        if (state == 0){
      buzzer.playMelody(h8_melody, h8_rhythm, h8_size); 
      } else if (state == 1){
      buzzer.playMelody(tf_melody, tf_rhythm, tf_size); 
      } else if (state == 2){
      buzzer.playMelody(at_melody, at_rhythm, at_size); 
      } else if (state == 3){
      buzzer.playMelody(ss_melody, ss_rhythm, ss_size); 
      } else if (state == 4){
      buzzer.playMelody(rk_melody, rk_rhythm, rk_size); 
      } else if (state == 5){
      buzzer.playMelody(jp_melody, jp_rhythm, jp_size); 
      } else if (state == 6){
      buzzer.playMelody(im_melody, im_rhythm, im_size); 
      }
        }
    } else if (c==76){ // Left button 'L'
      digitalWrite(pinRightBWD, LOW);
    digitalWrite(pinRightFWD, HIGH);
    digitalWrite(pinLeftBWD, HIGH);
    digitalWrite(pinLeftFWD, LOW); 
    analogWrite(pinLeftPWM, 150);
    analogWrite(pinRightPWM, 150);
    Serial.write("L");
    } else if (c==82){ // Right button 'R'
    digitalWrite(pinRightFWD, LOW);
    digitalWrite(pinRightBWD, HIGH);
    digitalWrite(pinLeftFWD, HIGH);
    digitalWrite(pinLeftBWD, LOW); 
    analogWrite(pinLeftPWM, 150);
    analogWrite(pinRightPWM, 150);
    //Serial.write("R");

    } else if (c==88){ // 'X' sent, and then coordinates of joystick, when no button pressed
      BTserial.listen();
  while (BTserial.available()<1){}
      if (BTserial.available()) // if bt module has written byte to buffer
    {
      x = BTserial.read();
      delay(10);
      y = BTserial.read();
    }
    //  Serial.print("X");
      //Serial.print(x, BIN);
    //  Serial.print("\t");
      //Serial.print("Y");
    //  Serial.print(y, BIN);
      //Serial.print("\n");

  x_pos = (x > 127); // sign of x
  y_pos = (y > 127); // sign of y
 
  int_x = int(x/4) - 32;
  int_y = int(y/4) - 32;
 // Serial.println(int_x);
  //Serial.println(int_y);

if ((int_x==0) && (int_y==0)){ // turn everything off if both are zero
    digitalWrite(pinRightFWD, LOW);
    digitalWrite(pinRightBWD, LOW);
    digitalWrite(pinLeftFWD, LOW);
    digitalWrite(pinLeftBWD, LOW);
    digitalWrite(pinRightBWD, LOW);
    digitalWrite(pinLeftFWD, LOW);
  } else{
      if ((y_pos != prev_y)){ // turn off if direction changes (temporarily)
    digitalWrite(pinRightFWD, LOW);
    digitalWrite(pinRightBWD, LOW);
    digitalWrite(pinLeftFWD, LOW);
    digitalWrite(pinLeftBWD, LOW);
    digitalWrite(pinRightBWD, LOW);
    digitalWrite(pinLeftFWD, LOW);
    delay(250);
  }

  prev_y = y_pos;
  int_y = abs(int_y);
  r = int(pow((int_y*int_y+int_x*int_x), (0.5)));
 // Serial.println(int_y);
 // Serial.println(r);

  if (x_pos){
    analogWrite(pinLeftPWM, r*5);
    analogWrite(pinRightPWM, int_y*7);
  } else {
        analogWrite(pinRightPWM, r*5);
    analogWrite(pinLeftPWM, int_y*7);
  }
  if (y_pos){
    digitalWrite(pinLeftFWD, HIGH);
    digitalWrite(pinLeftBWD, LOW);
    digitalWrite(pinRightFWD, HIGH);
    digitalWrite(pinRightBWD, LOW);
  } else {
    digitalWrite(pinLeftBWD, HIGH);
    digitalWrite(pinLeftFWD, LOW);
    digitalWrite(pinRightFWD, LOW);
    digitalWrite(pinRightBWD, HIGH);
  }}
    } else {
      analogWrite(pinRightPWM, 0); 
    analogWrite(pinLeftPWM, 0);
    digitalWrite(pinRightFWD, LOW); 
    digitalWrite(pinLeftFWD, LOW);
    digitalWrite(pinRightBWD, LOW); 
    digitalWrite(pinLeftBWD, LOW); 
    }
  //delay(100);
}
