// Funnel
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

magnet_radius = 5.5;  // Use 10x2mm magnets. 5.5 radius is good for hotgluing.  Use ~5 when just pushing magnets in.

inner_bottom_radius = 10;
outer_bottom_radius = inner_bottom_radius + 2;
inner_top_radius = 31;
outer_top_radius = inner_top_radius + 2;

$fn=100;

translate([0,0,40]) rotate([0,180,0])  // rotate & move for printing
difference() {
  hull() {
    cylinder(h=40, r1=outer_bottom_radius, r2=outer_top_radius);
    translate([0,-11,0]) cylinder(h=40, r1=outer_bottom_radius, r2=outer_top_radius);
  }
  difference() {
    hull() {
      cylinder(h=41, r1=inner_bottom_radius, r2=inner_top_radius);
      translate([0,-11,-.5]) cylinder(h=41, r1=inner_bottom_radius, r2=inner_top_radius);
    }
    // back wall
    translate([-40,-4.0,0]) cube(80);
  }
  // Cut the back
  translate([-40,0,-1]) cube(80);
  
  // magnets
  translate([0, 0.3, 10]) rotate(a=[90,0,0]) cylinder(h=3, r=magnet_radius);
  translate([0, 0.3, 30]) rotate(a=[90,0,0]) cylinder(h=3, r=magnet_radius);
  translate([16, 0.3, 30]) rotate(a=[90,0,0]) cylinder(h=3, r=magnet_radius);
  translate([-16, 0.3, 30]) rotate(a=[90,0,0]) cylinder(h=3, r=magnet_radius);
}