// Whirlpool!
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
bowl=16;
bscale=2.5;
bowl2=bowl*bscale;

rotate(a=[90,90,0]) {
  difference() {
    union() {
      difference (){
        linear_extrude(height = 80, center = false, convexity = 10, slices = 20, scale = 1.0) {
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
        translate([-1*(bowl2-11),-10,bowl2+10]) rotate([90,0,0]) scale([bscale,bscale,2]) sphere(bowl-1);
        translate([-30,-9,58])  cube(30);
        translate([-1*(bowl2-11),-2,bowl2+10]) rotate([90,0,0]) cylinder(h=9, r=bowl*(bscale-0.1));
        translate([-11,-11,-31]) rotate([20,0,0]) cube(30);
      }
      difference() {
        translate([-1*(bowl2-11),-10,bowl2+10]) rotate([90,0,0]) scale([bscale,bscale,1]) sphere(bowl);
        translate([-1*(bowl2-11),-10,bowl2+10]) rotate([90,0,0]) scale([2.55,2.55,1]) sphere(bowl-1);
        translate([-1*(bowl2-11),0,bowl2+10]) rotate([90,0,0]) cylinder(h=50, r=9);
        translate([-190,-10,10])cube(200);
      }
      difference() {
        translate([-1*(bowl2-11),-3,bowl2+10]) rotate([90,0,0])     cylinder(h=7, r=bowl2);
        translate([-1*(bowl2-11),-2,bowl2+10]) rotate([90,0,0])     cylinder(h=9, r=bowl*(bscale-0.1));
        cylinder(h=50, r=9);
        translate([10,-11,0]) cube([10,20,80]);
      }
    }
    // magnets
    for (pos = [15:27:80]) {
      translate([9.8, -3.5, pos]) rotate(a=[0,90,0]) cylinder(h=3, r=magnet_radius);
    }
  }
  //catcher
  difference() {
    // catcher back wall
    translate([8.5,-38.5,bowl2+10]) rotate([0,90,0]) cylinder(h=4, r=10);
    //magnet
    translate([9.8,-38.5,bowl2+10]) rotate(a=[0,90,0]) cylinder(h=3, r=magnet_radius);
  }  
  difference() {
    union() {
      translate([-1*(bowl2-11),-25,bowl2+10]) rotate([90,0,0]) cylinder(h=10, r=11);
      translate([-1*(bowl2-11),-35,bowl2+10]) rotate([5,90,0]) cylinder(h=50, r=11); 
      // connect the tunnel:
      //translate([-1*(bowl2-11),-35,bowl2-1]) rotate([0,0,-5]) cube([50,27.5,22]);
      translate([-1*(bowl2-11),-35,bowl2+10]) sphere(11); 
    }
    translate([-1*(bowl2-11),-24,bowl2+10]) rotate([90,0,0]) cylinder(h=11, r=9.5);
    translate([-1*(bowl2-11),-35,bowl2+10]) rotate([5,90,0]) cylinder(h=51, r=9.5); 
    translate([-1*(bowl2-11),-35,bowl2+10]) sphere(9.5);
   
    translate([-0.5,-38.5,bowl2+10]) rotate([90,0,0]) cylinder(h=20, r=9);
   
    translate([-1*(bowl2-11),-10,bowl2+10]) rotate([90,0,0]) scale([bscale,bscale,1]) sphere(bowl);
   
    translate([12.5,-100,0]) cube(200);
  }
}