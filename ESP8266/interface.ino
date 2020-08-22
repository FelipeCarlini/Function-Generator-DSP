#include <ESP8266WiFi.h>
#include <Wire.h>
#include <Adafruit_ADS1015.h>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x3F, 20, 4);

const char* ssid = "YourSSID";
const char* password = "YourPWD";

const int controlMSb = 2, controlLSb = 0, enable = 16;
long int frecuenciaGlobal;
int cont = 0;
char c;
int ondaGlobal, amplitudGlobal, offsetGlobal;
bool flagRec = false;

WiFiServer server(80);
IPAddress gateway(172, 16, 4, 1);
IPAddress ip(172, 16, 4, 233);
IPAddress subnet (255, 255, 255, 0);

void setup() {
    lcd.init();
    lcd.backlight();
    pinMode(enable, OUTPUT);
    pinMode(controlMSb, OUTPUT);
    pinMode(controlLSb, OUTPUT);
    Serial.begin(9600);
    delay(5);
    WiFi.begin(ssid, password);
    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
    }
    server.begin();
    delay(1000);
    digitalWrite(2, HIGH);  // Turn the LED on by making the voltage LOW
    delay(1000);
    Serial.println(WiFi.localIP());
}

void loop() {
    // Listenning for new clients
    WiFiClient client = server.available();
    if ( client ){
        parseRequest(client);
    }

    if (flagRec == true) {
        flagRec = false;
        EnviarOnda();
    }
}

void parseRequest(WiFiClient client) {
    boolean blank_line = true;
    while (client.connected()) {
        if (client.available()) {
            c = client.read();
            client.println("HTTP/1.1 200 OK");
            client.println("Content-Type: text/html");
            client.println("Content-Length: 60");
            client.println("Connection: close");
            client.println();
            client.println("<!DOCTYPE HTML>");
            client.println("<!DOCTYPE><html>");
            client.println("</center></body></html>");
            break;
        }
    }
    String request = client.readStringUntil('\r');
    String convSTR;
    int frecuencia, onda, amplitud, offset;

    flagRec = true;
    convSTR = request.substring(request.indexOf("w") + 2 , request.indexOf("f") - 1);
    onda = convSTR.toInt();
    convSTR = request.substring(request.indexOf("f") + 2, request.indexOf("a") - 1);
    frecuencia = convSTR.toInt();
    convSTR = request.substring(request.indexOf("a") + 2 , request.indexOf("o") - 1);
    amplitud = convSTR.toInt();
    convSTR = request.substring(request.indexOf("o") + 2, request.indexOf("H") - 1);
    offset = convSTR.toInt();
    client.flush();
    client.stop();

    ondaGlobal = onda;
    frecuenciaGlobal = frecuencia ;
    amplitudGlobal = amplitud;
    offsetGlobal = offset;
}

void EnviarOnda() {
    if (ondaGlobal == 1) {
        EnviarSeno();
    } else if (ondaGlobal == 2) {
        EnviarTriang();
    } else if (ondaGlobal == 3) {
        EnviarCuad();
    } else if (ondaGlobal == 4) {
        EnviarSierra();
    }
    frecuenciaGlobal = frecuenciaGlobal * 3.22522;
    EnviarFrecuencia();
}

//---- formas de onda ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
byte seno[] = {128, 134, 140, 146, 153, 159, 165, 171, 177, 182, 188, 194, 199, 204, 209, 214, 218, 223, 227, 230, 234, 237, 240, 243, 246, 248, 250, 251, 253, 254, 255, 255, 255, 255, 254, 253, 252, 251, 249, 247, 245, 242, 239, 236, 232, 229, 225, 220, 216, 211, 206, 201, 196, 191, 185, 180, 174, 168, 162, 156, 149, 143, 137, 131, 124, 118, 112, 106, 99, 93, 87, 81, 75, 70, 64, 59, 54, 49, 44, 39, 35, 30, 26, 23, 19, 16, 13, 10, 8, 6, 4, 3, 2, 1, 0, 0, 0, 0, 1, 2, 4, 5, 7, 9, 12, 15, 18, 21, 25, 28, 32, 37, 41, 46, 51, 56, 61, 67, 73, 78, 84, 90, 96, 102, 109, 115, 121, 128};
int  EnviarSeno() {
    for (int cont = 0; cont < 128; cont++) {
        digitalWrite(controlMSb, LOW);
        digitalWrite(controlLSb, LOW);
        Serial.write(seno[cont]);
        delay(2);
        digitalWrite(enable, HIGH);
        digitalWrite(enable, LOW);
        delay(2);
        digitalWrite(controlMSb, LOW);
        digitalWrite(controlLSb, HIGH);
        Serial.write(cont);
        delay(2);
        digitalWrite(enable, HIGH);
        digitalWrite(enable, LOW);
        delay(2);
        digitalWrite(controlMSb, HIGH);
        digitalWrite(controlLSb, LOW);
        Serial.write(0b11000000);
        delay(2);
        digitalWrite(enable, HIGH);
        digitalWrite(enable, LOW);
        delay(2);
        digitalWrite(controlMSb, HIGH);
        digitalWrite(controlLSb, HIGH);
        digitalWrite(enable, HIGH);
        digitalWrite(enable, LOW);
        delay(2);
    }
}

