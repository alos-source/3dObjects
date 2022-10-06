/* [Dimensions] */
// Base Length
LEN_BASE = 60; // [10:100] Base Length
// Base width
WIDTH = 80; // [40:120] Base width
// Thickness of Base and Back
THICK = 2; // [1:10] Thickness of Base and Back
// height of Back
HEIGHT = 40; // [10:80] height of Back
// Number of Steps
STEPS_NO = 5;// [2:8] Number of Steps
// Strength of Steps
STRENGTH = 2; // [1:10] Strength of Steps
// Space between Steps
STEPS_SPACE = 10;// [1:10] Space between Steps
// radius of curved corners
cornerRad = 3; // radius of curved corners

// -----------------------------
// Define Modules
// -----------------------------

module body(width, length, heigth, thickness){
difference() {
cube([width,length,thickness]);//Base
translate([width/3,0,0])cube([width/3,thickness,thickness]);//Back-Base Joint
}


rotate([0,0,90])translate([THICK,-width,thickness])
corner(heigth/6,width);//Front Corner Rounding
rotate([90,0,0])cube([width,thickness,15]);//Back Stabilizer
rotate([0,270,90])translate([thickness,-width,0])
corner(heigth/6,width);//Back Corner Rounding

translate([width/2,length,0])cylinder(  thickness, d=5);//Front Indicator

translate([0,LEN_BASE,THICK])
steps(STEPS_NO,STRENGTH,STEPS_SPACE,WIDTH);
}

module body1(width, length, heigth, thickness){
translate([width/3,0,0])cube([width/3,thickness,thickness]);//Back-Base Joint    

translate([0,0,thickness])difference() {
    cube([width,thickness,heigth]);//Back
    
    translate([width/2,0,heigth])rotate([90,0,0])scale([(WIDTH-20)/40,1.5])cylinder(  10, d=45, center=true);//Back-Cut-Out
    
    };
translate([width,0,0]);  };

module steps(number, strength, space, width){
    for (i = [0 : number-1]){
   translate([0,-(strength)-space*i,0])cube([width,strength,strength]);
    }
    }

module corner(WIDTH,DEPTH){
difference() {
cube([WIDTH, DEPTH, WIDTH]);
rotate([270,0,0])translate([WIDTH,-WIDTH,0])cylinder(DEPTH, r=WIDTH, $fn=100);
}};

// -----------------------------
// Put Components together
// -----------------------------
difference() {
body(WIDTH,LEN_BASE,HEIGHT,THICK);
translate([WIDTH/2,(LEN_BASE-15)/2,THICK])cylinder(  20, d=5, center=true);// Cut Center Hole

translate([WIDTH/2,(LEN_BASE),0])scale([(WIDTH-20)/40,1.5])cylinder(  10, d=40, center=true);//Base Cut Out Front


translate([WIDTH/2,-35,0])scale([(WIDTH)/40,1.5])cylinder(  10, d=40, center=true);//Base Cut Out Back


//translate([WIDTH+10,20,0])scale([(WIDTH)/100,1.5])sphere(r = 25);//Side Left Cut Out

//translate([-10,20,0])scale([(WIDTH)/100,1.5])sphere(r = 25);//Side Right Cut Out
    }
    
rotate([90,0,0])translate([0,0,8*THICK])body1(WIDTH,LEN_BASE,HEIGHT,THICK);
    

