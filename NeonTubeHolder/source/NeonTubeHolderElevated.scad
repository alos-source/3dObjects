/* [Dimensions] */
// Inner Diameter in mm
DIA = 30;//[10:60]

// height in mm
HEIGHT = 08; //[06:10]

// Strength in mm
STRENGTH = 02; //[01:05]

// Leg Length in mm
LEGLENGTH = 13; //[0:60]

// Create with open base
OPEN_BASE = false;//[false:true]

// measures in mm

difference() {
    cylinder(HEIGHT,DIA/2+STRENGTH,DIA/2+STRENGTH,$fn=50);cylinder(HEIGHT,DIA/2,DIA/2,$fn=50); 
    cube([40,40,HEIGHT]);
    }//Tube Holder with opening
    
 
    
translate([DIA/2,0,0]) cube([LEGLENGTH,STRENGTH,HEIGHT]);//leg on x-axis
translate([0,DIA/2,0]) cube([STRENGTH,LEGLENGTH,HEIGHT]);//arm on y-axis
 
rotate([0,0,175])translate([-STRENGTH,DIA/2,0]) cube([STRENGTH,LEGLENGTH,HEIGHT]);//leg on y-axis
    

rotate([0,0,135])translate([-20-28,-40/2,0]) 
    difference(){
        cube([30,40,HEIGHT]);//Base
        translate([STRENGTH,STRENGTH,0])cube([30-2*STRENGTH,40-2*STRENGTH,HEIGHT]);
        rotate([0,90,0])translate([-HEIGHT/2,20,0])cylinder(h= 5, r=2, $fn=10);//Screw hole
        
        if (OPEN_BASE == true){
        translate([STRENGTH-5,STRENGTH,0])cube([30-2*STRENGTH,40-2*STRENGTH,HEIGHT]);//Open Base
        }
    }