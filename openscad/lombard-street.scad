// Lombard Street
//
// Copyright (c) 2020 Jan Pieper (jhpieper.github@gmail.com)
//
// This code is hosted at github.com/jhpieper/marble-run under the MIT license.
// The 3D objects (STL files) are also hosted on thingiverse.com under
// the Creative Commons Attribution 4.0 International (CC BY 4.0) license.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.

magnet_radius = 5.5;  // Use 10x2mm magnets. 5.5 radius is good for hotglueing.  Use ~5 when just pushing magnets in.

$fn=100;
pos=12;
offset=17;

// rotate & move for printing
translate([0,0,offset+7]) rotate([0,-90,0])
union() {
  difference() {
    union() {
      for (i=[0:2:6]) {
        translate([0,offset*i,0]) squiggle();
        translate([-offset,offset*(i+1),0]) mirror([1,0,0]) squiggle();
      }

      translate([-pos,offset*4-10,0]) rotate ([-90,180,0]) difference() {
        linear_extrude(height=20, convexity=10) track();
        // delete front half of the track (just keep the magnet side)
        translate([-20,-10,0]) cube(20);
      }    
    }
    // middle magnet
    translate([-9.8-pos, offset*4, -3.5]) rotate([0,270,0]) cylinder(h=3, r=magnet_radius);
  }

  // track entry & magnet
  translate([-pos,-20,0]) rotate ([-90,180,0]) difference() {
    linear_extrude(height=20, convexity=10) track();
    // magnet
    translate([9.8, -3.5, 10]) rotate([0,90,0]) cylinder(h=3, r=magnet_radius);
  }

  // track exit & magnet
  translate([-pos,offset*8,0]) rotate ([-90,180,0]) difference() {
    linear_extrude(height=20, convexity=10) track();
    // magnet
    translate([9.8, -3.5, 10]) rotate([0,90,0]) cylinder(h=3, r=magnet_radius);
  }
}



module squiggle() {
  difference (){
    union() {
      rotate([0,0,-45]) {
      rotate_extrude(angle=45, convexity=10) translate ([-pos,0,0]) track2();
      translate([-pos*2,0,0]) rotate_extrude(angle=45, convexity=10) translate ([pos,0,0]) track2();
      }
    }
  }
}

// round track
module track2() {
  difference() {
    circle(11);
    circle(9);
    translate([-11,0,0]) square(22);
  }
}

// track with backing wall for magnets
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
