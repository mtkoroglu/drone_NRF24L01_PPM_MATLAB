#include <SPI.h>
#include "RF24.h" // the library which helps us to control the radio modem

const int n = 4; // kanal sayısı
int analogPin[n] = { A0, A1, A2, A3 }; // array
byte kanal[n]; // kanal[0], kanal[1], kanal[2] ve kanal[3]
RF24 radio(7, 8); // digital pins that CE and CSN are connected.
const uint64_t pipe = 0xE8E8F0F0E1LL; // the address of the modem, that will receive data from Arduino
const int T = 20; // PPM sinyali periyodu. Normalde 22ms fakat NRF24L01 kablosuz haberleşmede gecikmeler olduğundan 20 yaptım.

void setup() {
  radio.begin();                      //it activates the modem.
  radio.openWritingPipe(pipe);        //sets the address of the receiver to which the program will send data.
}

void loop() {
  for (int i = 0; i < n; i++)
    kanal[i] = map(analogRead(analogPin[i]), 0, 1023, 0, 255);
  radio.write(kanal, n);
  delay(T); // 
}
