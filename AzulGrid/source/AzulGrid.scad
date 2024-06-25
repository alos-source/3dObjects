/* [Dimensions] */
// Measures of 116x116 mm for Azul tile board
// Measure of single tile 19x19 mm

// Width
WIDTH = 103;//[100:110]
// Thickness of walls
THICK = 1; //[1:4]
// height of top/bottom
HEIGHT = 02; //[01:05]


difference() {

cube([WIDTH,WIDTH,HEIGHT]); //create cube as hull for grid
 
    for ( y = [0:1:10]) {
    for ( i = [0:1:10]) {
    translate([THICK+i*20.5,THICK+y*20.5,0])cube([20-THICK,20-THICK,10]); //substract cubes from hull
        
    //translate([11,10,2])sphere(d=20); 
}
}
}

