include <BOSL2/std.scad>
include <BOSL2/shapes.scad>

// Drawer separators for Stanley 1-93-981 Storage Box

back(50) cuboid([51, 30, 2.1], rounding=3, edges="Z", $fn=120);

linear_extrude(2.1) trapezoid(w1=109, w2=107, h=50, rounding=3, $fn=120);
