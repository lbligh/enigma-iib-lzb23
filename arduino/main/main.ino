#include <stdbool.h>
#include <string.h>
#include <Arduino.h>

#include <stdio.h>
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

int l_row_pins[3] = { L_ROW_1, L_ROW_2, L_ROW_3 };
int l_col_pins[9] = { L_COL_1, L_COL_2, L_COL_3, L_COL_4, L_COL_5, L_COL_6, L_COL_7, L_COL_8, L_COL_9 };

int rotor_nums[5][26];

char rotor_lets[5][26] = {
    "EKMFLGDQVZNTOWYHXUSPAIBRCJ",
    "AJDKSIRUXBLHWTMCQGZNPYFVOE",
    "BDFHJLCPRTXVZNYEIWGAKMUSQO",
    "ESOVPZJAYQUIRHXLNFTGKDCMWB",
    "VZBRGITYUPSDNHLXAWMJQOFECK",
};

int ETW_nums[26];
char ETW_lets[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

int UKW_nums[3][26];
char UKW_lets[5][26] = {
    "EJMZALYXVBWFCRQUONTSPIKHGD",  // UKW - A
    "YRUHQSLDPXNGOKMIEBFZCWVJAT",  // UKW - B
    "FVPJIAOYEDRZXWGCTKUQSBNMHL",  // UKW - C
};

char rotor_notch_lets[5] = { 'Y', 'M', 'D', 'R', 'H' };
char rotor_turnover_lets[5] = { 'Q', 'E', 'V', 'J', 'Z' };

int rotor_notch_nums[5];
int rotor_turnover_nums[5];

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

Enigma enigma;
Enigma *p_enigma = &enigma;

void setup() {
    Serial.begin(115200);
    Serial.println("Setup Start");

    // pin modes
    for (int row = 0; row < 3; row++) {
        pinMode(l_row_pins[row], OUTPUT);
    }
    for (int col = 0; col < 9; col++) {
        pinMode(l_col_pins[col], OUTPUT);
    }

    all_lights_off();

    gen_arrays();

    char rotors[3] = "532";  // 1thru5
    char rings[3] = "ABC";
    int reflector = 1;
    int plugboard[][2] = { { 0, 5 } };
    int num_leads = sizeof(plugboard) / sizeof(*plugboard);
    char initial_pos[3] = "BCD";

    gen_enigma(p_enigma, rotors, rings, reflector, plugboard, num_leads, initial_pos);

    Serial.println("INITIAL SETTINGS: ");
    print_windows(p_enigma, 1);

    char *testStr = "HELLOWORLD";
    Serial.print("String to Encode: ");
    Serial.println(testStr);

    // int len = strlen(testStr);
    // char c;
    // char x;
    // int key_num;
    // for (int i = 0; i < len; i++) {
    //     c = testStr[i];
    //     key_num = (int)c - 'A';
    //     x = (char)key_down(p_enigma, key_num) + 'A';
    //     Serial.print("to encode: ");
    //     Serial.print(c);
    //     Serial.print(". Encoded as: ");
    //     Serial.println(x);
    //     delay(500);
    //     key_up(key_num);
    // }
}

void loop() {
    // char *keyboard = "QWERTZUIOASDFGHJKPYXCVBNML";
    // for (int key = 0; key < 26; key++) {
    //     char c = keyboard[key];
    //     light_on(c - 'A');
    //     delay(500);
    //     light_off(c - 'A');
    // }
    all_lights_off();
    int c = (int)'Q' - 'A';
    Serial.println(c);
    int x = key_down(p_enigma, c);
    Serial.println(c);
    delay(1000);
    key_up(x);
    delay(1000);
}
