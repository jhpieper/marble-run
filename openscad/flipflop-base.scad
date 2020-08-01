// Wheel Base (use with lock-* and wheel-*)
magnet_radius = 5.5;  // Use 10x2mm magnets. 5.5 radius is good for hotglueing.  Use ~5 when just pushing magnets in.

$fn=100;
difference() {
  union() {
    // bottom circle
    cylinder(h=3.3, r=12);
    // spacer
    cylinder(h=4, r=6);
    // pole
    cylinder(h=27.2, r=3.2);
    // bottom plate
    translate([-12,0,0]) cube([24,38,3.3]);
    // top entry
    translate([-12,24,0]) cube([24,14,16]);
    translate([0,24,16]) rotate([-90,0,0]) cylinder(h=14, r=12);
  }
  // drop hole
  translate([0,23,16]) rotate([-90,0,0]) cylinder(h=16, r1=9, r2=10.5);
  // center hole for lock
  translate([0,0,20]) cylinder(h=20, r=2);

  // magnets
  translate([0,0,-0.5]) cylinder(h=3, r=magnet_radius);
  translate([0,30,-0.5]) cylinder(h=3, r=magnet_radius);
  translate([0,15,-0.5]) cylinder(h=3, r=magnet_radius);    
}
