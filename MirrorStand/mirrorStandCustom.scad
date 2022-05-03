/* [Dimensions] */
// Base Length
LEN_BASE = 60; // [10:100] Base Length
// Base width
WIDTH = 60; // [10:100] Base width
// Thickness of Base and Back
THICK = 3; // [1:10] Thickness of Base and Back
// height of Back
HEIGHT = 40; // [10:80] height of Back
// Number of Steps
STEPS_NO = 5;// [2:8] Number of Steps
// Strength of Steps
STRENGTH = 1; // [1:10] Strength of Steps
// Space between Steps
STEPS_SPACE = 10;// [1:10] Space between Steps
// radius of curved corners
cornerRad = 3; // radius of curved corners

module body(width, length, heigth, thickness){
cube([width,length,thickness]);
cube([width,thickness,heigth]);
}


module steps(number, strength, space, width){
    for (i = [0 : number-1]){
   translate([0,-(strength)-space*i,0])cube([width,strength,strength]);
    }
    }


//for (i = [0 : STEPS_NO-1]){
//translate([0,LEN_BASE-(STRENGTH)-STEPS_SPACE*i,THICK])cube([WIDTH,STRENGTH,STRENGTH]);
//}

//translate([0,50,THICK])cube([WIDTH,STRENGTH,STRENGTH]);
//translate([0,40,THICK])cube([WIDTH,STRENGTH,STRENGTH]);
//translate([0,30,THICK])cube([WIDTH,STRENGTH,STRENGTH]);
//translate([0,20,THICK])cube([WIDTH,STRENGTH,STRENGTH]);

body(WIDTH,LEN_BASE,HEIGHT,THICK);
translate([0,LEN_BASE,THICK])
steps(STEPS_NO,STRENGTH,STEPS_SPACE,WIDTH);