byte Sierra[] = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100, 102, 104, 106, 108, 110, 112, 114, 116, 118, 120, 122, 124, 126, 128, 130, 132, 134, 136, 138, 140, 142, 144, 146, 148, 150, 152, 154, 156, 158, 160, 162, 164, 166, 168, 170, 172, 174, 176, 178, 180, 182, 184, 186, 188, 190, 192, 194, 196, 198, 200, 202, 204, 206, 208, 210, 212, 214, 216, 218, 220, 222, 224, 226, 228, 230, 232, 234, 236, 238, 240, 242, 244, 246, 248, 250, 252, 254};
int  EnviarSierra() {
    for (int cont = 0; cont < 128; cont++) {
        digitalWrite(controlMSb, LOW);
        digitalWrite(controlLSb, LOW);
        Serial.write(Sierra[cont]);
        delay(2);
        digitalWrite(enable, HIGH);
        digitalWrite(enable, LOW);
        delay(2);
        digitalWrite(controlMSb, LOW);
        digitalWrite(controlLSb, HIGH);
        Serial.write(cont);
        delay(2);
        digitalWrite(enable, HIGH);
        digitalWrite(enable, LOW);
        delay(2);
        digitalWrite(controlMSb, HIGH);
        digitalWrite(controlLSb, LOW);
        Serial.write(0b11000000);
        delay(2);
        digitalWrite(enable, HIGH);
        digitalWrite(enable, LOW);
        delay(2);
        digitalWrite(controlMSb, HIGH);
        digitalWrite(controlLSb, HIGH);
        digitalWrite(enable, HIGH);
        digitalWrite(enable, LOW);
        delay(2);
    }
}

byte triang[] = {4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 64, 68, 72, 76, 80, 84, 88, 92, 96, 100, 104, 108, 112, 116, 120, 124, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177, 181, 185, 189, 193, 197, 201, 205, 209, 213, 217, 221, 225, 229, 233, 237, 241, 245, 249, 253, 255, 253, 249, 245, 241, 237, 233, 229, 225, 221, 217, 213, 209, 205, 201, 197, 193, 189, 185, 181, 177, 173, 169, 165, 161, 157, 153, 149, 145, 141, 137, 133, 129, 124, 120, 116, 112, 108, 104, 100, 96, 92, 88, 84, 80, 76, 72, 68, 64, 60, 56, 52, 48, 44, 40, 36, 32, 28, 24, 20, 16, 12, 8, 4, 0};
int  EnviarTriang() {
    for (int cont = 0; cont < 128; cont++) {
        digitalWrite(controlMSb, LOW);
        digitalWrite(controlLSb, LOW);
        Serial.write(triang[cont]);
        delay(2);
        digitalWrite(enable, HIGH);
        digitalWrite(enable, LOW);
        delay(2);
        digitalWrite(controlMSb, LOW);
        digitalWrite(controlLSb, HIGH);
        Serial.write(cont);
        delay(2);
        digitalWrite(enable, HIGH);
        digitalWrite(enable, LOW);
        delay(2);
        digitalWrite(controlMSb, HIGH);
        digitalWrite(controlLSb, LOW);
        Serial.write(0b11000000);
        delay(2);
        digitalWrite(enable, HIGH);
        digitalWrite(enable, LOW);
        delay(2);
        digitalWrite(controlMSb, HIGH);
        digitalWrite(controlLSb, HIGH);
        digitalWrite(enable, HIGH);
        digitalWrite(enable, LOW);
        delay(2);
    }
}
int  EnviarCuad() {
  for (int cont = 0; cont < 128; cont++) {
    digitalWrite(controlMSb, LOW);
    digitalWrite(controlLSb, LOW);
    if (cont < 64) {
      Serial.write(255);
    } else {
      Serial.write(0);
    }
    delay(2);
    digitalWrite(enable, HIGH);
    digitalWrite(enable, LOW);
    delay(2);

    digitalWrite(controlMSb, LOW);
    digitalWrite(controlLSb, HIGH);
    Serial.write(cont);
    delay(2);
    digitalWrite(enable, HIGH);
    digitalWrite(enable, LOW);
    delay(2);
    digitalWrite(controlMSb, HIGH);
    digitalWrite(controlLSb, LOW);
    Serial.write(0b11000000);
    delay(2);
    digitalWrite(enable, HIGH);
    digitalWrite(enable, LOW);
    delay(2);
    digitalWrite(controlMSb, HIGH);
    digitalWrite(controlLSb, HIGH);
    digitalWrite(enable, HIGH);
    digitalWrite(enable, LOW);
    delay(2);
  }
}

int EnviarFrecuencia() {
    byte frecMed, frecLSB, frecMSB;
    frecMed = ((frecuenciaGlobal >> 8) & 0xFF);
    frecLSB = ((frecuenciaGlobal     ) & 0xFF);
    Serial.write(frecLSB);
    digitalWrite(controlMSb, LOW);
    digitalWrite(controlLSb, LOW);
    delay(2);
    digitalWrite(enable, HIGH);
    digitalWrite(enable, LOW);
    delay(2);
    Serial.write(frecMed);
    digitalWrite(controlMSb, LOW);
    digitalWrite(controlLSb, HIGH);
    delay(2);
    digitalWrite(enable, HIGH);
    digitalWrite(enable, LOW);
    delay(2);
    //01 6bits
    frecMSB = ((int(frecuenciaGlobal) >> 16) & 0b00111111);
    frecMSB = frecMSB | 0b01000000;
    Serial.write(frecMSB);
    digitalWrite(controlMSb, HIGH);
    digitalWrite(controlLSb, LOW);
    delay(2);
    digitalWrite(enable, HIGH);
    digitalWrite(enable, LOW);
    delay(2);
    digitalWrite(controlMSb, HIGH);
    digitalWrite(controlLSb, HIGH);
    digitalWrite(enable, HIGH);
    digitalWrite(enable, LOW);
    delay(2);
}
