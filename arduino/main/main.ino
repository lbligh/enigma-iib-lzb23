#include <Arduino.h>
#include <Wire.h>
#include <MCP23017.h>
#include <Keypad_MC17.h>
#include <Keypad.h>  // GDY120705

#include <string.h>
#include <stdbool.h>
#include <ctype.h>
#include <stdlib.h>

#include "main.h"
#include "enigma.h"
#include "functions.h"

#define PBOARD_ENABLED 1
#define ALLOW_TEST 0

// # Lucius Bligh 2023
// # Rotor	ABCDEFGHIJKLMNOPQRSTUVWXYZ	Notch	Turnover    No Notches
// # ETW	ABCDEFGHIJKLMNOPQRSTUVWXYZ
// # I	    EKMFLGDQVZNTOWYHXUSPAIBRCJ	Y	    Q	        1
// # II	    AJDKSIRUXBLHWTMCQGZNPYFVOE	M	    E	        1
// # III	BDFHJLCPRTXVZNYEIWGAKMUSQO	D	    V	        1
// # IV	    ESOVPZJAYQUIRHXLNFTGKDCMWB	R	    J	        1
// # V	    VZBRGITYUPSDNHLXAWMJQOFECK	H	    Z	        1
// # UKW-A	EJMZALYXVBWFCRQUONTSPIKHGD
// # UKW-B	YRUHQSLDPXNGOKMIEBFZCWVJAT
// # UKW-C	FVPJIAOYEDRZXWGCTKUQSBNMHL

// # zero indexed array showing what an input A encodes to
// # 0 = A, 1 = B, etc.

// initialise global vars
// row of each letter A-Z
uint8_t light_rows[26] = { 1, 2, 2, 1, 0, 1, 1, 1, 0, 1, 1, 2, 2, 2, 0, 2, 0, 0, 1, 0, 0, 2, 0, 2, 2, 0 };
// column of each letter A-Z
uint8_t light_cols[26] = { 0, 5, 3, 2, 2, 3, 4, 5, 7, 6, 7, 8, 7, 6, 8, 0, 0, 3, 1, 4, 6, 4, 1, 2, 1, 5 };

const byte sw_rows = 3;  // three rows
const byte sw_cols = 9;  // nine columns
// define the cymbols on the buttons of the keypads
char hexaKeys[sw_rows][sw_cols] = {
    { 'Q', 'W', 'E', 'R', 'T', 'Z', 'U', 'I', 'O' },
    { 'A', 'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K' },
    { 'P', 'Y', 'X', 'C', 'V', 'B', 'N', 'M', 'L' }
};
byte sw_rowPins[sw_rows] = { 0, 1, 2 };                      // connect to the row pinouts of the keypad
byte sw_colPins[sw_cols] = { 3, 4, 5, 6, 7, 8, 9, 10, 11 };  // connect to the column pinouts of the keypad

// initialize an instance of class NewKeypad
Keypad_MC17 switch_board(makeKeymap(hexaKeys), sw_rowPins, sw_colPins, sw_rows, sw_cols, SWITCH_IO_ADDR);

MCP23017 lamp_io = MCP23017(LAMP_IO_ADDR);

#if (PBOARD_ENABLED)
MCP23017 pboard_mcp1 = MCP23017(PBOARD_EXP_1);
MCP23017 pboard_mcp2 = MCP23017(PBOARD_EXP_2);
#endif
uint8_t rotor_nums[5][26];

char rotor_lets[5][27] = {
    "EKMFLGDQVZNTOWYHXUSPAIBRCJ",
    "AJDKSIRUXBLHWTMCQGZNPYFVOE",
    "BDFHJLCPRTXVZNYEIWGAKMUSQO",
    "ESOVPZJAYQUIRHXLNFTGKDCMWB",
    "VZBRGITYUPSDNHLXAWMJQOFECK",
};

uint8_t ETW_nums[26];
char ETW_lets[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

uint8_t UKW_nums[3][26];
char UKW_lets[3][27] = {
    "EJMZALYXVBWFCRQUONTSPIKHGD",  // UKW - A
    "YRUHQSLDPXNGOKMIEBFZCWVJAT",  // UKW - B
    "FVPJIAOYEDRZXWGCTKUQSBNMHL",  // UKW - C
};

char rotor_notch_lets[5] = { 'Y', 'M', 'D', 'R', 'H' };
char rotor_turnover_lets[5] = { 'Q', 'E', 'V', 'J', 'Z' };

uint8_t rotor_notch_nums[5];
uint8_t rotor_turnover_nums[5];

uint8_t num_keys_pressed = 0;
// 1 if key is down, 0 if key is up
uint8_t keys_held_down[26] = { 0 };
uint16_t light_status = 0;

uint8_t plugboard[26];

bool in_test_mode = 0;

Enigma enigma;
Enigma *p_enigma = &enigma;

String msg = "";

void (*resetFunc)(void) = 0;  // declare reset function @ address 0

void test_mode(void) {
#if (ALLOW_TEST)
    char *keyboard = "QWERTZUIOASDFGHJKPYXCVBNML";
    for (int key = 0; key < 26; key++) {
        char c = keyboard[key];
        Serial.println(c);
        light_on(c - 'A');
        delay(500);
        light_off(c - 'A');
    }
    while (1) {
        // Returns true if there are ANY active keys.
        if (switch_board.getKeys()) {
            for (int i = 0; i < LIST_MAX; i++)  // Scan the whole key list.
            {
                if (switch_board.key[i].stateChanged)  // Only find keys that have changed state.
                {
                    uint8_t c = (uint8_t)switch_board.key[i].kchar - 'A';
                    switch (switch_board.key[i].kstate) {  // Report active key state : IDLE, PRESSED, HOLD, or RELEASED
                        case PRESSED:
                            msg = " PRESSED.";
                            light_on(c);
                            break;
                        case HOLD:
                            msg = " HOLD.";
                            break;
                        case RELEASED:
                            msg = " RELEASED.";
                            light_off(c);
                            break;
                        case IDLE:
                            msg = " IDLE.";
                    }
                    Serial.print("Key ");
                    Serial.print(switch_board.key[i].kchar);
                    Serial.println(msg);
                }
            }
        }
    }
#endif
}

void setup() {
    // begin serial comms
    Serial.begin(115200);
    while (!Serial) { /*wait*/
    }                 // for USB serial switching boards

    Serial.println("Starting Setup");

    // begin I2C
    Wire.begin();
    // Wire.setClock(400000);

    // Setup lamp IO expander as outputs
    lamp_io.init();
    lamp_io.portMode(MCP23017Port::A, 0);  // Port A as output
    lamp_io.portMode(MCP23017Port::B, 0);  // Port B as output

    lamp_io.writeRegister(MCP23017Register::GPIO_A, 0x00);  // Reset port A
    lamp_io.writeRegister(MCP23017Register::GPIO_B, 0x00);  // Reset port B

#if (PBOARD_ENABLED)
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
#endif

    // Setup Keypad
    switch_board.begin();  // GDY120705

    // set pin modes
    pinMode(TEST_SW, INPUT);
    pinMode(CAM_1, INPUT);
    pinMode(CAM_2, INPUT);

    // ensure all lights are off
    all_lights_off();

    // convert letter arrays to number arrays for easy switching of settings
    gen_arrays();

    // set initial settings (will change when rotor/stecker/rings detection is done)
    char rotors[3] = { '5', '3', '2' };  // 1thru5
    char rings[3] = { 'A', 'B', 'C' };
    int reflector = 1;
    // only for when no actual plugboard connected
    int temp_plugboard[][2] = { { 0, 5 } };
    int num_leads = sizeof(temp_plugboard) / sizeof(*temp_plugboard);
    char initial_pos[3] = { 'B', 'C', 'D' };
    int plugboard[26] = { 0 };
    for (int i = 0; i < 26; i++) {
        plugboard[i] = i;
    }
#if (PBOARD_ENABLED)
    get_plugboard_settings(plugboard);
#else
    for (int j = 0; j < num_leads; j++) {
        plugboard[temp_plugboard[j][0]] = temp_plugboard[j][1];
        plugboard[temp_plugboard[j][1]] = temp_plugboard[j][0];
    }
#endif
    // char *keyboard = "LZB";
    // for (int key = 0; key < 3; key++) {
    //     char c = keyboard[key];
    //     Serial.println(c);
    //     light_on(c - 'A');
    //     delay(1000);
    //     light_off(c - 'A');

    // setup the engima struct with initial settings
    gen_enigma(p_enigma, rotors, rings, reflector, plugboard, initial_pos);

    attachInterrupt(digitalPinToInterrupt(CAM_1), resetFunc, FALLING);
    // check for test mode
    in_test_mode = !(digitalRead(TEST_SW));

    if (in_test_mode) {
        test_mode();
    }

    Serial.println("Setup Done");

    // print the initial settings of the machine - can probably be removed
    Serial.println("INITIAL SETTINGS: ");
    print_windows(p_enigma, 1);
}

void loop() {

    // Returns true if there are ANY active keys.
    if (switch_board.getKeys()) {
        for (int i = 0; i < LIST_MAX; i++)  // Scan the whole key list.
        {
            if (switch_board.key[i].stateChanged)  // Only find keys that have changed state.
            {
                uint8_t c = (uint8_t)switch_board.key[i].kchar - 'A';
                switch (switch_board.key[i].kstate) {  // Report active key state : IDLE, PRESSED, HOLD, or RELEASED
                    case PRESSED:
                        // msg = " PRESSED.";
                        key_down(p_enigma, c);
                        break;
                    case HOLD:
                        // msg = " HOLD.";
                        break;
                    case RELEASED:
                        // msg = " RELEASED.";
                        key_up(p_enigma, c);
                        break;
                    case IDLE:
                        // msg = " IDLE.";
                        break;
                }
                // Serial.print("Key ");
                // Serial.print(switch_board.key[i].kchar);
                // Serial.println(msg);
            }
        }
    }
}
