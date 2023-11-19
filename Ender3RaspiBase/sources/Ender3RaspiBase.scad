/* [Dimensions] */
// Base Length
LEN_BASE = 50;// [30:60]
// Base width
WIDTH = 40;//[20:120]
// Thickness of Base and Back
THICK = 2; //[2:4]
SIZE=20; //[20:30]

// -----------------------------
// Define Modules
// -----------------------------

module holder(width,depth,size, thickness){
    translate([0,0,-thickness])cube([width,size+2*thickness,thickness]);
    translate([0,1,0])rotate([0,90,0])cylinder(h=width, r= 1, $fn = 20);
    translate([0,1,size])rotate([0,90,0])cylinder(h=width, r= 1, $fn = 20);
    translate([0,size+thickness,size])rotate([0,90,0])cylinder(h=width, r= 1, $fn = 20);
    translate([0,size+thickness,0])rotate([0,90,0])cylinder(h=width, r= 1, $fn = 20);
    translate([0,0,size])cube([width,depth,thickness]);
    translate([0,size+thickness,0])cube([width,thickness,size]);
    translate([0,0,size])cube([width,thickness,size]);
    translate([0,(size+thickness)/2,size])rotate([0,90,0])cylinder(h=width, r= 2, $fn = 25);
    translate([0,size+2*thickness,size])rotate([0,90,0])cylinder(h=width, r= 2, $fn = 25);
    }


// -----------------------------
// Put Components together
// -----------------------------


translate([0,0,0])holder(WIDTH,LEN_BASE,SIZE,THICK);

