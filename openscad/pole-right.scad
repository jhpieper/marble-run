// Pole Right
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

right=true;  // true=right scoop. false=left scoop.
$fn=100;

// Pole
difference() {
  union() {
    // pole
    cube([8,90, 3.5]);
    // pole rounded top
    translate([4,0,3.5]) rotate(a=[270,0,0]) cylinder(h=90, r=4);
    // reinforced center hole
    translate([4,38,-1]) cylinder(h=8.5, r=5);
    // marble holder
    translate([5,0,5]) sphere(9.25);
    // scoop
    hull() {
    translate([5,90,5]) sphere(11);
    translate([5,110,5]) sphere(11);
    }
  }
  // marble holder
  translate([5,0,5]) sphere(8.25);
  translate([5,-10,5]) sphere(9.5); 

  // scoop
  hull() {
    translate([5,90,5]) sphere(10);
    translate([5,110,5]) sphere(10);
  }
  angle = right ? 180 : 0;
  mirror([angle,0,0])
  union() {
    translate([0,90,-5]) cube([20,80,20]);
    translate([-19,110,-5]) cube([20,80,20]);
  }

  // cut top and bottom
  translate([-20,-20,10]) cube([40,140, 10]);
  translate([-20,-20,-10]) cube([40,140, 10]);
  
  // pivot hole
  translate([4,38,-1]) cylinder(h=10, r=3.5);
}
