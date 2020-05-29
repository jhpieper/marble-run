right=false;  // true=right scoop. false=left scoop.

$fn=100;

// Pole
difference() {
  union() {
    // pole
    cube([8,90, 3.5]);
    // pole rounded top
    translate([4,0,3.5]) rotate(a=[270,0,0]) cylinder(h=90, r=4);
    // reinforced center hole
    translate([4,38,-1]) cylinder(h=8.5, r=5);
    // marble holder
    translate([5,0,5]) sphere(9.25);
    // scoop
    hull() {
    translate([5,90,5]) sphere(11);
    translate([5,110,5]) sphere(11);
    }
  }
  // marble holder
  translate([5,0,5]) sphere(8.25);
  translate([5,-10,5]) sphere(9.5); 

  // scoop
  hull() {
    translate([5,90,5]) sphere(10);
    translate([5,110,5]) sphere(10);
  }
  angle = right ? 180 : 0;
  mirror([angle,0,0])
  union() {
    translate([0,90,-5]) cube([20,80,20]);
    translate([-19,110,-5]) cube([20,80,20]);
  }

  // cut top and bottom
  translate([-20,-20,10]) cube([40,140, 10]);
  translate([-20,-20,-10]) cube([40,140, 10]);
  
  // pivot hole
  translate([4,38,-1]) cylinder(h=10, r=3.5);
}
