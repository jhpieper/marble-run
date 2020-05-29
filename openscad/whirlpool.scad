bowl=16;

FN=100;

//rotate(a=[90,90,0]) {
difference() {
  union() {
  difference (){
    linear_extrude(height = 80, center = false, convexity = 10, slices = 20, scale = 1.0, $fn = 16) {
      difference() {
        union() {
          circle(11, $fn=FN);
          //translate([0,-15,0]) square(12.5,10);
          translate([0,-11,0]) square(10);
          
        }
        circle(9, $fn=FN);
        translate([-11,-3,0]) square(10);
        translate([-10,0,0]) square(22);
      }
      translate([9,-11,0]) square([3.5,15],0);
      
    }

    translate([-1*(bowl*2.5-11),-10,bowl*2.5+10]) rotate([90,0,0]) scale([2.5,2.5,2]) sphere(bowl-1, $fn=FN);
    //translate([-35,4,0]) rotate([30,0,0]) cube(30);
    translate([-30,-9,58])  cube(30);
    translate([-1*(bowl*2.5-11),-2,bowl*2.5+10]) rotate([90,0,0]) cylinder(h=9, r=bowl*2.4, $fn=FN);
    
    translate([-11,-11,-31]) rotate([20,0,0]) cube(30);
  }
  
  
  difference() {
  translate([-1*(bowl*2.5-11),-10,bowl*2.5+10]) rotate([90,0,0]) scale([2.5,2.5,1]) sphere(bowl, $fn=FN);
  translate([-1*(bowl*2.5-11),-10,bowl*2.5+10]) rotate([90,0,0]) scale([2.55,2.55,1]) sphere(bowl-1, $fn=FN);
    translate([-1*(bowl*2.5-11),0,bowl*2.5+10]) rotate([90,0,0]) cylinder(h=50, r=9, $fn=FN);
  translate([-190,-10,10])cube(200);
     //translate([10,-20,0])cube(200);
    //translate([0,0,0]) cylinder(h=100, r=10, $fn=FN);
  }
  difference() {
  translate([-1*(bowl*2.5-11),-3,bowl*2.5+10]) rotate([90,0,0]) cylinder(h=7, r=bowl*2.5, $fn=FN);
  translate([-1*(bowl*2.5-11),-2,bowl*2.5+10]) rotate([90,0,0]) cylinder(h=9, r=bowl*2.4, $fn=FN);
 cylinder(h=50, r=9, $fn=FN);
      translate([10,-11,0]) cube([10,20,80]);
    }}
    
        for (pos = [15:27:80]) {
      translate([9.8, -3.5, pos]) rotate(a=[0,90,0]) cylinder(h=3, r=5.5, center=false, $fn=FN);
    }
    }


 //catcher
    
     
    
    difference() {
    translate([8.5,-38.5,bowl*2.5+10]) rotate([0,90,0]) cylinder(h=4, r=10);
      translate([9.8,-38.5,bowl*2.5+10]) rotate(a=[0,90,0]) cylinder(h=3, r=5.5, center=false, $fn=FN);
    }
    
 difference() {
   union() {
     translate([-1*(bowl*2.5-11),-25,bowl*2.5+10]) rotate([90,0,0]) cylinder(h=10, r=11);
     translate([-1*(bowl*2.5-11),-35,bowl*2.5+10]) rotate([5,90,0]) cylinder(h=50, r=11); 
     // connect the tune:
     //translate([-1*(bowl*2.5-11),-35,bowl*2.5-1]) rotate([0,0,-5]) cube([50,27.5,22]);
     translate([-1*(bowl*2.5-11),-35,bowl*2.5+10]) sphere(11); 
   }
   translate([-1*(bowl*2.5-11),-24,bowl*2.5+10]) rotate([90,0,0]) cylinder(h=11, r=9.5);
   translate([-1*(bowl*2.5-11),-35,bowl*2.5+10]) rotate([5,90,0]) cylinder(h=51, r=9.5); 
     translate([-1*(bowl*2.5-11),-35,bowl*2.5+10]) sphere(9.5);
   
  translate([-0.5,-38.5,bowl*2.5+10]) rotate([90,0,0]) cylinder(h=20, r=9);
   
   
   translate([-1*(bowl*2.5-11),-10,bowl*2.5+10]) rotate([90,0,0]) scale([2.5,2.5,1]) sphere(bowl, $fn=FN);
   
    translate([12.5,-100,0]) cube(200);
 }
/*
difference() {
union() {
  difference() {
    translate([0,-(bowl+8.5),bowl*2.5+10.3]) {
      rotate_extrude(angle=90, convexity=10, $fn=FN) translate ([-30,0,0]) rotate(a=[0,0,270]){
        difference() {
          circle(11, $fn=FN);
          circle(9, $fn=FN);
          translate([-11,-3,0]) square(10);
          translate([-10,0,0]) square(22);
        }
      }
    }
   translate([-8,-57.8,bowl*2.5+14]) rotate([0,-10,50]) cube(10); 
     translate([-11,-11,-31]) rotate([20,0,0]) cube(30);
  }
   
  translate([0,-52,39.5]) rotate([10,0,0]) {
  difference (){
    linear_extrude(height = 50, center = false, convexity = 10, slices = 20, scale = 1.0, $fn = 16) {
      difference() {
        union() {
          circle(11, $fn=FN);
          translate([0,-11,0]) square(10);
        }
        circle(9, $fn=FN);
        translate([-11,-3,0]) square(10);
        translate([-10,0,0]) square(22);
      }
      translate([9,-11,0]) square([3.5,15],0);
    }
    
    for (pos = [10:30:50]) {
      translate([9.8, -3.5, pos]) rotate(a=[0,90,0]) cylinder(h=3, r=5.5, center=false, $fn=FN);
    }
    translate([-12,0,bowl*2.5+10.6-40]) rotate([0,90,0]) cylinder(h=11, r=9, $fn=FN);

  }
 
}
}
translate([0,-51.75,38]) rotate([10,0,0]) cylinder(h=30, r=9, $fn=FN);


}
difference() {
translate([0,-52,39.5]) rotate([10,0,0]) cylinder(h=2, r=11, $fn=FN);
 translate([-11,-53,38]) cube(30);
} 

*/
