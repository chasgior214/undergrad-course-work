(https://ncviewer.com/)

(=====================================================)
(manual part)
(=====================================================)

(first step: zero x and y using edge finder at 1000 rpm)
(remember to offset 0.1" for the radius of the edge finder)

(stop spindle, put tool in, and zero z using paper/shim method)
(set up the z zero for each tool)

(once zeroed, lift tool a bit, and begin the program)

(=====================================================)
(start program)
(=====================================================)

G54 (coordinate system)
G90 (absolute mode)
G20 (inch mode)
G40 (cancel cutter compensation)

(=====================================================)
(outer profile)
(=====================================================)

M06 T1 (set to tool 1, 1/4" cutter for outside profile)
G00 X-0.75 Y0 Z1 (quickly move tool to just above where it will start)
M03 S3000 (turn on spindle clockwise at 3000 rpm for cutting the outer profile)
G01 X-0.25 Y0 Z0 F10

(lower tool, start cutting the outer profile)
G01 X0.875 Z-0.1 (move tool down 0.1" at 10 ipm, ramping into material)
G02 X1.25 Y-0.375 R0.375
G01 Y-1.625
G02 X0 Y-1.625 R0.625
G01 Y-0.3750
G02 X0.375 Y0 R0.375

G01 X0.875 Z-0.2
G02 X1.25 Y-0.375 R0.375
G01 Y-1.625
G02 X0 Y-1.625 R0.625
G01 Y-0.3750
G02 X0.375 Y0 R0.375

G01 X0.875 Z-0.3
G02 X1.25 Y-0.375 R0.375
G01 Y-1.625
G02 X0 Y-1.625 R0.625
G01 Y-0.3750
G02 X0.375 Y0 R0.375

(cuts through material left from ramp)
G01 X0.875

(return to home for tool change)
G01 Z0.1
G00 Z2 (move tool up to 2" (rapid))
G28 (return to home)
M05 (turn off spindle)


(=====================================================)
(cut the leaf)
(=====================================================)

(perform tool change to tool 2, 1/16" cutter for cutting the leaf)

M06 T2 (set to tool 2)
G00 X0.6250 Y-0.9084 Z1 (quickly move tool to just above where it will start)
(4000 rpm for the inside profiles)
M03 S4000 (turn on spindle clockwise at 4000 rpm)

(lower tool, start cutting the leaf)
G01 Z-0.015 F5 (move tool down 0.015" at 10 ipm)

(right half)
G01 X0.6679 Y-1.0369 F8
G01 X0.7231 Y-1.0023
G01 X0.6952 Y-1.3442
G01 X0.8007 Y-1.1372
G01 X0.8059 Y-1.1988
G01 X0.9198 Y-1.1408
G01 X0.8618 Y-1.2546
G01 X0.9233 Y-1.2598
G01 X0.7295 Y-1.3586
G01 X0.7746 Y-1.4279
G01 X0.6595 Y-1.4130
G01 X0.6672 Y-1.5181
G01 X0.5832

(left half)
G01 X0.5832 Y-1.4130
G01 X0.4754 Y-1.4279
G01 X0.5205 Y-1.3586
G01 X0.3267 Y-1.2598
G01 X0.3882 Y-1.2546
G01 X0.3302 Y-1.1408
G01 X0.4441 Y-1.1988
G01 X0.4493 Y-1.1372
G01 X0.5548 Y-1.3442
G01 X0.5269 Y-1.0023
G01 X0.5821 Y-1.0369
G01 X0.6250 Y-0.9084

(islands)
G01 Y-1.006
G01 X0.6254
G01 X0.6869 Y-1.0618
G01 Y-1.3756
G01 Y-1.0618
G01 X0.6254 Y-1.006
G01 X0.5631 Y-1.0618
G01 Y-1.3756
G01 X0.5631 Y-1.0618
G01 X0.6254 Y-1.006
G01 Y-1.3756
G01 Y-1.4868
G01 Y-1.3756
G01 X0.7033
G01 X0.8483 Y-1.2123
G01 X0.7033 Y-1.3756
G01 X0.5467
G01 X0.4017 Y-1.2123

(return to home for tool change)
G01 Z1
G28 (return to home)
M05 (turn off spindle)


(=====================================================)
(drill the through hole)
(=====================================================)

(perform tool change to tool 3, 1/8" drill bit for both holes)

M06 T3 (set to tool 3)
G00 X0.375 Y-0.6733 Z1 (quickly move tool to just above the through hole)
(4000 rpm for the holes)
M03 S4000 (turn on spindle clockwise at 4000 rpm)

(lower tool, start drilling)
G01 Z-0.1 F5
G01 Z1 (lift drill out of piece)

G01 Z-0.2 
G01 Z1 (lift drill out of piece)

G01 Z-0.3
G01 Z1 (lift drill out of piece)

(=====================================================)
(drill the blind hole)
(=====================================================)

G00 X0.875 Y-0.6733 Z1 (quickly move tool to just above the through hole)

(lower tool, start drilling)
G01 Z-0.08
G01 Z1 (lift drill out of piece)

G01 Z-0.1375
G01 Z1 (lift drill out of piece)

G28 (return to home)
M05 (turn off spindle)

(=====================================================)
(cut key ring loop)
(=====================================================)

(perform tool change to tool 4, 1/8" cutter on the slot)
M06 T4 (set to tool 4)

G00 X0.3750 Y-0.3750 Z1
(4000 rpm for the holes)
M03 S4000 (turn on spindle clockwise at 4000 rpm)

(first pass)
G01 Z-0.1 F5
G01 X0.8875 Y-0.3750 F10
G03 X0.8750 Y-0.3625 R0.0125
G01 X0.3750
G03 X0.3750 Y-0.3875 R0.0125
G01 X0.8750 Y-0.3875
G03 X0.8875 Y-0.3750 R0.0125
G01 Z1

(second pass)
G00 X0.3750 Y-0.3750
G01 Z-0.2 F5
G01 X0.8875 Y-0.3750 F10
G03 X0.8750 Y-0.3625 R0.0125
G01 X0.3750
G03 X0.3750 Y-0.3875 R0.0125
G01 X0.8750 Y-0.3875
G03 X0.8875 Y-0.3750 R0.0125
G01 Z1

(third pass)
G00 X0.3750 Y-0.3750
G01 Z-0.3 F5
G01 X0.8875 Y-0.3750 F10
G03 X0.8750 Y-0.3625 R0.0125
G01 X0.3750
G03 X0.3750 Y-0.3875 R0.0125
G01 X0.8750 Y-0.3875
G03 X0.8875 Y-0.3750 R0.0125
G01 Z1

(=====================================================)
(end the program)
(=====================================================)

M05 (turn off spindle)
G28 (return to home)

M30 (end program)