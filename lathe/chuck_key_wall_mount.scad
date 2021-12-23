include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

module a() {
    back(0.5) cuboid([25, 2.5, 15], anchor=BOTTOM, spin=[60, 0, 0], rounding=1, $fn=60);
    fwd((sin(60)*15)-1) up((cos(60)*15)-1) cuboid([25, 2.5, 8], anchor=BOTTOM, spin=[15, 0, 0], rounding=1, $fn=60);
}

difference() {
    union() {
        cuboid([60, 2.5, 14], anchor=BOTTOM, rounding=1, $fn=60);
        left(17.5) a();
        right(17.5) a();
    }
    
    back(1) up(7) cyl(h=4.51, d=3, center=true, spin=[90, 0, 0], chamfer=-1, $fn=60);
}
