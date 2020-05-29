number_of_blades = 7;
blade_length = 30;


$fn=100;

// Wheel
difference() {
  union() {
    cylinder(h=1, r=15);  // bottom disc
    cylinder(h=15.5, r=5);  // center
      
    // blades
    for (a=[0:360/number_of_blades:360]) {
      rotate([a,-90,0]) linear_extrude(height=1) hull() {
        square(15);
        translate([7.5, blade_length]) circle(7.5);
      }
    }
  }
  // center hole
  translate([0,0,-1]) cylinder(h=20, r=3.5);
}


