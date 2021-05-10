include <BOSL2/std.scad>
include <BOSL2/shapes.scad>

difference() {
    union() {
        left(extra_len) {
            cuboid([6+extra_len, 35, 8], rounding=1, $fn=120, anchor=TOP+LEFT);
            cuboid([6, 35, 25], rounding=1, $fn=120, anchor=TOP+LEFT);
            down(17) cuboid([8, 35, 8], rounding=1, $fn=120, anchor=TOP+LEFT);
        }

        right(3) fwd(6.25)  cuboid([55, 8.5, 8], rounding=0.4, $fn=120, anchor=TOP+LEFT+BACK);
        right(3) back(6.25) cuboid([55, 8.5, 8], rounding=0.4, $fn=120, anchor=TOP+LEFT+FRONT);
    }
    // top cutout for the other part
    translate([2, 0, 0.01]) cuboid([60, 31, 2.41], rounding=0.2, $fn=120, anchor=TOP+LEFT);
    
    // spring canals
    translate([2, 8, 0.01]) cuboid([54.5, 5, 6.26], rounding=0.2, $fn=120, anchor=TOP+LEFT+FRONT);
    translate([2, -8, 0.01]) cuboid([54.5, 5, 6.26], rounding=0.2, $fn=120, anchor=TOP+LEFT+BACK);
    // holes in spring canals
    right(52) {
        fwd(10.5) cylinder(d=3, h=100, $fn=120, center=true);
        back(10.5) cylinder(d=3, h=100, $fn=120, center=true);
    }
}
