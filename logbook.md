# Lucius Bligh - Enigma IIB Project Logbook
TODO: add received src code for EnigmaHut,
## Mich

### Mich Week < 1:
- Started python Enigma simulation 
  - Included lots of research into mechanical and electrical function of the Enigma I

### Mich Week 1 - 5/10:
- Continued initial python enigma simulation
- RA etc. forms completed
- Tim Meeting - 10/10
  - Discussed plan and predicted problems
  - Looked at unfinished python simulator

### Mich Week 2 - 12/10:
- Finished initial python sim.
- Started investigating EnigmaHut Replica
- Tim Meeting 17/10
  - Discussed project funding
  - Discussed Bletchely Involvement

### Mich Week 3 - 19/10:
- Began reverse engineering schematics of the Replica Enigma. 
- Investigated methods to get original firmware from PIC
- Tim Meeting 24/10
  - Showed progress in reverse engineering
  - Discussed possibility of advice and information from EnigmaHut
- Finished first draft of reverse engineered EnigmaHut PCBs

### Mich Week 4 - 26/10:
- Pulled binary off PIC using pickit and dissassembled to assembly using gpdasm from gputils
- Began reverse engineering of firmware to validate RE'ed schematics
- Meeting with Anthony Barker 27/10
  - Provided lots of info re history and process of the EngimaHut Replica
  - Provided an extra replica to work on
  - Provided drawings of the mechanical parts of the machine
  - Offered to get in touch with the company who had written the original firmware etc. 
- Tim Meeting 31/10
  - Decided to focus on getting a working product initially and move on to Rotor Positioning and Stecker Detection later on.
  - End up with a replacement Control PCB w/ MCU asap.
  - Importance of planning chart
  - First P&I meeting

### Mich Week 5 - 2/11:
- Received P&I Feedback (A)
- Updated planning gantt chart.
- Began prototyping parts of new lamp system with an EIETL arduino and old hardware
- Received from Tony information on the company that wrote the source code, and details on how to contact.
- Received drawings from Tony
- Started converting python sim to C.

### Mich Week 6 - 9/11:
- Finished conversion of python Enigma Sim to C for future conversion to arduino or other system.
- Started converting C code to arduino - so strings can be encoded and displayed on the lamp board with the correct encoding.
- Continued updating schematics for future use
- Tim Meeting 13/11
  - Discussed Oral presentation.
- Lots of work on Oral presentation

### Mich Week 7 - 16/11:
- Oral Presentation 17/11
- Lots of work on arduino source code - finishing lamp board and building structure for keyboard
  - Updated to use I2C IO expander instead of arduino GPIO
- Received original source code from SDF Electronics

### Mich Week 8 - 23/11:
- Tim Meeting 23/11
  - Discussed and demonstrated arduino progress - displaying encodings of strings on the lamp board using old hardware + arduino and IO expander.
  - Switch board still not working

- Lots and lots of work on arduino source

## Christmas Vac
- Tim Meeting 1/12:
  - P&I Meeting
  - Discussion of work over christmas:
    - Plan rotor and plugboard
    - Do schematic and PCB for old system
- Arduino Source now working with keyboard
  - Given an initial (hard-coded) rotor settings and position, can encode key press to light - including edge case behavior
- Got breadboarded prototype encoding key-presses to lamp on/off.
- Wrote tool to create dxfs from .drl files (drl2dxf)
- Designed new control board PCB
- Ordered and received control board PCB
- Received P&I remarks.
- Started investigating Rotor Position Detection again
  - Options:
    - Resistive 
    - Inductive
    - Magnetic
    - Visual
  - Ordered softpot to test
  - Discussion with Cambridge Sensors re inductive solution
- Methods for stecker detection
  - 2 new plans: either:
    - Use standard plugs and wires
    - Use 4 8-bit shift registers to shift a LOW signal to each small plug hole in turn (leaving the rest high)
    - For each low letter: 
      - Use 2 IO expanders to read all of the top plug holes (which are input pulled up) and see if any are low
      - If low therefore that is the connection
  - Or:
    - Use 1 to 1 plugs and wires - either top or bottom plug
    - Again 2 IO expanders
    - set 1 letter to output and low - the rest pulled-up inputs, then test the rest to see if they are low or not
    - repeat for all letters.
- Written Technical Milestone Report - submitted 17/01/24
  
## Lent
### L Week 1 18/01:

### L Week 2 25/01:

### L Week 3 1/02:

### L Week 4 8/02:

### L Week 5 15/02:

### L Week 6 22/02:

### L Week 1 29/02:

### L Week 1 7/03:

