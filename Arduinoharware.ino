#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>

// Set these to run example.
#define FIREBASE_HOST "smart-home-8e774-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "jrP8QIcWEISxUj65RjCQFG9fTFGFCvzVuyvEBVbk"
#define WIFI_SSID "iQOO Neo7"
#define WIFI_PASSWORD "18052003"

void setup() {
  pinMode(5,OUTPUT);
  Serial.begin(9600);

  // connect to wifi.
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());
  
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}

bool light;
void loop()
{
  light = Firebase.getBool("Light/Switch");
  Serial.println(light);
  if(light == true)
  {
    digitalWrite(5,HIGH);
  }
  if(light == false)
  {
    digitalWrite(5,LOW);
  }
}
