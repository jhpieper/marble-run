// lock round
$fn=100;

union() {
  for (a=[0:360/5:360]) {
    rotate([0,0,a]) translate([3,0,0]) cylinder(h=2, r=3);
  }
  // color("#000000") cylinder(h=2, r=5);
  cylinder(h=5, r=1.95);
  translate([0,0,5]) cylinder(h=2, r1=1.95, r2=1.8);
}
