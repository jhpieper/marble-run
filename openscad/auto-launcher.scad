// Auto-Launcher
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

right=false;  // true=right scoop. false=left scoop.

$fn=100;
angle = right ? 180 : 0;

// Pole
difference() {
  union() {
    // pole
    translate([-4,-30,0]) cube([8,120, 3.5]);
    // pole rounded top
    translate([0,-30,3.5]) rotate(a=[270,0,0]) cylinder(h=120, r=4);
    // reinforced pivot holes
    translate([0,30,0]) cylinder(h=7.5, r=5);
    translate([0,38,0]) cylinder(h=7.5, r=5);
    translate([0,46,0]) cylinder(h=7.5, r=5);
    // marble holder
    translate([1,-30,5]) sphere(9.25);
    // scoop
    hull() {
    translate([1,90,5]) sphere(14);
    translate([1,105,5]) sphere(14);
    }
    // marble blocker (on top of scoop)
    mirror([angle,0,0]) {
    difference() {
      translate([0,38,0]) cylinder(h=10, r=62.5, $fn=300);
      translate([0,38,-1]) cylinder(h=12, r=59.5, $fn=300);
      translate([-99,-30,-2]) cube([100,130,13]);
      translate([-4,-30,-2]) cube([100,66.5,13]);
    }
    difference() {
      translate([3,17,0]) cylinder(h=10, r=62.5, $fn=300);
      translate([3,17,-1]) cylinder(h=12, r=59.5, $fn=300);
      translate([-99,-50,-2]) cube([100,150,13]);
      translate([-4,-50,-2]) cube([100,86.5,13]);
    }
  }
  }
  // marble holder
  translate([1,-30,5]) sphere(8.25);
  translate([1,-40,5]) sphere(9.5); 

  // scoop
  hull() {
    translate([1,90,5]) sphere(12);
    translate([1,110,5]) sphere(12);
  }
  
  mirror([angle,0,0])
  union() {
    translate([-4,99,-5]) cube([20,80,20]);
    translate([-23,109,-5]) cube([20,80,20]);
  }

  // cut top and bottom
  translate([-20,-40,10]) cube([40,160, 10]);
  translate([-20,-40,-10]) cube([40,160, 10]);
  
  // pivot holes
  translate([0,30,-1]) cylinder(h=10, r=3.5);
  translate([0,38,-1]) cylinder(h=10, r=3.5);
  translate([0,46,-1]) cylinder(h=10, r=3.5);
}
