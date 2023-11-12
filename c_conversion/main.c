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

#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <ctype.h>
#include <stdlib.h>

// # zero indexed array showing what an input A encodes to
// # 0 = A, 1 = B, etc.
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
    "EJMZALYXVBWFCRQUONTSPIKHGD", // UKW - A
    "YRUHQSLDPXNGOKMIEBFZCWVJAT", // UKW - B
    "FVPJIAOYEDRZXWGCTKUQSBNMHL", // UKW - C
};

char rotor_notch_lets[5] = {'Y', 'M', 'D', 'R', 'H'};
char rotor_turnover_lets[5] = {'Q', 'E', 'V', 'J', 'Z'};

int rotor_notch_nums[5];
int rotor_turnover_nums[5];

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

typedef struct Enigma
{
    int rotors[3];     // 0 indexed, 0 to 4
    int rings[3];      // 0 indexed, 0 to 25
    int reflector;     // 0 indexed, 0 to 2
    int plugboard[26]; // pairs of letters connected together
    int vis_pos[3];
    int rot_pos[3];
    int turnovers[3];
    int counter;
} Enigma;

void gen_enigma(Enigma *ptr,
                char rotor_lets[3],
                char rings_lets[3],
                int reflector,
                int temp_plugboard[][2],
                int num_leads,
                char vis_pos_lets[3])
{
    int vis_pos[3];
    int rings[3];
    int rot_pos[3];
    int rotors[3];

    for (int i = 0; i < 3; i++)
    {
        rotors[i] = (int)rotor_lets[i] - '1';
        vis_pos[i] = (int)vis_pos_lets[i] - 'A';
        rings[i] = (int)rings_lets[i] - 'A';
        rot_pos[i] = (vis_pos[i] - rings[i] + 26) % 26;
    }

    int plugboard[26] = {[0 ... 25] = -1};
    int turnovers[3];
    for (int i = 0; i < 3; i++)
    {
        turnovers[i] = rotor_turnover_nums[rotors[i]];
    }

    for (int i = 0; i < num_leads; i++)
    {
        plugboard[temp_plugboard[i][0]] = temp_plugboard[i][1];
        plugboard[temp_plugboard[i][1]] = temp_plugboard[i][0];
    }
    for (int i = 0; i < 26; i++)
    {
        printf("%d", plugboard[i]);
    }
    printf("\n");

    memcpy(ptr->rotors, rotors, sizeof(ptr->rotors));
    memcpy(ptr->rings, rings, sizeof(ptr->rings));
    memcpy(ptr->plugboard, plugboard, sizeof(ptr->plugboard));
    memcpy(ptr->vis_pos, vis_pos, sizeof(ptr->vis_pos));
    memcpy(ptr->rot_pos, rot_pos, sizeof(ptr->rot_pos));
    memcpy(ptr->turnovers, turnovers, sizeof(ptr->turnovers));
    ptr->reflector = reflector;
    ptr->counter = 0;
}

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

int plugboard(Enigma *ptr, int letter_in)
{
    int letter_out = (ptr->plugboard[letter_in] == -1) ? letter_in : ptr->plugboard[letter_in];
    return letter_out;
}

int where(int arr[26], int n)
{
    // Func to find index of first instance of n in array arr
    for (int i = 0; i < 26; i++)
    {
        if (arr[i] == n)
            return i;
    }
    return -1;
}

int etw_l(Enigma *ptr, int letter_in)
{
    // printf("etwl %d|", letter_in);
    int letter_out = where(ETW_nums, letter_in);

    // if self
    //     .verbose
    //         p(letter_out, f "\tETW Left ");
    return letter_out;
}

int etw_r(Enigma *ptr, int letter_in)
{
    // printf("etwr %d|", letter_in);
    int letter_out = ETW_nums[letter_in];
    // if self.verbose:
    //     p(x, f"\tETW Right ")
    return letter_out;
}

int ukw(Enigma *ptr, int letter_in)
{
    // printf("ukw %d|", letter_in);
    int letter_out = UKW_nums[ptr->reflector][letter_in];
    return letter_out;
}

int rotors_l(Enigma *ptr, int let_in)
{
    // printf("rot_l %d|", let_in);
    int letter_in = let_in;
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

int rotors_r(Enigma *ptr, int let_in)
{
    // printf("rot_r %d|", let_in);
    int letter_in = let_in;
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

void print_windows(Enigma *ptr, bool letters)
{
    if (letters)
        printf("Windows : %c, %c, %c", ptr->vis_pos[0] + 'A', ptr->vis_pos[1] + 'A', ptr->vis_pos[2] + 'A');
    else
        printf("Windows : %d, %d, %d", ptr->vis_pos[0], ptr->vis_pos[1], ptr->vis_pos[2]);
}

int encode(Enigma *ptr, int key_pressed)
{
    // printf("in encode");
    int o_o_plugboard1 = plugboard(ptr, key_pressed);
    int o_o_etw_l = etw_l(ptr, o_o_plugboard1);
    int o_o_rots_l = rotors_l(ptr, o_o_etw_l);
    int o_o_ukw = ukw(ptr, o_o_rots_l);
    int o_o_rots_r = rotors_r(ptr, o_o_ukw);
    int o_o_etw_r = etw_r(ptr, o_o_rots_r);
    int o_o_plugboard2 = plugboard(ptr, o_o_etw_r);
    return o_o_plugboard2;
}

char keypress(Enigma *ptr, char key_pressed)
{
    // printf("in keypress");
    if (!isalpha(key_pressed))
    {
        return key_pressed;
    }
    rotate(ptr);

    int key_num = (int)toupper(key_pressed) - 'A'; // "A" -> integer 0
    int x = encode(ptr, key_num);
    return (char)x + 'A';
}

int main(int argc, char *argv[])
{
    gen_arrays();

    Enigma enigma;
    Enigma *p_enigma = &enigma;
    char rotors[3] = "532"; // 1thru5
    char rings[3] = "ABC";
    int reflector = 1;
    int plugboard[][2] = {{0, 5}};
    int num_leads = sizeof(plugboard) / sizeof(*plugboard);
    char initial_pos[3] = "BCD";

    gen_enigma(p_enigma, rotors, rings, reflector, plugboard, num_leads, initial_pos);

    printf("INITIAL SETTINGS: \n");
    print_windows(p_enigma, 1);
    printf("\n\nEncoding:\n");

    // file pointer variable to store the value returned by
    // fopen
    FILE *fptr;
    FILE *fptr2;

    // opening the file in read mode
    fptr = fopen("input.txt", "r");
    fptr2 = fopen("output.txt", "w");

    // checking if the file is opened successfully
    if (fptr == NULL)
    {
        printf("The file is not opened. The program will "
               "now exit.");
        exit(0);
    }
    if (fptr2 == NULL)
    {
        printf("The file is not opened. The program will "
               "now exit.");
        exit(0);
    }
    char c;
    while ((c = fgetc(fptr)) != EOF)
    {
        printf("%c\n", c);
        fputc(keypress(p_enigma, c), fptr2);
    }
    fclose(fptr);
    fclose(fptr2);
    return 0;
}