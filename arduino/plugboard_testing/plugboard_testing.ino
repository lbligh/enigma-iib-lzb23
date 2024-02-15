/**
 * On every loop, the state of the port B is copied to port A.
 *
 * Use active low inputs on port A. Internal pullups are enabled by default by the library so there is no need for external resistors.
 * Place LEDS on port B for instance.
 * When pressing a button, the corresponding led is shut down.
 *
 * You can also uncomment one line to invert the input (when pressing a button the corresponding led is lit)
 */
#include <Wire.h>
#include <MCP23017.h>
#include <string.h>
#include <math.h>

#define PBOARD_EXP_1 0x20 + 0b010
#define PBOARD_EXP_2 0x20 + 0b011
MCP23017 pboard_mcp1 = MCP23017(PBOARD_EXP_1);
MCP23017 pboard_mcp2 = MCP23017(PBOARD_EXP_2);

void bin_string(char *buff, uint16_t bin_in) {
    uint16_t temp = bin_in;
    buff[16] = '\0';
    for (int x = 15; x >= 0; x--) {
        buff[x] = (char)((temp % 2) + '0');
        temp = temp >> 1;
    }
}

void bin_string_8(char *buff, uint8_t bin_in) {
    uint8_t temp = bin_in;
    buff[8] = '\0';
    for (int x = 7; x >= 0; x--) {
        buff[x] = (char)((temp % 2) + '0');
        temp = temp >> 1;
    }
}

void bin_string_32(char *buff, uint32_t bin_in) {
    uint32_t temp = bin_in;
    buff[32] = '\0';
    for (int x = 31; x >= 0; x--) {
        buff[x] = (char)((temp % 2) + '0');
        temp = temp >> 1;
    }
}

void setup() {
    Wire.begin();
    Wire.setClock(400000);
    Serial.begin(115200);

    pboard_mcp1.init();
    pboard_mcp1.portMode(MCP23017Port::A, 0xFF, 0xFF, 0x00);  // Port A as input
    pboard_mcp1.portMode(MCP23017Port::B, 0xFF, 0xFF, 0x00);

    pboard_mcp1.writeRegister(MCP23017Register::GPIO_A, 0x00);  // Reset port A
    pboard_mcp1.writeRegister(MCP23017Register::GPIO_B, 0x00);  // Reset port A

    // GPIO reflects the same logic as the input pins state
    pboard_mcp1.writeRegister(MCP23017Register::IPOL_A, 0x00);
    pboard_mcp1.writeRegister(MCP23017Register::IPOL_B, 0x00);

    pboard_mcp2.init();
    pboard_mcp2.portMode(MCP23017Port::A, 0xFF, 0xFF, 0x00);  // Port A as input
    pboard_mcp2.portMode(MCP23017Port::B, 0xFF, 0xFF, 0x00);

    pboard_mcp2.writeRegister(MCP23017Register::GPIO_A, 0x00);  // Reset port A
    pboard_mcp2.writeRegister(MCP23017Register::GPIO_B, 0x00);  // Reset port A

    // GPIO reflects the same logic as the input pins state
    pboard_mcp2.writeRegister(MCP23017Register::IPOL_A, 0x00);
    pboard_mcp2.writeRegister(MCP23017Register::IPOL_B, 0x00);
}

char buff[33];
char *buff_ptr;

char *lets = "QWERTZUIOASDFGHJKPYXCVBNML";
uint8_t nums[26] = { 16, 22, 4, 17, 19, 25, 20, 8, 14, 0, 18, 3, 5, 6, 7, 9, 10, 15, 24, 23, 2, 21, 1, 13, 12, 11 };  // num to pin mapping

void loop() {

    // Serial.println("\n\nSTARTING\n\n");
    uint32_t full_read;
    uint32_t portMap = 1;
    uint8_t portMapBytes_0;
    uint8_t portMapBytes_1;
    uint8_t portMapBytes_2;
    uint8_t portMapBytes_3;
    unsigned long int start = micros();

    int plugboard[26] = { 0 };
    for (int i = 0; i < 26; i++) {
        plugboard[i] = i;
    }


    for (int pin = 0; pin < 26; pin++) {
        // Serial.print("checking ");
        // Serial.println(lets[pin]);

        portMapBytes_0 = portMap;
        portMapBytes_1 = portMap >> 8;
        portMapBytes_2 = portMap >> 16;  // downcasting loses more significant bytes
        portMapBytes_3 = portMap >> 24;  // therefore no mask needed


        pboard_mcp1.portMode(MCP23017Port::A, ~portMapBytes_0);  // set pinmodes
        pboard_mcp1.portMode(MCP23017Port::B, ~portMapBytes_1);  // one pin output at a time
        pboard_mcp2.portMode(MCP23017Port::A, ~portMapBytes_2);
        pboard_mcp2.portMode(MCP23017Port::B, ~portMapBytes_3);
        pboard_mcp1.write(0x0000);
        pboard_mcp2.write(0x0000);

        portMap = portMap << 1;  // shift so next pin is selected

        full_read = ((uint32_t)pboard_mcp2.read() << 16) + pboard_mcp1.read() + ((uint32_t)1 << pin);



        // bin_string_32(buff, full_read);

        // buff_ptr = strrev(buff);
        // Serial.println(buff_ptr);


        // full_read += (uint32_t)1 << pin;
        if (full_read < 0xFFFFFFFF) {
            uint8_t connected = log(~full_read) / log(2);
            if (plugboard[nums[connected]] == nums[connected]) {
                // Serial.print(lets[connected]);
                // Serial.print(" & ");
                // Serial.println(lets[pin]);
                    plugboard[nums[pin]] = nums[connected];
                    plugboard[nums[connected]] = nums[pin];
            }
        }
    }
    
    unsigned long int time = micros() - start;
    Serial.println(time);

    char output[100];
    for (int i = 0; i < 26; i++) {
        if (i == plugboard[i])
            continue;

        sprintf(output, "Letter %c encodes to %c", (char)(i + 'A'), (char)(plugboard[i] + 'A'));
        Serial.println(output);
    }

    // currentA = mcp1.readPort(MCP23017Port::A);
    // // mcp1.writePort(MCP23017Port::A, currentB);

    // bin_string(buff, currentA);
    // Serial.println(buff);
    // delay(200);
    delay(1000);

}
