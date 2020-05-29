FN=100;
//rotate(a=[90,0,0])
difference (){
rotate_extrude(angle=90, convexity=10, $fn=FN)
translate ([-30,0,0]) rotate(a=[0,0,270]){
difference() {
  union() {
      circle(11, $fn=FN);
      translate([0,-11,0]) square(10);
  }
  //polygon(points=[[-11,0], [9,0], [10,2],[10,-10],[-6,-10]]);
  circle(9, $fn=FN);
  translate([-11,-3,0]) square(10);
  translate([-10,0,0]) square(22);
}
translate([9,-11,0]) square([3.5,15],0);
}
translate([-10, -32, -9.8]) rotate(a=[0,180,90]) cylinder(h=3, r=5.5, center=false, $fn=FN);
translate([-32, -10, -9.8]) rotate(a=[0,180,90]) cylinder(h=3, r=5.5, center=false, $fn=FN);

}
