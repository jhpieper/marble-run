// Tray
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

length=50;  // Good sizes: 50, 110, 200 (in general: 5 + N*30).
depth=20;  // How far the tray extends
magnet_radius = 5.5;  // Use 10x2mm magnets. 5.5 radius is good for hotgluing.  Use ~5 when just pushing magnets in.

$fn=100;
wallheight = 0; 
rotate(a=[0,90,0]) { // rotate for printing (magnet side down).
  difference() {
    union() {
      // Basic shape is just a cylinder and cube
      hull() {
        cylinder(r=11, h=length);
        translate([-depth,0,0]) cylinder(r=11, h=length);
      }
      hull() {
        sphere(11);
        translate([-depth,0,0]) sphere(11);        
      }
      translate([0,0,length]) hull() {
        sphere(11);
        translate([-depth,0,0]) sphere(11);        
      }
      translate([0,-11,0]) cube([12.5,15,length]);
      //Additional back support with rounded corners.
      translate([8.5,-18,11]) rotate([0,90,0]) cylinder(h=4, r=11);
      translate([8.5,-18,length-11]) rotate([0,90,0]) cylinder(h=4, r=11);
      translate([8.5,-29,11]) cube([4,15,length-22]);
      translate([8.5,-18,0]) cube([4,15,length]);
    }
    // Carve inner trail
    translate([0,0,-1]) hull() {
      cylinder(r=9, h=length+2);
      translate([-depth,0,0]) cylinder(r=9, h=length+2);
    }
      
    // Carve lower endcap.
    hull() {
      sphere(9);
      translate([-depth,0,0]) sphere(9);        
    }
    // Remove top of the lower endcap.
    translate([-35,wallheight, -11]) cube([50,20,11]);
      
    // Carve upper endcap
    translate([0,0,length]) hull() {
      sphere(9);
      translate([-depth,0,0]) sphere(9);        
    }
    // Remove top of the lower endcap.
    translate([-35,wallheight, length]) cube([50,20,11]);
      
    // Remove upper parts of the cylinder tube
    translate([-35,wallheight,-1]) cube([35,25,length+2]);
    translate([0,4,-1]) cube([11,25,length+2]);
    translate([0,0,-1]) cube([9,25,length+2]);

    // Magnet holes
    for (pos = [10:30:length]) {
      translate([9.8, -3.5, pos]) rotate(a=[0,90,0]) cylinder(h=3, r=magnet_radius);
    }
    // Lower magnet holes
    for (pos = [25:30:length-10]) {
      translate([9.8, -20, pos]) rotate(a=[0,90,0]) cylinder(h=3, r=magnet_radius);
    }
  }
}