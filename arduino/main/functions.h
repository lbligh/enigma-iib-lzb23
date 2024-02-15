#ifndef FUNC_HEADER
#define FUNC_HEADER

void gen_arrays();

void gen_enigma(Enigma *ptr,
                char *rotor_lets,
                char *rings_lets,
                int reflector,
                int *plugboard,
                char *vis_pos_lets);

void rotate(Enigma *ptr);

int enc_plugboard(Enigma *ptr, int letter_in);

int where(int arr[26], int n);

int etw_l(Enigma *ptr, int letter_in);

int etw_r(Enigma *ptr, int letter_in);

int ukw(Enigma *ptr, int letter_in);

int rotors_l(Enigma *ptr, int let_in);

int rotors_r(Enigma *ptr, int let_in);

void print_windows(Enigma *ptr, bool letters);

int encode(Enigma *ptr, int key_num);

int key_down(Enigma *ptr, int key_num);

void key_up(Enigma *ptr, int key_num);

void light_on(char key_pressed);

void light_off(char key_pressed);

void all_lights_off(void);

void update_plugboard(Enigma *ptr);

void get_plugboard_settings(int *plugboard);

#endif
