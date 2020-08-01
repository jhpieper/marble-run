magnet_radius = 5.5;  // Use 10x2mm magnets. 5.5 radius is good for hotglueing.  Use ~5 when just pushing magnets in.

$fn=100;
length=60;

rotate(a=[0,90,0])  // rotate for printing (magnet side down).
difference() {
  union() {
    difference() {
      union() {
        // Basic shape is just a cylinder and cube
        cylinder(r=11, h=length);
        translate([0,-11,0]) cube([11,15,length]);
      }
      // Carve inner trail
      translate([0,0,-1])cylinder(r=9, h=length+2);
      // Remove upper parts of the cylinder tube
      translate([-11,-3,-1]) cube([12,25,length+2]);
      translate([0,4,-1]) cube([11,25,length+2]);
      translate([0,0,-1]) cube([9,25,length+2]);
    }
  
    // Add the divider wedge to the center of the track
    translate([-10.6,-11,20]) {
      // Hull is needed to make the poly solid
      hull() polyhedron( points = [ [0,0,0], [21.6,0,0], [0,30,10], [21.6,30,10], [0,0,20], [21.6,0,20] ], faces = [ [0,1,3,2], [2,3,5,4], [0,1,5,4], [0,2,4], [1,3,5] ], convexity = 10); 
    }
  }
  // Center hole
  translate([-12,-5,30]) rotate([0,90,0]) cylinder(h=25, r=3.6);
}
  
