// lock round
$fn=100;
union() {
  cylinder(h=2, r=5);
  cylinder(h=5, r=1.95);
  translate([0,0,5]) cylinder(h=2, r1=1.95, r2=1.8);
}