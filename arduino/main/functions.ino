#include <Arduino.h>
#include <stdbool.h>
#include <string.h>
#include <stdint.h>
#include <Wire.h>
#include <MCP23017.h>

#include "main.h"
#include "enigma.h"

void bin_string(char *buff, uint16_t bin_in);
void lights_update(void);

uint8_t nums[26] = {16, 22, 4, 17, 19, 25, 20, 8, 14, 0, 18, 3, 5, 6, 7, 9, 10, 15, 24, 23, 2, 21, 1, 13, 12, 11}; // num to pin mapping

/*!
 * @brief Generates the numeric arrays for encoding from the alphabetic inputs
 */

void gen_arrays()
{
    for (int i = 0; i < 5; i++)
    {
        for (int j = 0; j < 26; j++)
        {
            rotor_nums[i][j] = rotor_lets[i][j] - 'A';
        }
    }
    for (int j = 0; j < 26; j++)
    {
        ETW_nums[j] = ETW_lets[j] - 'A';
    }
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 26; j++)
        {
            UKW_nums[i][j] = UKW_lets[i][j] - 'A';
        }
    }

    for (int i = 0; i < 5; i++)
    {
        rotor_notch_nums[i] = rotor_notch_lets[i] - 'A';
        rotor_turnover_nums[i] = rotor_turnover_lets[i] - 'A';
    }
}

/*!
 * @brief Generates the Enigma Struct.
 *
 * Uses the initial positions provided as parameters.
 *
 * @param ptr Pointer to the Enigma instance.
 * @param rotor_lets  char[3] - Which rotors are being used.
 * @param ring_lets char[3] - Ring settings for each rotor.
 * @param reflector Which reflector is being used.
 * @param plugboard  int[26] The initial plugboard settings.
 * @param vis_pos_lets char[3] The initial rotor positions in letters.
 */
void gen_enigma(Enigma *ptr,
                char *rotor_lets,
                char *rings_lets,
                int reflector,
                int *plugboard,
                char *vis_pos_lets)
{
    int vis_pos[3];
    int rings[3];
    int rot_pos[3];
    int rotors[3];

    // memcpy(ptr->plugboard, plugboard, sizeof(ptr->plugboard));

    for (int i = 0; i < 3; i++)
    {
        rotors[i] = (int)rotor_lets[i] - '1';
        vis_pos[i] = (int)vis_pos_lets[i] - 'A';
        rings[i] = (int)rings_lets[i] - 'A';
        rot_pos[i] = (vis_pos[i] - rings[i] + 26) % 26;
    }

    int turnovers[3];
    for (int i = 0; i < 3; i++)
    {
        turnovers[i] = rotor_turnover_nums[rotors[i]];
    }

    memcpy(ptr->rotors, rotors, sizeof(ptr->rotors));
    memcpy(ptr->rings, rings, sizeof(ptr->rings));
    memcpy(ptr->plugboard, plugboard, sizeof(ptr->plugboard));
    memcpy(ptr->vis_pos, vis_pos, sizeof(ptr->vis_pos));
    memcpy(ptr->rot_pos, rot_pos, sizeof(ptr->rot_pos));
    memcpy(ptr->turnovers, turnovers, sizeof(ptr->turnovers));
    ptr->reflector = reflector;
    ptr->counter = 0;
}
/*!
 * @brief Rotates the rotors for a keypress.
 *
 * Uses the current rotor positions to check turnovers.
 *
 * @param ptr Pointer to the Enigma instance.
 */
void rotate(Enigma *ptr)
{
    ptr->counter += 1;
    int rots[] = {0, 0, 1}; // RH rotor always rotates

    for (int i = 0; i < 2; i++)
    {

        if (ptr->vis_pos[i + 1] == ptr->turnovers[i + 1])
        {
            { // if rotor to right is in position where rotor should rotate
                rots[i] = 1;
                rots[i + 1] = 1; // Notch rotate both rotors
            }
        }
    }
    for (int i = 2; i > -1; i--)
    {
        ptr->vis_pos[i] = (ptr->vis_pos[i] + rots[i] + 26) % 26;
        ptr->rot_pos[i] = (ptr->rot_pos[i] + rots[i] + 26) % 26;
    }
}
/*!
 * @brief Encodes a letter through the plugboard
 *
 * @param ptr Pointer to the Enigma instance.
 * @param letter_in Letter to encode
 *
 * @return The encoded letter
 */
