// The Looping

// This model has a few issues, but it works.
// The loop is created by extruding the track in small steps
// and increasing Z for each step to bend it up. 
// The resulting model is expensive to render.  
// I set step=2 (degrees) to make it feasible. 
// 
// The outramp is stitched on through trial and error instead of 
// figuring out the actual math...
//
// The mesh has a bunch of errors.  I repaired the STL with
// https://service.netfabb.com/ 

magnet_radius = 5.5;  // Use 10x2mm magnets. 5.5 radius is good for hotglueing.  Use ~5 when just pushing magnets in.
$fn=100;

difference (){
  union(){
    step=2;  // degrees to extrude per step
    
    // Extrude small slices of the track as it rotates up.
    for(a=[0:step:420]) {
      rotate([0,0,a]) translate([0,0,a/17])rotate_extrude(angle=step, convexity=10) {
        translate ([-30,0,0]) rotate(a=[0,0,270]){
          if(a<70) {  // The beginning of the track backs against the wall.
            track();
            translate([9,-11,0]) square([30,15],0);
          } else {
            track2();
          }
        }
      }
    }

    // Lead in ramp
    translate([-30,140,0]) rotate([90,90,0]) difference() {
      linear_extrude(height=140, convexity=10) {
        track();
      }
      // magnets
      for (pos = [10:30:140]) {
        translate([9.8, -3.5, pos]) rotate(a=[0,90,0]) cylinder(h=3, r=magnet_radius);
      }
    }

    // Out ramp
    // short straight part after the loop
    translate([0,0,420/17]) rotate([90,0,420]) linear_extrude(height=15, convexity=10) {
      translate ([-30,0,0]) rotate(a=[0,0,270]){
        track2();
      }
    }
 
    pos=42; 
    translate([46,-61.3,42.2]) rotate([0,90,420]) mirror([1,0,0])   union() {
      // S-ramp back to the wall.
      rotate([0,0,-45]) {
        rotate_extrude(angle=45, convexity=10) translate ([-pos,0,0])   rotate([0,180,0]) track2();
        translate([-pos*2,0,0]) rotate_extrude(angle=45, convexity=10) translate ([pos,0,0]) rotate([0,180,0]) track2();
      }
    
      // End piece of the out ramp
      translate([-pos,-36,0]) rotate([90,0,180]) difference() {
        linear_extrude(height=40, convexity=10) {
          track();
          translate([9,-11,0]) square([4,15],0);
        }
        // magnets
        for (pos = [10:20:40]) {
          translate([9.8, -3.5, pos]) rotate(a=[0,90,0]) cylinder(h=3, r=magnet_radius);
        }
      }
    }
  }

  // Cut the wall side flat
  translate([-100,-100,-250 - 12.5])cube(250);
  // magnets
  for (i=[-55:35:-20]) {
  rotate([0,0,i]) translate([-10, -32, -9.8]) rotate(a=[0,180,90]) cylinder(h=3, r=magnet_radius);
  }  
}

module track() {
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

module track2() {
  difference() {
    union() {
      circle(11);
      //translate([0,-11,0]) square(10);
    }
    circle(9);
    translate([-11,-3,0]) square(10);
    translate([-10,0,0]) square(22);
  }
  //translate([9,-11,0]) square([3.5,15],0);
}