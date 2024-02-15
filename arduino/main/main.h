#ifndef MAIN_HEADER_FILE
#define MAIN_HEADER_FILE

#include <stdbool.h>
#include <Arduino.h>
#include <MCP23017.h>

#include "enigma.h"

// PIN DEFINITIONS
#define TEST_SW 2
#define CAM_1 3
#define CAM_2 4

// IO Expander Addresses
#define SWITCH_IO_ADDR 0x20
#define LAMP_IO_ADDR 0x20 + 0b01

#define PBOARD_EXP_1 0x20 + 0b010
#define PBOARD_EXP_2 0x20 + 0b011

// IO expander externs
extern MCP23017 pboard_mcp1;
extern MCP23017 pboard_mcp2;

// GLOBAL VARIABLE DEFINITIONS
// extern int l_row_pins[3];
// extern int l_col_pins[9];

extern uint8_t rotor_nums[5][26];

extern char rotor_lets[5][27];
extern uint8_t ETW_nums[26];
extern char ETW_lets[26];

extern uint8_t UKW_nums[3][26];
extern char UKW_lets[3][27];

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

extern bool in_test_mode;

#endif
