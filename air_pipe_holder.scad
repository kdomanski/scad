include <BOSL2/std.scad>
include <BOSL2/shapes.scad>

pipe_d = 12;
a=15;


difference() {
    fwd(4) cuboid([a, pipe_d+5, a], anchor=FRONT, chamfer=0.3);
    cyl(d=pipe_d, h=a+0.001, anchor=FRONT, $fn=120);
    back(pipe_d+1.001) cuboid([pipe_d-1, 5, a+0.001], chamfer=-0.3, anchor=BACK);
    fwd(3.2) cyl(h=6.501, d=3, spin=[90, 0, 0], chamfer=-1.5, $fn=120);
    back(1) cyl(h=2, d=6, spin=[90, 0, 0], chamfer=0, $fn=120);
    cuboid([a+0.001, 2, 3], chamfer=0.3, edges=[TOP+FRONT, TOP+BACK, BOTTOM+FRONT, BOTTOM+BACK], anchor=FRONT);
    back(pipe_d) cuboid([a+0.001, 2, 3], chamfer=0.3, edges=[TOP+FRONT, TOP+BACK, BOTTOM+FRONT, BOTTOM+BACK], anchor=FRONT);
}
