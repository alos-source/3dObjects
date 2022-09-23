//Socket
difference() {
cube([120,30,40], center = false);
translate([60,80,0])cylinder(50, r=60, $fn=100);
};

//End
translate([0,0,040])cube([120,2,4]);

//Ground
translate([0,30,0])cube([10,60,5]);
translate([110,30,0])cube([10,60,5]);

//Back

translate([0,15,040])
rotate(-45,[1,0,0])
difference() {
cube([120,4,60]);
rotate(45,[1,0,0])translate([60,40,0])cylinder(50, r=40, $fn=100);
};
//Support
difference() {
translate([0,20,040])cube([120,10,5]);
translate([60,80,0])cylinder(50, r=65, $fn=100);
};