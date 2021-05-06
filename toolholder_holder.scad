include <BOSL2/std.scad>
include <BOSL2/shapes.scad>

w1=41.5;
h=15;
w2=w1-(2*cos(60)*h);

holder_angle = 10;

module core() {
    backplate_relief = 15;
    grip_height = 30;
    ddown = backplate_relief*sin(holder_angle);
    down(ddown) difference() {
        back((w1+2.5)*sin(10)) xrot(90-holder_angle) zrot(-90) union() {
             linear_extrude(height=backplate_relief+grip_height) trapezoid(w1=w1, w2=w2, h=h, chamfer=0.8);
             fwd(1.25) linear_extrude(height=backplate_relief) trapezoid(w1=w1+5, w2=w2+2.5, h=h+2.5, chamfer=0.8);
        }
        cuboid([100,100,100], anchor=FRONT);
    }
}

module hole() {
    xrot(90) up(0.01) cyl(d=3.1, h=5.1, $fn=200, chamfer=-1.01, anchor=TOP);
}

module backplate() {
    difference() {
        h = 20+((w1+5)*cos(holder_angle));
        left(1.25) difference() {
            cuboid([18.5, 4, h], anchor=FRONT, chamfer=0.5);
            up(h/2 - 6) hole();
            down(h/2 - 6) hole();
        }
    }
}

core();
backplate();
