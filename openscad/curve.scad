magnet_radius = 5.5;  // Use 10x2mm magnets. 5.5 radius is good for hotglueing.  Use ~5 when just pushing magnets in.

$fn=100;

difference (){
  rotate_extrude(angle=90, convexity=10) {
    translate ([-30,0,0]) rotate(a=[0,0,270]){
      difference() {
        union() {
          circle(11);
          translate([0,-11,0]) square(10);
        }
        circle(9);
        translate([-11,-3,0]) square(10);
        translate([-10,0,0]) square(22);
      }
      translate([9,-11,0]) square([3.5,15],0);
    }
  }
  // magnets
  translate([-10, -32, -9.8]) rotate(a=[0,180,90]) cylinder(h=3, r=magnet_radius);
  translate([-32, -10, -9.8]) rotate(a=[0,180,90]) cylinder(h=3, r=magnet_radius);
  translate([-23.5, -23.5, -9.8]) rotate(a=[0,180,90]) cylinder(h=3, r=magnet_radius);
  
}