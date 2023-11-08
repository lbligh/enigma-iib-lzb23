# Lucius Bligh 2023
# Rotor	ABCDEFGHIJKLMNOPQRSTUVWXYZ	Notch	Turnover    No Notches
# ETW	ABCDEFGHIJKLMNOPQRSTUVWXYZ
# I	    EKMFLGDQVZNTOWYHXUSPAIBRCJ	Y	    Q	        1
# II	AJDKSIRUXBLHWTMCQGZNPYFVOE	M	    E	        1
# III	BDFHJLCPRTXVZNYEIWGAKMUSQO	D	    V	        1
# IV	ESOVPZJAYQUIRHXLNFTGKDCMWB	R	    J	        1
# V	    VZBRGITYUPSDNHLXAWMJQOFECK	H	    Z	        1
# UKW-A	EJMZALYXVBWFCRQUONTSPIKHGD
# UKW-B	YRUHQSLDPXNGOKMIEBFZCWVJAT
# UKW-C	FVPJIAOYEDRZXWGCTKUQSBNMHL
import inspect, re

import numpy as np

# zero indexed array showing what an input A encodes to
# 0 = A, 1 = B, etc.
rotor_nums = np.zeros((5, 26), dtype=int)
rotor_lets = [
    "EKMFLGDQVZNTOWYHXUSPAIBRCJ",
    "AJDKSIRUXBLHWTMCQGZNPYFVOE",
    "BDFHJLCPRTXVZNYEIWGAKMUSQO",
    "ESOVPZJAYQUIRHXLNFTGKDCMWB",
    "VZBRGITYUPSDNHLXAWMJQOFECK",
]

rotor_notches = [["Y"], ["M"], ["D"], ["R"], ["H"]]
rotor_turnover = [["Q"], ["E"], ["V"], ["J"], ["Z"]]

rotor_notch_nums = [[ord(x) - ord("A") for x in i] for i in rotor_notches]
rotor_turnover_nums = [[ord(x) - ord("A") for x in i] for i in rotor_turnover]

ETW_nums = np.zeros(26, dtype=int)
ETW_lets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"  # see ETW encoding on Enigma Wiring wesbite, if first letter was Q then a Q would come out (R-L) as a A

UKW_nums = np.zeros((3, 26), dtype=int)
UKW_lets = [
    "EJMZALYXVBWFCRQUONTSPIKHGD",  # UKW-A
    "YRUHQSLDPXNGOKMIEBFZCWVJAT",  # UKW-B
    "FVPJIAOYEDRZXWGCTKUQSBNMHL",  # UKW-C
]


def gen_arrays():
    a = ord("A")
    # Rotors:
    for i in range(5):
        for j in range(26):
            rotor_nums[i, j] = ord(rotor_lets[i][j]) - a

    # ETW:
    for i in range(26):
        ETW_nums[i] = ord(ETW_lets[i]) - a

    # UKW:
    for i in range(3):
        for j in range(26):
            UKW_nums[i, j] = ord(UKW_lets[i][j]) - a


