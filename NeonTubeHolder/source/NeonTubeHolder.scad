/* [Dimensions] */
// Inner Diameter in mm
DIA = 30;//[10:60]

// height in mm
HEIGHT = 08; //[02:10]

// Strength in mm
STRENGTH = 02; //[01:05]

// Leg Length in mm
LEGLENGTH = 13; //[0:60]


// measures in mm

difference() {
    cylinder(HEIGHT,DIA/2+STRENGTH,DIA/2+STRENGTH);cylinder(HEIGHT,DIA/2,DIA/2); 
    cube([40,40,HEIGHT]);
    }
    
 
translate([DIA/2,0,0]) cube([LEGLENGTH,STRENGTH,HEIGHT]);
translate([0,DIA/2,0]) cube([STRENGTH,LEGLENGTH,HEIGHT]);
 
rotate([0,0,175])translate([-STRENGTH,DIA/2,0]) cube([STRENGTH,LEGLENGTH,HEIGHT]);
    

rotate([0,0,135])translate([-20,-40/2,0]) cube([STRENGTH,40,HEIGHT]);
    