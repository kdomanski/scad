include <BOSL2/std.scad>
include <BOSL2/shapes.scad>

module drill_bit_ring(d, h=6) {
    difference() {
        cyl(h=h, d=2*d, chamfer=0.5, center=true, $fn=720);
        cyl(h=h+0.2, d=d+0.1, chamfer=-0.4, center=true, $fn=720);
        fwd(d-1.5)
        rotate([90, 0, 0])
            linear_extrude(height=1.5)
                text(text=str(d), size=4, halign="center", valign="center");
    }
}

drill_bit_ring(5.5);