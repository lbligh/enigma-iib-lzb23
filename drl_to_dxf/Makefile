cont_board := ../Schematics/cont_board/manufacturing/cont_board.drl
lmp_board := ../Schematics/lmp_board/manufacturing/lmp_board.drl

all: cont_board.dxf lmp_board.dxf

cont_board.dxf: $(cont_board) drl2dxf.py
	python3 drl2dxf.py $(cont_board) -o cont_board.dxf -b -W 238 -H 67 -R 2 -m 1.0

lmp_board.dxf: $(lmp_board) drl2dxf.py
	python3 drl2dxf.py $(lmp_board) -o lmp_board.dxf -b -W 238 -H 67 -R 2 -m 1.0
