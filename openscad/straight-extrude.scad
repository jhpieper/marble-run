length=200;  // Good sizes: 50, 110, 200 (in general: 5 + N*30).

FN=100;
rotate(a=[90,90,0]) {
  difference (){
    linear_extrude(height = length, center = false, convexity = 10, slices = 20, scale = 1.0, $fn = 16) {
      difference() {
        union() {
          circle(11, $fn=FN);
          translate([0,-11,0]) square(10);
        }
        circle(9, $fn=FN);
        translate([-11,-3,0]) square(10);
        translate([-10,0,0]) square(22);
      }
      translate([9,-11,0]) square([3.5,15],0);
    }
    for (pos = [10:30:length]) {
      translate([9.8, -3.5, pos]) rotate(a=[0,90,0]) cylinder(h=3, r=5.5, center=false, $fn=FN);
    }
  }
}