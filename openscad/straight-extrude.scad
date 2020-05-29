length=140;  // Good sizes: 50, 110, 140, 200 (in general: 50 + N*30).
magnet_radius = 5.5;  // Use 10x2mm magnets. 5.5 radius is good for hotgluing.  Use ~5 when just pushing magnets in.

$fn=100;
rotate(a=[90,90,0]) {
  difference (){
    linear_extrude(height = length, center = false, convexity = 10, slices = 20, scale = 1.0) {
      difference() {
        union() {
          circle(11);
          translate([0,-11,0]) square(10);
        }
        circle(9);
        translate([-11,-3,0]) square(10);
        translate([-10,0,0]) square(22);
      }
      translate([9,-11,0]) square([3.5,15],0);
    }
    // magnets
    for (pos = [10:30:length]) {
      translate([9.8, -3.5, pos]) rotate(a=[0,90,0]) cylinder(h=3, r=magnet_radius);
    }
  }
}