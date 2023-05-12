/* [Dimensions] */
// Batteries Measures of 34x14x42 mm for GoPro10
// Battery depth
BATDEPTH = 14;// [10:20]
// Battery width
WIDTH = 34;//[10:60]
// Thickness of walls
THICK = 1; //[1:4]
// height of top/bottom
HEIGHT = 40; //[20:50]
// Number of batteries
BATTERY_NO = 3;//[1:8]

// Create TOP
CREATE_TOP = true;//[false:true]
// Create Bottom
CREATE_BOTTOM = true;//[false:true]

// -----------------------------
// Define Modules
// -----------------------------

module body(width, length, heigth, thickness){
difference() {
cube([width,length,heigth]);//Base
//translate([0,01,0])
    


//translate([THICK,THICK,THICK])cube([34,14,42]);
//translate([THICK,THICK+16,THICK])cube([34,14,42]);
//translate([THICK,THICK+16+16,THICK])cube([34,14,42]);

//Middle Cut Out
translate([width/2,(length/2),heigth])scale([01,1.2])rotate([90,0,0])cylinder(  length/1.5, d=width*0.8, center=true);
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

// Top Part
if (CREATE_TOP == true){
difference() {
body(WIDTH+4*THICK,4*THICK+BATTERY_NO*(BATDEPTH+THICK),HEIGHT,THICK);

// Batteries Measures of 34x14x42 mm for GoPro10
translate([THICK,THICK*1.5,0])batterys(BATTERY_NO, THICK, WIDTH,BATDEPTH,42);    

// Outer-Joint    
translate([THICK*0.5,THICK*1.0,HEIGHT/4])cube([WIDTH+THICK*3,THICK*2+BATTERY_NO*(BATDEPTH+THICK),HEIGHT-THICK]);
    }
}

// Buttom Part
if (CREATE_BOTTOM == true){

translate([WIDTH+30,(0),0])difference() {
body(WIDTH+2*THICK,THICK+BATTERY_NO*(BATDEPTH+THICK),HEIGHT*4/5,THICK);

// Batteries Measures of 34x14x42 mm for GoPro10
batterys(BATTERY_NO, THICK, WIDTH,BATDEPTH,HEIGHT);    

}
   }
