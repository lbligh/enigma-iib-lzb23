# Lucius Bligh - Enigma IIB Project Logbook
TODO: add received src code for EnigmaHut,
## Mich

### Mich Week < 1:
- Started Python Enigma simulation 
  - Included lots of research into the mechanical and electrical function of the Enigma I

### Mich Week 1 - 5/10:
- Continued initial Python enigma simulation
- RA etc. forms completed
- Tim Meeting - 10/10
  - Discussed plan and predicted problems
- Looked at the unfinished Python simulator

### Mich Week 2 - 12/10:
- Finished the initial Python sim.
- Started investigating EnigmaHut Replica
- Tim Meeting 17/10
  - Discussed project funding
  - Discussed Bletchley Involvement

### Mich Week 3 - 19/10:
- Began reverse engineering schematics of the Replica Enigma. 
- Investigated methods to get original firmware from PIC
- Tim Meeting 24/10
  - Showed progress in reverse engineering
  - Discussed the possibility of advice and information from EnigmaHut
- Finished the first draft of the reverse-engineered EnigmaHut PCBs

### Mich Week 4 - 26/10:
- Pulled binary off PIC using PicKit and disassembled to assembly using gpdasm from gputils
- Began reverse engineering of firmware to validate RE'ed schematics
- Meeting with Anthony Barker 27/10
  - Provided lots of info r.e. the history and process of the EngimaHut Replica
  - Provided an extra replica to work on
  - Provided drawings of the mechanical parts of the machine
  - Offered to get in touch with the company that had written the original firmware etc. 
- Tim Meeting 31/10
  - Decided to focus on getting a working product initially and move on to Rotor Positioning and Stecker Detection later on.
  - End up with a replacement Control PCB w/ MCU ASAP.
  - Importance of planning chart
  - First P&I meeting

### Mich Week 5 - 2/11:
- Received P&I Feedback (A)
- Updated planning Gantt chart.
- Began prototyping parts of new lamp system with an EIETL Arduino and old hardware
- Received from Tony information on the company that wrote the source code, and details on how to contact.
- Received drawings from Tony
- Started converting Python sim to C.

### Mich Week 6 - 9/11:
- Finished conversion of Python Enigma Sim to C for future conversion to Arduino or another system.
- Started converting C code to Arduino - so strings can be encoded and displayed on the lamp board with the correct encoding.
- Continued updating schematics for future use
- Tim Meeting 13/11
  - Discussed Oral presentation.
- Lots of work on Oral presentation

### Mich Week 7 - 16/11:
- Oral Presentation 17/11
- Lots of work on Arduino source code - finishing lamp board and building structure for keyboard
  - Updated to use I2C IO expander instead of Arduino GPIO
- Received the original source code from SDF Electronics

### Mich Week 8 - 23/11:
- Tim Meeting 23/11
  - Discussed and demonstrated Arduino progress - displaying encodings of strings on the lamp board using old hardware + Arduino and IO expander.
  - Switch-board still not working

- Lots and lots of work on Arduino source

## Christmas Vac
- Tim Meeting 1/12:
  - P&I Meeting
  - Discussion of work over Christmas:
    - Plan rotor and plugboard
    - Do schematic and PCB for the old system
- Arduino Source now working with the keyboard
  - Given an initial (hard-coded) rotor settings and position, can encode key press to light - including edge case behavior
- Got the breadboarded prototype encoding key presses and turning lamps on/off.
- Wrote tool to create dxfs from .drl files (drl2dxf)
- Designed a new control board PCB
- Ordered and received control board PCB
- Received P&I remarks.
- Started investigating Rotor Position Detection again
  - Options:
    - Resistive 
    - Inductive
    - Magnetic
    - Visual
  - Ordered a softpot to test
  - Discussion with Cambridge Sensors re an inductive solution
- Methods for Stecker Detection
  - 2 new plans: either:
    - Use standard plugs and wires
    - Use 4 8-bit shift registers to shift a LOW signal to each small plug hole in turn (leaving the rest high)
    - For each low letter: 
      - Use 2 IO expanders to read all of the top plug holes (which are input pulled up) and see if any are low
      - If low therefore that is the connection
  - Or:
    - Use 1-to-1 plugs and wires - either top or bottom plug
    - Again 2 IO expanders
    - set 1 letter to output and low - the rest pulled-up inputs, then test the rest to see if they are low or not
    - repeat for all letters.
- Written Technical Milestone Report - submitted 17/01/24
  
## Lent
### L Week 1 18/01:
- Built up cont. board PCB
  - Found error in the schematic - keyboard MCP23017 reset tied to GND
  - corrected schematic
  - bodge fix on PCB
- Cont. board tested 
- Tony's replica dismantled 
  - Found diff cont board - 6.5V lamps - dimmable
- Started prototyping plugboard
  - Laser-cut an MDF plate with binding post holes
  - wrote test code for the first 8 letters on MCP23017.
- Met Tim 23/01
  - Demoed new control board all working in Tony's replica
### L Week 2 25/01:
- Completed MDF prototype of plugboard 
  - Initially could detect the whole plugboard in 240ms
  - Changed I2C clock to 400 kHz
  - Changed to bitwise logic instead of string method to decrease overhead
- CAD model of plugboard fascia
- Schematic of Plugboard system drawn
- Tim meeting 30/01 
  - Decided to focus on rotary-encoder style relative-rotor-position detection
  - Discussed a new turnover mechanism allowing for the simulation of other rotors
- Started PCB design for plugboard

### L Week 3 1/02:
- Continued the plugboard PCB design
  - Nut OD 11.38mm, radius 5.69
  - Bolt OD 7.938, radius 3.969~4
  - Move everything down 2mm to fit the nuts in
- Finished PCB design and ordered to be manufactured
- Tim meeting 06/02 
  - Postponed due to illness
 
### L Week 4 8/02:
- Tim Meeting 08/02
  - Discussed work on the plugboard
  - Discussed plan for rotor work
- Created CAD model of rotor for testbed
- Investigated methods of reading rotary encoders
- Settled on ATTiny per rotor, acting as I2C slave to send rotor positions
- Parts for the testbed were ordered as well as for plugboard pcb.
- Began to implement plugboard code into the main codebase
- Tim Meeting 14/02
  - Discussed progress on plugboard and rotors
  - Lent P&I - all happy

### L Week 5 15/02:
- Finished addition of plugboard code to the main code base - option to enable/disable with preprocessor #define statement.
- Added documentation for all functions in functions.ino 
- Some refactoring of code
- Tested rotary encoder I2C Slave on ATTiny85 -> could send data fine to Arduino Uno. (first rotor testbed)
- Tim Meeting 20/02
  - Discussed work on the first rotor testbed
  - Discussed plan to integrate rotor rotary encoders as non-intrusively as possible - subject to approval from Anthony
  - Plan for next week to discuss Final Report structure - need to draft the sub/sub-sub/section headings and content for 27/02. 
- first testing using rotor thumbwheel and switches as encoder
- Designed and ordered I2C Slave breakout boards for rotors
### L Week 6 22/02:
- Got rotor testbed working - though still occaisionally double counting or skipping
- Began Planning final report
  - See separate doc
- Tim Meeting 27/02
  - Discussed Final Report Plan
  

### L Week 1 29/02:

### L Week 1 7/03:

