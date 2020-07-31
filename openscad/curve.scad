// Curve
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
