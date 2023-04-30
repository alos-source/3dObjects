/* [Dimensions] */
// Inner Diameter in mm
DIA = 30;//[10:60]

// height in mm
HEIGHT = 03; //[02:10]

// Strength in mm
STRENGTH = 02; //[01:05]

// Leg Length in mm
LEGLENGTH = 25; //[0:60]

// Top Length in mm
TOPLENGTH = 12; //[0:60]

// measures in mm

difference() {
    cylinder(HEIGHT,DIA/2+STRENGTH,DIA/2+STRENGTH);cylinder(HEIGHT,DIA/2,DIA/2); 
    cube([40,40,HEIGHT]);
    }
    
 
translate([DIA/2,0,0]) cube([LEGLENGTH,STRENGTH,HEIGHT]);
translate([0,DIA/2,0]) cube([STRENGTH,LEGLENGTH,HEIGHT]);
 
rotate(130,90,0)translate([-STRENGTH/2,DIA/2,0]) cube([STRENGTH,TOPLENGTH,HEIGHT]);
    

    