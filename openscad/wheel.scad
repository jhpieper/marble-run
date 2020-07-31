// Wheel
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

number_of_blades = 7;
blade_length = 40;

$fn=100;
difference() {
  union() {
    cylinder(h=1, r=15);  // bottom disc
    cylinder(h=15.5, r=5);  // center
      
    // blades
    for (a=[0:360/number_of_blades:360]) {
      rotate([a,-90,0]) linear_extrude(height=1) hull() {
        square(15);
        translate([7.5, blade_length]) circle(7.5);
      }
    }
  }
  // center hole
  translate([0,0,-1]) cylinder(h=20, r=3.5);
}