int enc_plugboard(Enigma *ptr, int letter_in)
{
    // int letter_out = (ptr->plugboard[letter_in] == -1) ? letter_in : ptr->plugboard[letter_in];
    int letter_out = ptr->plugboard[letter_in];
    return letter_out;
}

/*!
 * @brief Finds the index of an element in a letter array
 *
 * @param arr Array to search
 * @param n Integer to find
 *
 * @return Index in array or 100 if not found
 */
int where(uint8_t arr[26], int n)
{
    // Func to find index of first instance of n in array arr
    for (int i = 0; i < 26; i++)
    {
        if (arr[i] == n)
            return i;
    }
    return 100;
}

/*!
 * @brief Encodes a letter through the entry wheel
 *
 * From the plugboard to the rotors
 *
 * @param ptr Pointer to the Enigma instance.
 * @param letter_in Letter to encode
 *
 * @return The encoded letter
 */
int etw_l(Enigma *ptr, int letter_in)
{
    // printf("etwl %d|", letter_in);
    int letter_out = where(ETW_nums, letter_in);

    // if self
    //     .verbose
    //         p(letter_out, f "\tETW Left ");
    return letter_out;
}

/*!
 * @brief Encodes a letter through the entry wheel
 *
 * From the rotors to the plugboard
 *
 * @param ptr Pointer to the Enigma instance.
 * @param letter_in Letter to encode
 *
 * @return The encoded letter
 */
int etw_r(Enigma *ptr, int letter_in)
{
    // printf("etwr %d|", letter_in);
    int letter_out = ETW_nums[letter_in];
    // if self.verbose:
    //     p(x, f"\tETW Right ")
    return letter_out;
}

/*!
 * @brief Encodes a letter through the reflector
 *
 * @param ptr Pointer to the Enigma instance.
 * @param letter_in Letter to encode
 *
 * @return The encoded letter
 */
int ukw(Enigma *ptr, int letter_in)
{
    // printf("ukw %d|", letter_in);
    int letter_out = UKW_nums[ptr->reflector][letter_in];
    return letter_out;
}

/*!
 * @brief Encodes a letter through the rotors
 *
 * Going leftwards (towards reflector)
 *
 * @param ptr Pointer to the Enigma instance.
 * @param letter_in Letter to encode
 *
 * @return The encoded letter
 */
int rotors_l(Enigma *ptr, int letter_in)
{
    int letter_out;
    for (int rotor = 2; rotor > -1; rotor--)
    {
        letter_out = (rotor_nums[ptr->rotors[rotor]][(letter_in + ptr->rot_pos[rotor] + 26) % 26] - ptr->rot_pos[rotor] + 26) % 26;
        /*
        Assumes that o/p of previous stage has 0 at window
        rotor nums is encoding of all 5 rotors.
        self.rotors[rotor] gives index of rotor in rotor_nums of current rotor.
        rotor_pos[rotor] is the contact at the top of the rotor.
        letter_in is the output of previous stage, 0 is at the top
        letter_in + rotor_pos[rotor] translates letter_in to index of encoding list.
        */
        letter_in = letter_out;
    }
    return letter_out;
}

/*!
 * @brief Encodes a letter through the rotors
 *
 * Going rightwards (towards entrywheel)
 *
 * @param ptr Pointer to the Enigma instance.
 * @param letter_in Letter to encode
 *
 * @return The encoded letter
 */
int rotors_r(Enigma *ptr, int letter_in)
{
    int letter_out;
    for (int rotor = 0; rotor < 3; rotor++)
    {
        int i = where(rotor_nums[ptr->rotors[rotor]], (letter_in + ptr->rot_pos[rotor] + 26) % 26);
        /*
        Assumes that o/p of previous stage has 0 at top contact
        rotor nums is encoding of all 5 rotors.
        self.rotors[rotor] gives index of rotor in rotor_nums of current rotor.
        rotor_pos[rotor] is the contact at the top of the rotor.
        letter_in is the output of previous stage, 0 is at the top
        letter_in + rotor_pos[rotor] translates letter_in to index of encoding list.
        */
        letter_out = (i - ptr->rot_pos[rotor] + 26) % 26;
        letter_in = letter_out;
    }

    return letter_out;
}

