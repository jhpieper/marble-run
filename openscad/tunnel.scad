// Tunnel
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

length=200;  // Good sizes: 140, 170, 200 (in general: 50 + N*30).
magnet_radius = 5.5;  // Use 10x2mm magnets. 5.5 radius is good for hotgluing.  Use ~5 when just pushing magnets in.

$fn=100;
tunnel_pos=10;
end_pos=length-tunnel_pos;
rotate(a=[90,90,0]){  // rotate for printing
  difference (){
    linear_extrude(height = length, center = false, convexity = 10, slices = 20, scale = 1.0) {
      difference() {
        union() {
          circle(11);
          translate([0,-11,0]) square(10);
          translate([9,-11,0]) square([3.5,15],0);
        }
        // Center tube
        circle(9);
        // make the tunnel roof thinner
        translate([0,1]) circle(9);
        translate([-0.7,0.7]) circle(9);
      }
    }
    // Magnet holes
    for (pos = [10:30:length]) {
      translate([9.8, -3.5, pos]) rotate(a=[0,90,0]) cylinder(h=3, r=magnet_radius);
    }
    
    // Cut sloped tunnel entrance/exit
    translate([-11,-3,0]) cube([11,11,tunnel_pos]);
    translate([-11,4,0]) cube([22,11,tunnel_pos+12]);
    translate([-11,-3,tunnel_pos]) rotate(a=[-30,0,0]) cube([19,11,30]);
    translate([7,4,tunnel_pos+12]) rotate(a=[-30,0,0]) cube([3.5,11,30]);
    
    
    translate([-11,-3,end_pos]) cube([11,11,tunnel_pos]);
    translate([-11,4,end_pos-12]) cube([22,11,tunnel_pos+12]);
    translate([-11,-3,end_pos]) mirror([0,0,1]) rotate(a=[-30,0,0]) cube([19,11,30]);
    translate([7,4,end_pos-12]) mirror([0,0,1]) rotate(a=[-30,0,0]) cube([3.5,11,30]); 
  }
}