include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

module a() {
    back(0.5) cuboid([22, 2.5, 18], anchor=BOTTOM, spin=[60, 0, 0], rounding=1, $fn=60);
    fwd((sin(60)*18)-1) up((cos(60)*18)-1) cuboid([22, 2.5, 10], anchor=BOTTOM, spin=[15, 0, 0], rounding=1, $fn=60);
}

difference() {
    union() {

        cuboid([60, 2.5, 18], anchor=BOTTOM, rounding=1, $fn=60);
        left(19) a();
        right(19) a();
    }
    
    back(1) up(9) cyl(h=4.51, d=3, center=true, spin=[90, 0, 0], chamfer=-1, $fn=60);
}
