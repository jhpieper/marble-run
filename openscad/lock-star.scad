// lock
FN=100;

union() {
  for (a=[0:360/5:360]) {
    rotate([0,0,a]) difference() {
      translate([-5,0,0]) cube([10,11,2]);
      translate([-5,0,-1]) rotate([0,0,64]) cube([30,30,4]);
      translate([5,0,-1]) rotate([0,0,26]) cube([30,30,4]);
    }
  }
          
  //color("#000000") cylinder(h=2, r=5, center=false, $fn=FN);
  cylinder(h=5, r=1.95, center=false, $fn=FN);
  translate([0,0,5]) cylinder(h=2, r1=1.95, r2=1.8, center=false, $fn=FN);
}

