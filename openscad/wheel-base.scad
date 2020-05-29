// Wheel Base (use with lock*)

FN=100;
difference() {
  union() {
    cylinder(h=4, r=20, center=false, $fn=FN);
    cylinder(h=6, r=6, center=false, $fn=FN);
    cylinder(h=22, r=3.2, center=false, $fn=FN);
  }
  // center hole for lock
  translate([0,0,15]) cylinder(h=20, r=2, center=false, $fn=FN);

  // magnets
  translate([11,0,-0.5]) cylinder(h=3, r=5.5, center=false, $fn=FN);
  translate([-5.5,10,-0.5]) cylinder(h=3, r=5.5, center=false, $fn=FN);
  translate([-5.5,-10,-0.5]) cylinder(h=3, r=5.5, center=false, $fn=FN);    
  }
