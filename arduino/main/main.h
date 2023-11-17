#ifndef DEFINITIONS
#define DEFINITIONS

#include <stdbool.h>
#include <Arduino.h>

#include "enigma.h"

// PIN DEFINITIONS
#define L_ROW_1 2
#define L_ROW_2 3
#define L_ROW_3 4

#define L_COL_1 5
#define L_COL_2 6
#define L_COL_3 7
#define L_COL_4 8
#define L_COL_5 9
#define L_COL_6 10
#define L_COL_7 11
#define L_COL_8 12
#define L_COL_9 13

// CONSTANT DEFINITIONS
#define ECG_TIME 5000000 // microseconds

// GLOBAL VARIABLE DEFINITIONS
extern int l_row_pins[3];
extern int l_col_pins[9];

extern int rotor_nums[5][26];

extern char rotor_lets[5][26];
extern int ETW_nums[26];
extern char ETW_lets[26];

extern int UKW_nums[3][26];
extern char UKW_lets[5][26];

extern char rotor_notch_lets[5];
extern char rotor_turnover_lets[5];

extern int rotor_notch_nums[5];
extern int rotor_turnover_nums[5];

#endif
