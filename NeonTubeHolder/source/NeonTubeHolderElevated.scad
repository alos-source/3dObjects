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
    }//Tube Holder with opening
    
 
    
translate([DIA/2,0,0]) cube([LEGLENGTH,STRENGTH,HEIGHT]);//leg on x-axis
translate([0,DIA/2,0]) cube([STRENGTH,LEGLENGTH,HEIGHT]);//arm on y-axis
 
rotate([0,0,175])translate([-STRENGTH,DIA/2,0]) cube([STRENGTH,LEGLENGTH,HEIGHT]);//leg on y-axis
    

rotate([0,0,135])translate([-20-28,-40/2,0]) 
    difference(){
        cube([30,40,HEIGHT]);//Base
        translate([STRENGTH,STRENGTH,0])cube([30-2*STRENGTH,40-2*STRENGTH,HEIGHT]);
    }