class Enigma:
    def __init__(
        self,
        rotors="321",
        rings="AAA",
        reflector="B",
        plugboard=[],
        initial_pos="AAA",
        letters=False,
        verbose=False,
    ) -> None:
        """Create new Enigma entity.

        Keyword Arguments:
        rotors -- the three rotors chosen for the machine, left to right. default "321", 1-5
        rings -- the ring settings (ringstellung), left to right. default "AAA"
        relector -- the reflector chosen, default B. choice of A,B,C
        plugboard -- the plugboard setup, list of strs of pairs of letters. default [], eg: ["AC","QR","BC"]
        initial_pos -- Inital rotor positions, left to right. default "AAA"
        letters -- boolean choosing if using numerical rotors or alphabetic, default False
        verbose -- enable verbose output. default False
        """

        # Left - Middle - Right: indices 0,1,2!!!
        # Setup variables - won't change
        self.rotors1up = rotors  # 321 means rotors III,II,I
        self.rotors = [int(i) - 1 for i in rotors]  # conv 1-5 values to 0-4
        self.ring_lets = rings
        self.rings = [
            ord(i) - ord("A") for i in rings
        ]  # array of three 0 indexed numbers - Ring Positions are rotor/ring offsets!
        self.plugboard_wiring = plugboard
        self.pb_nums = [[ord(x) - ord("A") for x in i] for i in plugboard]
        self.reflector_let = reflector
        self.reflector = ord(reflector) - ord("A")  # 0,1,2 = A,B,C
        self.initial_pos_lets = initial_pos
        self.initial_pos = [ord(i) - ord("A") for i in initial_pos]  # A = 0 thru Z = 25
        self.letters = letters
        self.verbose = verbose
        self.rotor_turnovers = [
            [x for x in rotor_turnover_nums[i]] for i in self.rotors
        ]  # list of lists of visible letters for each rotor where the notch is aligned

        # variables that will change
        self.vis_pos = np.array(
            self.initial_pos
        )  # holds numeric repr of which letters are showing in the windows A=0, z=25

        self.counter = 0

        self.rotor_pos = np.array(
            [(v - r) % 26 for v, r in zip(self.vis_pos, self.rings)]
        )  # which actual connector is under the window, A = 0, Z=25

        if self.verbose:
            print(f"New Enigma instance created with: {self.__repr__()}")

        self.printWindows()

    def printWindows(self):
        lets_windows = f"Windows: {chr(self.vis_pos[0]+ord('A'))},{chr(self.vis_pos[1]+ord('A'))},{chr(self.vis_pos[2]+ord('A'))}"
        nums_windows = f"Windows: {self.vis_pos[0]:02d},{self.vis_pos[1]:02d},{self.vis_pos[2]:02d}"

        if self.letters:
            print(lets_windows)
        else:
            print(nums_windows)

    def __repr__(self):
        """Prints setup of machine in a way that can create a new instance - initial positions"""
        return f"Enigma(rotors = {repr(self.rotors1up)}, rings = {repr(self.ring_lets)}, reflector = {repr(self.reflector_let)}, plugboard = {repr(self.plugboard_wiring)}, initial_pos = {repr(self.initial_pos_lets)}, letters={(self.letters)}, verbose={self.verbose})"

    def keypress(self, key_pressed: str):
        if not key_pressed.isalpha():
            return key_pressed
        self.rotate()

        if self.verbose:
            self.printWindows()
            print("Counter: ", self.counter)

        key_num = ord(key_pressed.strip().upper()) - ord("A")  # "A" -> integer 0
        x = self.encode(key_num)
        return chr(x + ord("A"))

    def rotate(self):
        self.counter += 1
        rots = np.array([0, 0, 1])  # RH rotor always rotates

        for i in range(2):
            if (
                self.vis_pos[i + 1] in self.rotor_turnovers[i + 1]
            ):  # if rotor to right is in position where rotor should rotate
                rots[i] = 1
                rots[i + 1] = 1  # Notch rotate both rotors

        for i in range(2, -1, -1):
            self.vis_pos[i] = (self.vis_pos[i] + rots[i]) % 26
            self.rotor_pos[i] = (self.rotor_pos[i] + rots[i]) % 26

    def encode(self, key_pressed):
        o_o_plugboard1 = self.plugboard(key_pressed)
        o_o_etw_l = self.etw_l(o_o_plugboard1)
        o_o_rots_l = self.rotors_l(o_o_etw_l)
        o_o_ukw = self.ukw(o_o_rots_l)
        o_o_rots_r = self.rotors_r(o_o_ukw)
        o_o_etw_r = self.etw_r(o_o_rots_r)
        o_o_plugboard2 = self.plugboard(o_o_etw_r)
        return o_o_plugboard2

    def plugboard(self, letter_in):
        for i in self.pb_nums:
            if letter_in in i:
                letter_out = i[(not i.index(letter_in)) * 1]
                break
        else:
            letter_out = letter_in
        if self.verbose:
            p(letter_out, f"\tPlugboard 1 ")
        return letter_out

    def etw_l(self, letter_in):
        (i,) = np.where(ETW_nums == letter_in)
        letter_out = i[0]
        if self.verbose:
            p(letter_out, f"\tETW Left ")
        return letter_out

    def etw_r(self, letter_in):
        x = ETW_nums[letter_in]
        if self.verbose:
            p(x, f"\tETW Right ")
        return x

    def ukw(self, letter_in):
        letter_out = UKW_nums[self.reflector][letter_in]
        if self.verbose:
            p(letter_out, f"\tUKW ")
        return letter_out

    def rotors_l(self, letter_in):
        for rotor in range(2, -1, -1):
            if self.verbose:
                print("rotor_no: ", rotor)
                print("letter_in ", letter_in)
                print("vis_pos ", self.vis_pos[rotor])
                print("rotor_pos ", self.rotor_pos[rotor])
                print("Into rotor: ", int((letter_in + self.rotor_pos[rotor]) % 26))
                print(
                    "Out of rotor ",
                    rotor_nums[self.rotors[rotor]][
                        int((letter_in + self.rotor_pos[rotor]) % 26)
                    ],
                )
                print(
                    "letter_out ",
                    (
                        rotor_nums[self.rotors[rotor]][
                            int((letter_in + self.rotor_pos[rotor]) % 26)
                        ]
                        - self.rotor_pos[rotor]
                    )
                    % 26,
                )

            letter_out = (
                rotor_nums[self.rotors[rotor]][
                    int((letter_in + self.rotor_pos[rotor]) % 26)
                ]
                - self.rotor_pos[rotor]
            ) % 26
            """
            Assumes that o/p of previous stage has 0 at window
            rotor nums is encoding of all 5 rotors. 
            self.rotors[rotor] gives index of rotor in rotor_nums of current rotor. 
            rotor_pos[rotor] is the contact at the top of the rotor.
            letter_in is the output of previous stage, 0 is at the top
            letter_in + rotor_pos[rotor] translates letter_in to index of encoding list.
            """
            letter_in = letter_out
            if self.verbose:
                p(letter_out, f"\tRotor {rotor}")
        return letter_out

    def rotors_r(self, letter_in):
        for rotor in range(0, 3):
            (i,) = np.where(
                rotor_nums[self.rotors[rotor]]
                == int((letter_in + self.rotor_pos[rotor]) % 26)
            )
            if self.verbose:
                print("rotor_no: ", rotor)
                print("letter_in ", letter_in)
                print("vis_pos ", self.vis_pos[rotor])
                print("rotor_pos ", self.rotor_pos[rotor])
                print("Into rotor: ", int((letter_in + self.rotor_pos[rotor]) % 26))
                print("Out of rotor ", int(i[0]))
                print("letter_out ", int(i[0] - self.rotor_pos[rotor]) % 26)

            """
            Assumes that o/p of previous stage has 0 at top contact
            rotor nums is encoding of all 5 rotors. 
            self.rotors[rotor] gives index of rotor in rotor_nums of current rotor. 
            rotor_pos[rotor] is the contact at the top of the rotor.
            letter_in is the output of previous stage, 0 is at the top
            letter_in + rotor_pos[rotor] translates letter_in to index of encoding list.
            """
            letter_out = int(i[0] - self.rotor_pos[rotor]) % 26
            if self.verbose:
                p(letter_out, f"\tRotor {rotor}")
            letter_in = letter_out

        return letter_out


def p(x, y=""):
    print("\t", y, x, chr(x + ord("A")))


def char(x):
    return chr(x + ord("A"))


def main():
    gen_arrays()

    enigma = Enigma(
        rotors="321",
        rings="ABX",
        reflector="B",
        plugboard=["AQ"],
        initial_pos="AAZ",
        letters=True,
        verbose=False,
    )

    string_input = input("Enter String")
    for i in string_input:
        print(enigma.keypress(i), end="")
    print()


if __name__ == "__main__":
    main()