/*!
 * @brief Prints the current visible rotor positions
 *
 * @param ptr Pointer to the Enigma instance.
 * @param letter 1 to show letters, 0 to show numbers
 */
void print_windows(Enigma *ptr, bool letters)
{
    char buffer[100];
    if (letters)
        sprintf(buffer, "Windows : %c, %c, %c", ptr->vis_pos[0] + 'A', ptr->vis_pos[1] + 'A', ptr->vis_pos[2] + 'A');
    else
        sprintf(buffer, "Windows : %d, %d, %d", ptr->vis_pos[0], ptr->vis_pos[1], ptr->vis_pos[2]);
    Serial.println(buffer);
}

/*!
 * @brief Encodes a letter through the whole system
 *
 * @param ptr Pointer to the Enigma instance.
 * @param key_num Letter to encode
 *
 * @return The encoded letter
 */

int encode(Enigma *ptr, int key_num)
{
    // printf("in encode");
    int o_o_plugboard1 = enc_plugboard(ptr, key_num);
    int o_o_etw_l = etw_l(ptr, o_o_plugboard1);
    int o_o_rots_l = rotors_l(ptr, o_o_etw_l);
    int o_o_ukw = ukw(ptr, o_o_rots_l);
    int o_o_rots_r = rotors_r(ptr, o_o_ukw);
    int o_o_etw_r = etw_r(ptr, o_o_rots_r);
    int o_o_plugboard2 = enc_plugboard(ptr, o_o_etw_r);
    return o_o_plugboard2;
}

/*!
 * @brief Called when a key is pressed
 *
 * Rotates rotors and encodes letter and turns on correct light if necessary
 *
 * @param ptr Pointer to the Enigma instance.
 * @param key_num Key pressed.
 *
 * @return The encoded letter
 */
int key_down(Enigma *ptr, int key_num)

{
    // only rotate if no keys held down already
    if (!num_keys_pressed)
    {
        rotate(ptr);
    }

    // Update plugboard settings
    update_plugboard(ptr);

    // increase number of keys currrently pressed down
    num_keys_pressed += 1;
    keys_held_down[key_num] = 1;

    int encoded = encode(ptr, key_num);

    Serial.print((char)(key_num + 'A'));
    Serial.print(" DOWN, ");

    // if pressed key's pair in current encoding is already pressed

    if (keys_held_down[encoded])
    {
        // turn off lamp of current key pressed as no circuit
        light_off(key_num);
        // do not turn on lamp that key_num encodes to

        Serial.print(", pair is pressed");
        Serial.print((char)encoded + 'A');
        Serial.println(" light OFF");

        return encoded;
    }

    // int key_num = (int)toupper(key_pressed) - 'A'; // "A" -> integer 0
    light_on(encoded);

    Serial.print((char)(encoded + 'A'));
    Serial.println(" light ON");

    return encoded;
}

/*!
 * @brief Called when a key is released
 *
 * Turns on/off correct light(s) if necessary
 *
 * @param ptr Pointer to the Enigma instance.
 * @param key_num Key released
 */
void key_up(Enigma *ptr, int key_num)
{

    num_keys_pressed -= 1;
    keys_held_down[key_num] = 0;

    Serial.print((char)(key_num + 'A'));
    Serial.print(" UP");

    uint8_t encoded = encode(ptr, key_num);
    // if the keys pair is held down
    if (keys_held_down[encoded])
    {
        // turn on lamp of current key pressed as circuit now complete
        light_on(key_num);

        Serial.print(", pair is pressed");
        Serial.print((char)encoded + 'A');
        Serial.println(" light ON");

        return;
    }

    Serial.print(", ");
    Serial.print((char)(encoded + 'A'));
    Serial.println(" light OFF");

    // following line works as rotation only occurs on first held down keypress
    light_off(encoded);
}

/*!
 * @brief Turns a specific light on.
 *
 * @param light_num Light to turn on.
 */
void light_on(int light_num)
{
    uint8_t light_col = light_cols[light_num];
    uint8_t light_row = light_rows[light_num];

    // PORTS : 8-0
    // PORTA : col 5-1, row3-1
    // PORTB : col 9-6

    // generate bin
    uint16_t bin = (0b1 << 3 + light_col) | (0b1 << light_row);
    // |= to turn on light if off and leave rest
    light_status |= bin;
    lights_update();

    // char buffer[17];
    // bin_string(buffer, bin);
    // Serial.print((char)(light_num + 'A'));
    // Serial.print(" , num = ");
    // Serial.print(light_num);
    // Serial.print(" , row (1-3)= ");
    // Serial.print(light_row + 1);
    // Serial.print(" , col(1-9) = ");
    // Serial.print(light_col + 1);
    // Serial.print(" , bin = ");
    // Serial.println(buffer);
}

