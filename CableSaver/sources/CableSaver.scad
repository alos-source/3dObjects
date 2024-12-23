/* [Dimensions] */
// Measure of a H05-Cable between 7 to 9mm

// Cable Width
CWIDTH = 10;//[6:12]
// Gap of wall
GAP = 9; //[5:15]
// height of top/bottom
HEIGHT = 20; //[10:50]

// Gap 1
difference(){
cube([GAP,4,HEIGHT]);
translate([04,0,HEIGHT/2])cube([1,2*CWIDTH+8,2]);
}

// Connector
difference(){
translate([0,-0,0])cube([12+GAP,2*CWIDTH+8,3]);
translate([0,CWIDTH+4,0])scale([1.4,1,1])cylinder(h= 50, r=CWIDTH);};

// Guiding Rails
translate([2,4,0])cylinder($fn = 10,h= HEIGHT, r=(CWIDTH/5));
translate([2,2*CWIDTH+4,0])cylinder($fn = 10,h= HEIGHT, r=(CWIDTH/5));
translate([GAP-2,4,0])cylinder($fn = 10,h= HEIGHT, r=(CWIDTH/5));
translate([GAP-2,2*CWIDTH+4,0])cylinder($fn = 10,h= HEIGHT, r=(CWIDTH/5));

translate([1.4*CWIDTH,CWIDTH+4,0])cylinder($fn = 10,h= (HEIGHT/2+4), r=(CWIDTH/5));

// Gap 2
translate([0,2*CWIDTH+4,0])cube([GAP,4,HEIGHT]);