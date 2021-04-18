include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

module a() {
    back(0.5) cuboid([20, 2, 15], anchor=BOTTOM, spin=[60, 0, 0], rounding=1, $fn=60);
    fwd((sin(60)*15)-1) up((cos(60)*15)-1) cuboid([20, 2, 5], anchor=BOTTOM, spin=[15, 0, 0], rounding=1, $fn=60);
}

difference() {
    union() {
        cuboid([60, 2, 12], anchor=BOTTOM, rounding=1, $fn=60);
        left(20) a();
        right(20) a();
    }
    
    back(1) up(6) cyl(h=4.01, d=3, center=true, spin=[90, 0, 0], chamfer=-1, $fn=60);
}
