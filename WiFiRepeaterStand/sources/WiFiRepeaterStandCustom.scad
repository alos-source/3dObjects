/* [Dimensions] */
// Base Length
LEN_BASE = 60;// [30:60]
// Base width
WIDTH = 60;//[40:120]
// Thickness of Base and Back
THICK = 4; //[3:6]
// height of Back
HEIGHT = 120; //[120:120]
// Enable Base
ENABLE_BASE = true; //[false:true]

// -----------------------------
// Define Modules
// -----------------------------

module frame(width,depth, height, thickness){
    difference(){
cube([width+4,depth+12,thickness]);//Base
translate([width/2+2,depth/2-8,0])cylinder(h= 10, r= 19.5);//Socket hole small
translate([width/2+2,depth/2-8,-2])cylinder(h= 4, r= 29.5);//Socket hole large
translate([width/2+2,8,0])cylinder(h= 10, r= 4);//Top hanger hole
//translate([0,depth/2-3,0])cube([30,7,thickness]); //Right cable cut out
translate([4,4,0])cube([4,1,thickness]); //Right hole
translate([width-04,4,0])cube([4,1,thickness]); //Left hole   
translate([width/2-5,depth-8,0])cube([14,16,thickness]);//Lower cable hole
    }
    
//translate([0,0-thickness,-12])difference(){
//cube([width+4,thickness,16]);//Base
//translate([width/2+2,0,0])rotate([270,0,0])cylinder(h= 10, r= (width/3));//Socket hole small
//    }
}

module stand(width,depth, height, thickness){
    difference(){
cube([width+4,depth+12,thickness]);//Base
translate([width/2+2,depth/2+10,0])cylinder(h= 10, r= 3);
translate([width/2+2,depth/2-10,0])cylinder(h= 10, r= 3);
translate([width/2+2,0,0])cylinder(h= 10, r1= 08, r2=12);
    }}



// -----------------------------
// Put Components together
// -----------------------------

if (ENABLE_BASE == true) {
translate([0,60-LEN_BASE,0])stand(WIDTH,LEN_BASE,0,THICK);

translate([0,70,5])rotate([0,90,0])cylinder(h=(WIDTH-20)/2,r=3);//Support Right 
translate([(WIDTH-20)/2,70,5])rotate([0,90,0])sphere(r=3);//Support Right 
translate([(WIDTH)/2+14,70,5])rotate([0,90,0])cylinder(h=(WIDTH-20)/2,r=3);//Support Left
translate([(WIDTH)/2+14,70,5])rotate([0,90,0])sphere(r=3);//Support Left
}
translate([0,60*0.45,HEIGHT+6])rotate([290,0,0])frame(WIDTH,HEIGHT,0,THICK);