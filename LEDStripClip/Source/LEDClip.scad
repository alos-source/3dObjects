/* [Dimensions] */
// Inner Diameter in mm
DIA = 30;//[10:60]

// height in mm
HEIGHT = 10; //[06:12]

// width in mm
WIDTH = 10; //[06:16]

// depth in mm
DEPTH= 18; //[03:22]

// Strength in mm
STRENGTH = 01; //[01:05]

// Create with open base
OPEN_BASE = false;//[false:true]

// measures in mm


    difference(){
        cube([DEPTH,WIDTH,HEIGHT]);//Base
        
        translate([STRENGTH,STRENGTH,0])cube([DEPTH*0.7-2*STRENGTH,WIDTH-2*STRENGTH,HEIGHT]);//upper cutout
        
        translate([STRENGTH+DEPTH*0.7,STRENGTH,0])cube([DEPTH*0.3-2*STRENGTH,WIDTH-2*STRENGTH,HEIGHT]);//lower cutout

//        translate([DEPTH*0.6-STRENGTH,(WIDTH-2*STRENGTH)/2,0])cube([0.3,2,HEIGHT]);//fixing notch
        
        translate([STRENGTH+DEPTH*0.7,STRENGTH,0])cube([DEPTH*0.3-2-2*STRENGTH*1.3,WIDTH-1*STRENGTH,HEIGHT]);//opening


                
        
        rotate([0,90,0])translate([-HEIGHT/2,WIDTH*0.5,0])cylinder(h= 5, r=2, $fn=10);//Screw hole
        
        if (OPEN_BASE == true){
        translate([STRENGTH-5,STRENGTH,0])cube([30-2*STRENGTH,WIDTH-2*STRENGTH,HEIGHT]);//Open Base
        }
    }
    
            translate([STRENGTH+DEPTH*0.7,WIDTH*0.5,0])cylinder(h=HEIGHT, r=WIDTH/8, $fn=10);//retaining
