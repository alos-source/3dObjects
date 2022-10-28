/* [Dimensions] */
// Base Length
LEN_BASE = 60;// [20:60]
// Base width
WIDTH = 80;//[40:120]
// Thickness of Base and Back
THICK = 2; //[1:4]
// height of Back
HEIGHT = 40; //[20:80]
// Number of Steps
STEPS_NO = 5;//[1:8]
// Strength of Steps
STRENGTH = 2; //[1:5]
// Space between Steps
STEPS_SPACE = 10;//[2:10]
// radius of curved corners
cornerRad = 3; //radius of curved corners

// -----------------------------
// Define Modules
// -----------------------------

module body(width, length, heigth, thickness){
difference() {
cube([width,length,thickness]);//Base

}

difference() {
    cube([width,thickness,heigth]);//Back
    translate([width/2,0,heigth])rotate([90,0,0])scale([(WIDTH-20)/40,width/60*(heigth/40)])cylinder(  10, d=45, center=true);//Back-Cut-Out
    
    };
rotate([0,0,90])translate([THICK,-width,thickness])
corner(heigth/10,width);//Front Corner Rounding
cube([width,thickness,heigth/6]);
rotate([90,0,0])cube([width,thickness,20]);//Back Stabilizer
rotate([0,270,90])translate([thickness,-width,0])
corner(heigth/10,width);//Back Corner Rounding

translate([width/2,length,0])cylinder(  thickness, d=5);//Front Indicator

translate([0,LEN_BASE,THICK])
steps(STEPS_NO,STRENGTH,STEPS_SPACE,WIDTH);

translate([width-4,-20,0])//Back left
difference() { //Back support
    cube([4,20,heigth]);
    translate([0,-heigth*1.6+20,heigth])rotate([0,90,0])scale([1,1])cylinder(  heigth, d=(3.2*heigth), center=true);//Back-Cut-Out
    
    };

translate([0,-20,0])//Back right
difference() { //Back support
    cube([4,20,heigth]);
    translate([0,-heigth*1.6+20,heigth])rotate([0,90,0])scale([(1),1])cylinder(  heigth, d=(3.2*heigth), center=true);//Back-Cut-Out
    
    };

}


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

translate([WIDTH/2,(LEN_BASE),0])scale([(WIDTH-20)/40,1.5])cylinder(  20, d=LEN_BASE*0.66, center=true);//Base Cut Out Front


translate([WIDTH/2,-35,0])scale([(WIDTH)/40,1.5])cylinder(  20, d=40, center=true);//Base Cut Out Back
    
translate([WIDTH+10,20,0])scale([(WIDTH)/100,1.5])sphere(r = 25);//Side Left Cut Out

translate([-10,20,0])scale([(WIDTH)/100,1.5])sphere(r = 25);//Side Right Cut Out
    }
    

