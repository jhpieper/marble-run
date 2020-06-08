// Funnel

magnet_radius = 5.5;  // Use 10x2mm magnets. 5.5 radius is good for hotgluing.  Use ~5 when just pushing magnets in.

$fn=100;

translate([0,0,40]) rotate([0,180,0])  // rotate & move for printing
difference() {
  hull() {
    cylinder(h=40, r1=11, r2=30);
    translate([0,-11,0]) cylinder(h=40, r1=11, r2=30);
  }
  difference() {
    hull() {
      cylinder(h=41, r1=9, r2=28);
      translate([0,-11,-.5]) cylinder(h=41, r1=9, r2=28);
    }
    // back wall
    translate([-40,-3.5,0]) cube(80);
  }
  // Cut the back
  translate([-40,0,-1]) cube(80);
  
  // magnets
  translate([0, 0.3, 10]) rotate(a=[90,0,0]) cylinder(h=3, r=magnet_radius);
  translate([0, 0.3, 30]) rotate(a=[90,0,0]) cylinder(h=3, r=magnet_radius);
  translate([15, 0.3, 30]) rotate(a=[90,0,0]) cylinder(h=3, r=magnet_radius);
  translate([-15, 0.3, 30]) rotate(a=[90,0,0]) cylinder(h=3, r=magnet_radius);
}