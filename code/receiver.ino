#include <SPI.h>
#include "RF24.h" // the library for controlling the radio modem (nRF24L)
#include <eRCaGuy_PPM_Writer.h>

const int n = 4; // kanal sayısı, drone projesi çin 4 olmalı
byte kanal[n]; // [0-255]
RF24 radio(7, 8); // 8 and 10 are a digital pin numbers --> CE and CSN of NRF24L01
const uint64_t pipe = 0xE8E8F0F0E1LL; // the address of a register NRF24L01 <--> Arduino.
const byte channel[4] = {0, 1, 2, 3}; // Gabriel'ın PPM kütüphanesine erişecek kanalları tanımla
const unsigned int MAX_CHANNEL_VAL = 1900;
const unsigned int MIN_CHANNEL_VAL = 1100;
const unsigned int MIDDLE_CHANNEL_VAL = 1500;
unsigned int PPMsignal[4] = {MIN_CHANNEL_VAL, MIDDLE_CHANNEL_VAL, MIDDLE_CHANNEL_VAL, MIDDLE_CHANNEL_VAL};

void setup() {
  Serial.begin(57600);
  radio.begin();                    //it activates the modem.
  radio.openReadingPipe(1, pipe);   //determines the address of our modem which receive data.
  radio.startListening();           //enable receiving data via modem
  PPMWriter.setChannelVal(channel[0], MIN_CHANNEL_VAL*2);
  for (int i = 1; i < n; i++)
    PPMWriter.setChannelVal(channel[i], MIDDLE_CHANNEL_VAL*2);
  PPMWriter.begin();
}

void loop() {
  if (radio.available()) {
    radio.read(kanal, n);
    for (int i = 0; i < n; i++)
      PPMsignal[i] = map(kanal[i], 0, 255, MIN_CHANNEL_VAL, MAX_CHANNEL_VAL);
    for (int i = 0; i < n; i++)
      PPMWriter.setChannelVal(channel[i], PPMsignal[i]*2);
    Serial.write('h'); Serial.write((byte*)PPMsignal, 2*n); // multiply by 2 as unsigned int is 2 bytes in Arduino
    //Serial.print(kanal[0]); Serial.print(' '); Serial.print(kanal[1]); Serial.print(' ');
    //Serial.print(kanal[2]); Serial.print(' '); Serial.println(kanal[3]);
  }
}
