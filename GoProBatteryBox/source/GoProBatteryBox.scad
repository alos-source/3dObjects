/* [Dimensions] */
// Base Length
LEN_BASE = 50;// [20:60]
// Base width
WIDTH = 38;//[20:120]
// Thickness of Base and Back
THICK = 2; //[1:4]
// height of Back
HEIGHT = 25; //[20:60]
// Number of Steps
BATTERY_NO = 3;//[1:8]

// -----------------------------
// Define Modules
// -----------------------------

module body(width, length, heigth, thickness){
difference() {
cube([width,length,heigth]);//Base


batterys(BATTERY_NO, THICK, 34,14,42);    
//translate([THICK,THICK,THICK])cube([34,14,42]);
//translate([THICK,THICK+16,THICK])cube([34,14,42]);
//translate([THICK,THICK+16+16,THICK])cube([34,14,42]);
    
    }

}

module batterys(number, thick, width, depth, height){
    for (i = [0 : number-1]){
        translate([thick,thick+(i*(thick+depth)),thick])cube([width,depth,height]);
        }
    }

// -----------------------------
// Put Components together
// -----------------------------
// Buttom Part
difference() {
body(WIDTH,LEN_BASE,HEIGHT,THICK);
//Middle Cut Out
translate([WIDTH/2,(25),HEIGHT])scale([01,1.2])rotate([90,0,0])cylinder(  20, d=LEN_BASE*0.66, center=true);
// Outer-Joint    
translate([01,01,HEIGHT/4])cube([WIDTH-THICK,LEN_BASE-THICK,HEIGHT-THICK]);
    }

// Top Part
translate([WIDTH+30,(0),0])difference() {
body(WIDTH-1,LEN_BASE-1,HEIGHT,THICK);

//Middle Cut Out
translate([WIDTH/2,(25),HEIGHT])scale([01,1.2])rotate([90,0,0])cylinder(  20, d=LEN_BASE*0.66, center=true);



    }
