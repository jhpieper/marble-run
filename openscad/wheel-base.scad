// Wheel Base (use with lock-* and wheel-*)
magnet_radius = 5.5;  // Use 10x2mm magnets. 5.5 radius is good for hotglueing.  Use ~5 when just pushing magnets in.

$fn=100;
difference() {
  union() {
    cylinder(h=4, r=20);
    cylinder(h=6, r=6);
    cylinder(h=22, r=3.2);
  }
  // center hole for lock
  translate([0,0,15]) cylinder(h=20, r=2);

  // magnets
  translate([11,0,-0.5]) cylinder(h=3, r=magnet_radius);
  translate([-5.5,10,-0.5]) cylinder(h=3, r=magnet_radius);
  translate([-5.5,-10,-0.5]) cylinder(h=3, r=magnet_radius);    
  }
