include <BOSL2/std.scad>
include <BOSL2/shapes.scad>

$fn=120;

collar_out=23;
collar_in=18;

cylinder(d=collar_out,h=2);
up(2) cylinder(d1=collar_out, d2=collar_in, h=1);
up(3) cylinder(d=collar_in, h=2);
up(5) cylinder(d1=collar_in, d2=collar_out, h=1);
up(6) cylinder(d=collar_out,h=2);

up(8) difference(){
    cylinder(d1=16, d2=9, h=24);
    up(14.1) cylinder(d=6, h=10);
}
