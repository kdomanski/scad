include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

inch = 25.4;
width = 10*inch;
rail_width=0.625*inch;

module hole() {
     cuboid([10, 3.01, 6], rounding=3, edges=["Y"], $fn=120);
}

difference() {
    cuboid([9.95*inch, 3, 1.75*inch]);
    down(rail_width) {
        left((width-rail_width)/2) hole();
        right((width-rail_width)/2) hole();
    }
    up(rail_width) {
        left((width-rail_width)/2) hole();
        right((width-rail_width)/2) hole();
    }
}