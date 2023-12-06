path = "/Users/lzb/Library/CloudStorage/OneDrive-UniversityofCambridge/Documents/IIB/Engima/enigma-iib-lzb23/c_conversion/"
with open(path + "output.txt", "r") as f:
    c_output = f.readlines()[0]

with open(path + "pyout.txt", "r") as f:
    py_out = f.readlines()[0]

with open(path + "online.txt", "r") as f:
    online_out = f.readlines()[0].upper()

if py_out == c_output:
    print("py and c match")
else:
    print("py and c dont match")

if py_out == online_out:
    print("YAY")
