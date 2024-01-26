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

// # Lucius Bligh 2023
// # Rotor	ABCDEFGHIJKLMNOPQRSTUVWXYZ	Notch	Turnover    No Notches
// # ETW	ABCDEFGHIJKLMNOPQRSTUVWXYZ
// # I	    EKMFLGDQVZNTOWYHXUSPAIBRCJ	Y	    Q	        1
// # II	AJDKSIRUXBLHWTMCQGZNPYFVOE	M	    E	        1
// # III	BDFHJLCPRTXVZNYEIWGAKMUSQO	D	    V	        1
// # IV	ESOVPZJAYQUIRHXLNFTGKDCMWB	R	    J	        1
// # V	    VZBRGITYUPSDNHLXAWMJQOFECK	H	    Z	        1
// # UKW-A	EJMZALYXVBWFCRQUONTSPIKHGD
// # UKW-B	YRUHQSLDPXNGOKMIEBFZCWVJAT
// # UKW-C	FVPJIAOYEDRZXWGCTKUQSBNMHL

// # zero indexed array showing what an input A encodes to
// # 0 = A, 1 = B, etc.

// initialise global vars

// int l_row_pins[3] = {L_ROW_1, L_ROW_2, L_ROW_3};
// int l_col_pins[9] = {L_COL_1, L_COL_2, L_COL_3, L_COL_4, L_COL_5, L_COL_6, L_COL_7, L_COL_8, L_COL_9};

uint8_t light_rows[26] = { 1, 2, 2, 1, 0, 1, 1, 1, 0, 1, 1, 2, 2, 2, 0, 2, 0, 0, 1, 0, 0, 2, 0, 2, 2, 0 };
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

uint8_t rotor_nums[5][26];

char rotor_lets[5][26] = {
    "EKMFLGDQVZNTOWYHXUSPAIBRCJ",
    "AJDKSIRUXBLHWTMCQGZNPYFVOE",
    "BDFHJLCPRTXVZNYEIWGAKMUSQO",
    "ESOVPZJAYQUIRHXLNFTGKDCMWB",
    "VZBRGITYUPSDNHLXAWMJQOFECK",
};

uint8_t ETW_nums[26];
char ETW_lets[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

uint8_t UKW_nums[3][26];
char UKW_lets[5][26] = {
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

bool in_test_mode = 0;


Enigma enigma;
Enigma *p_enigma = &enigma;

String msg = "";

// Function prototypes

void gen_arrays();

void gen_enigma(Enigma *ptr,
                char rotor_lets[3],
                char rings_lets[3],
                int reflector,
                int temp_plugboard[][2],
                int num_leads,
                char vis_pos_lets[3]);

void rotate(Enigma *ptr);

int plugboard(Enigma *ptr, int letter_in);

int where(int arr[26], int n);

int etw_l(Enigma *ptr, int letter_in);

int etw_r(Enigma *ptr, int letter_in);

int ukw(Enigma *ptr, int letter_in);

int rotors_l(Enigma *ptr, int let_in);

int rotors_r(Enigma *ptr, int let_in);

void print_windows(Enigma *ptr, bool letters);

int encode(Enigma *ptr, int key_num);

int key_down(Enigma *ptr, int key_num);

void key_up(int key_num);

void light_on(char key_pressed);

void light_off(char key_pressed);

void all_lights_off(void);

void (*resetFunc)(void) = 0;  // declare reset function @ address 0


void test_mode(void) {
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
}

void setup() {
    // begin serial comms
    Serial.begin(115200);
    while (!Serial) { /*wait*/
    }                 // for USB serial switching boards

    Serial.println("Starting Setup");

    // begin I2C
    Wire.begin();

    // Setup lamp IO expander as outputs
    lamp_io.init();
    lamp_io.portMode(MCP23017Port::A, 0);  // Port A as output
    lamp_io.portMode(MCP23017Port::B, 0);  // Port B as output

    lamp_io.writeRegister(MCP23017Register::GPIO_A, 0x00);  // Reset port A
    lamp_io.writeRegister(MCP23017Register::GPIO_B, 0x00);  // Reset port B

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
    char rotors[3] = "532";  // 1thru5
    char rings[3] = "ABC";
    int reflector = 1;
    int temp_plugboard[][2] = { { 0, 5 } };
    int num_leads = sizeof(temp_plugboard) / sizeof(*temp_plugboard);
    char initial_pos[3] = "BCD";
    int plugboard[26];

    for (int i = 0; i < 26; i++) {
        plugboard[i] = i;
    }
    for (int j = 0; j < num_leads; j++) {
        plugboard[temp_plugboard[j][0]] = temp_plugboard[j][1];
        plugboard[temp_plugboard[j][1]] = temp_plugboard[j][0];
    }


    // char *keyboard = "LZB";
    // for (int key = 0; key < 3; key++) {
    //     char c = keyboard[key];
    //     Serial.println(c);
    //     light_on(c - 'A');
    //     delay(1000);
    //     light_off(c - 'A');




reset_ptr:
    // setup the enigma struct with initial settings
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

    // char *string_in = "HELLOMATTIS";
    // for (int i = 0; i < strlen(string_in); i++) {
    //     int c = string_in[i] - 'A';
    //     rotate(p_enigma);
    //     Serial.print((char)(encode(p_enigma, c) + 'A'));
    // }
    // Serial.println();
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
                        msg = " PRESSED.";
                        key_down(p_enigma, c);
                        break;
                    case HOLD:
                        msg = " HOLD.";
                        break;
                    case RELEASED:
                        msg = " RELEASED.";
                        key_up(p_enigma, c);
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
