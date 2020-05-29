// lock round
FN=100;

union() {
  for (a=[0:360/5:360]) {
    rotate([0,0,a]) translate([3,0,0]) cylinder(h=2, r=3, center=false, $fn=FN);
  }
  // color("#000000") cylinder(h=2, r=5, center=false, $fn=FN);
  cylinder(h=5, r=1.95, center=false, $fn=FN);
  translate([0,0,5]) cylinder(h=2, r1=1.95, r2=1.8, center=false, $fn=FN);
}