/*!
 * @brief Generates 16-bit binary string to print
 *
 * @param buff Buffer of sufficient length for 16-bit number
 * @param bin_in Unsigned 16-bit integer to print
 */
void bin_string(char *buff, uint16_t bin_in)
{
    uint16_t temp = bin_in;
    buff[16] = '\0';
    for (int x = 15; x >= 0; x--)
    {
        buff[x] = (char)((temp % 2) + '0');
        temp = temp >> 1;
    }
}
/*!
 * @brief Updates the lamp statuses
 */
void lights_update(void)
{
    lamp_io.write(light_status);
}

/*!
 * @brief Turns a specific light off.
 *
 * @param light_num Light to turn off.
 */
void light_off(int light_num)
{
    uint8_t light_col = light_cols[light_num];
    uint8_t light_row = light_rows[light_num];

    // generate inverted bin
    uint16_t bin = ~((0b1 << 3 + light_col) | (0b1 << light_row));
    // &= to turn off light if on and leave rest
    light_status &= bin;
    lights_update();
}

/*!
 * @brief Turns all lights off.
 */
void all_lights_off(void)
{
    light_status = 0;
    lights_update();
}

/*!
 * @brief Updates the plugboard settings
 *
 * Reads the plugboard settings and updates the array in the Enigma struct as necessary
 *
 * @param ptr Pointer to the Enigma instance.
 */
void update_plugboard(Enigma *ptr)
{
    // Serial.println("\n\nSTARTING\n\n");

    int plugboard[26] = {0};
    for (int i = 0; i < 26; i++)
    {
        plugboard[i] = i;
    }

    unsigned long int start = micros();

    get_plugboard_settings(plugboard);

    unsigned long int time = micros() - start;
    Serial.println(time);

    memcpy(ptr->plugboard, plugboard, sizeof(ptr->plugboard));
}
/*!
 * @brief Generates the plugboard array
 *
 * Reads the plugboard settings and updates the array passed to it
 * Expects an array with arr[0] = 0, arr[1] = 1, ..., arr[25] = 25
 *
 * @param plugboard int[26] array for the plugboard settings
 */
void get_plugboard_settings(int *plugboard)
{

    // will contain all 1s aside from a pin that is connected to the pin being checked
    uint32_t full_read;
    uint32_t portMap = 1;
    uint8_t portMapBytes_0;
    uint8_t portMapBytes_1;
    uint8_t portMapBytes_2;
    uint8_t portMapBytes_3;

    for (int pin = 0; pin < 26; pin++)
    {
        //! @todo check!
        // if (plugboard[pin] != pin)
        // {
        //     continue;
        // }
        portMapBytes_0 = portMap;
        portMapBytes_1 = portMap >> 8;
        portMapBytes_2 = portMap >> 16; // downcasting loses more significant bytes
        portMapBytes_3 = portMap >> 24; // therefore no mask needed

        pboard_mcp1.portMode(MCP23017Port::A, ~portMapBytes_0); // set pinmodes
        pboard_mcp1.portMode(MCP23017Port::B, ~portMapBytes_1); // one pin output at a time
        pboard_mcp2.portMode(MCP23017Port::A, ~portMapBytes_2);
        pboard_mcp2.portMode(MCP23017Port::B, ~portMapBytes_3);
        pboard_mcp1.write(0x0000);
        pboard_mcp2.write(0x0000);

        portMap = portMap << 1; // shift so next pin is selected

        full_read = ((uint32_t)pboard_mcp2.read() << 16) + pboard_mcp1.read() + ((uint32_t)1 << pin);

        if (full_read < 0xFFFFFFFF)
        {
            uint8_t connected = log(~full_read) / log(2);
            if (plugboard[nums[connected]] == nums[connected])
            {
                // Serial.print(lets[connected]);
                // Serial.print(" & ");
                // Serial.println(lets[pin]);
                plugboard[nums[pin]] = nums[connected];
                plugboard[nums[connected]] = nums[pin];
            }
        }
    }
}