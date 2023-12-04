#ifndef MAIN_HEADER_FILE
#define MAIN_HEADER_FILE

#include <stdbool.h>
#include <Arduino.h>
#include <MCP23017.h>

#include "enigma.h"

// PIN DEFINITIONS

// IO Expander Addresses
#define LAMP_IO_ADDR 0x20
#define SWITCH_IO_ADDR 0x21

// GLOBAL VARIABLE DEFINITIONS
// extern int l_row_pins[3];
// extern int l_col_pins[9];

extern uint8_t rotor_nums[5][26];

extern char rotor_lets[5][26];
extern uint8_t ETW_nums[26];
extern char ETW_lets[26];

extern uint8_t UKW_nums[3][26];
extern char UKW_lets[5][26];

extern char rotor_notch_lets[5];
extern char rotor_turnover_lets[5];

extern uint8_t rotor_notch_nums[5];
extern uint8_t rotor_turnover_nums[5];

extern uint8_t num_keys_pressed;
extern uint8_t keys_held_down[26];

extern MCP23017 lamp_io;
extern uint16_t light_status;

extern uint8_t light_rows[26];
extern uint8_t light_cols[26];

#endif
