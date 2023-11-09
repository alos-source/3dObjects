/* [Dimensions] */
// Base Length
LEN_BASE = 60;// [20:60]
// Base width
WIDTH = 80;//[40:120]
// Thickness of Base and Back
THICK = 2; //[1:4]
// height of Back
HEIGHT = 40; //[30:60]
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

module frame(width,depth, height, thickness){
    difference(){
cube([width+4,depth+12,thickness]);//Base
translate([2,4,0])cube([width,depth,thickness]);
translate([2,2,0])cube([4,1,thickness]); //Right whole
translate([width-02,2,0])cube([4,1,thickness]); //Left whole   
     
    }
translate([2,depth+4,0])    
cube([8,8,40]);
    
translate([width-6,depth+4,0])    
cube([8,8,40]);
}



module housing(width,depth, height, thickness){
cube([width,depth,thickness]);//Base
translate([0,0,height])cube([width,depth,thickness]);//Top
cube([thickness,depth,height]);//Wall left
    translate([width,0,0])
    difference() {
    cube([thickness,depth,height]);//Wall right
    translate([00,20,30])rotate([0,90,0])cylinder(h=thickness*2,d=20);
};

cube([width,thickness,height]);//Back

}

module mirror(width, length, heigth, thickness){
        cube([width,length,thickness]);//Base
}

module base(width, length, heigth, thickness){
    
    difference(){
        cube([width,length,thickness*3]);//Base
        translate([thickness,thickness,thickness])mirror(width, length, heigth, thickness);
        
        };    
    
}

module bar(width, length, thickness){
    
    cube([thickness,length, thickness*3]);
    difference(){
    cube([thickness*3,thickness*3,thickness*3]);
        translate([0,thickness*2, 0])
        cube([thickness*2,thickness*2,thickness*3]);
    }
    translate([0,length-thickness*3, 0])
    difference(){
    cube([thickness*3,thickness*3,thickness*3]);
        translate([0,-thickness, 0])
        cube([thickness*2,thickness*2,thickness*3]);
        translate([0-2,thickness, 0])cube([1,1,thickness*3]);
    }
}

module body(width, length, heigth, thickness){
difference() {
cube([width*2^0.5,length*2^0.5,thickness]);//Base

}

difference() {
    cube([width,thickness,heigth]);//Back
    translate([width/2,0,heigth])rotate([90,0,0])scale([(width-20)/40,width/60*(heigth/40)])cylinder(  10, d=45, center=true);//Back-Cut-Out
    
    };
rotate([0,0,90])translate([thickness,-width,thickness])
corner(heigth/10,width);//Front Corner Rounding
cube([width,thickness,heigth/6]);// Fill the gap bewteen roundings on base
rotate([90,0,0])cube([width,thickness,heigth/2+5]);//Back Stabilizer
rotate([0,270,90])translate([thickness,-width,0])
corner(heigth/10,width);//Back Corner Rounding

translate([width/2,length,0])cylinder(  thickness, d=5);//Front Indicator

translate([0,length,thickness])
steps(STEPS_NO,STRENGTH,STEPS_SPACE,width);

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

module corner(width,depth){
difference() {
cube([width, depth, width]);
rotate([270,0,0])translate([width,-width,0])cylinder(depth, r=width, $fn=100);
}};

// -----------------------------
// Put Components together
// -----------------------------

// housing(400,400,400,5);

frame(81,81,40,1);