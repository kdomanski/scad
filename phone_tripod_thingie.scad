include <BOSL2/std.scad>
include <BOSL2/shapes.scad>

difference() {
    union() {
        cuboid([6, 35, 25], rounding=1, $fn=120, anchor=TOP+LEFT);

        right(3) fwd(6.25)  cuboid([55, 8.5, 8], rounding=0.4, $fn=120, anchor=TOP+LEFT+BACK);
        right(3) back(6.25) cuboid([55, 8.5, 8], rounding=0.4, $fn=120, anchor=TOP+LEFT+FRONT);
    }
    translate([2, 0, 0.01]) cuboid([60, 31, 2.01], rounding=0.2, $fn=120, anchor=TOP+LEFT);
    
    translate([2, 8, 0.01]) cuboid([54.5, 5, 6.26], rounding=0.2, $fn=120, anchor=TOP+LEFT+FRONT);
    translate([2, -8, 0.01]) cuboid([54.5, 5, 6.26], rounding=0.2, $fn=120, anchor=TOP+LEFT+BACK);
    right(52) {
        fwd(10.5) cylinder(d=3, h=100, $fn=120, center=true);
        back(10.5) cylinder(d=3, h=100, $fn=120, center=true);
    }
}
