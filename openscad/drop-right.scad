length=50;  // Good sizes: 50, 110, 200 (in general: 5 + N*30).
magnet_radius = 5.5;  // Use 10x2mm magnets. 5.5 radius is good for hotgluing.  Use ~5 when just pushing magnets in.

$fn=100;
rotate(a=[0,90,0]) { // rotate for printing (magnet side down).
  difference() {
    union() {
      // Basic shape is just a cylinder and cube
      cylinder(r=11, h=length);
      translate([0,-11,0]) cube([12.5,15,length]);
    }
    // Carve inner trail
    translate([0,0,-4])cylinder(r=9, h=length+2);
    // Remove upper parts of the cylinder tube
    translate([-11,-3,-4]) cube([12,25,length+2]);
    translate([0,4,-1]) cube([11,25,length+2]);
    translate([-11,0,-1]) cube([20,25,length+2]);
    
    // drop hole
    translate([0,0,38]) rotate([90,0,0]) cylinder(h=20, r=9);

    // Magnet holes
    for (pos = [10:30:length]) {
      translate([9.8, -3.5, pos]) rotate(a=[0,90,0]) cylinder(h=3, r=magnet_radius);
    }
}
}
