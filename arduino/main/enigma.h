#ifndef ENIGMA
#define ENIGMA

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

#endif