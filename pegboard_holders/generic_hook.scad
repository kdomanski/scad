use <lib.scad>
include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

height = 6;
width = 10;
depth = 10;
hook_height=5;
body_chamfer = 0.2;
support_height = height - 3;
support_width = width - 4;
hook_angle = 60;
support = true;

module hook_section(h=height, w=width) {
    left((w-h)/2)  circle(d=h, $fn=120);
    right((w-h)/2) circle(d=h, $fn=120);
    square([w-h, h], center=true);
}

xrot(90) linear_extrude(height=depth) hook_section();
up(height/2) fwd(depth) xrot(90-hook_angle) fwd(height/2) linear_extrude(height=hook_height) hook_section();
translate([0, -depth, height/2]) zrot(180) yrot(90) rotate_extrude(angle=hook_angle, $fn=120) right(height/2) zrot(90) hook_section();

if (support) {
    support_angle=atan((depth+height-0.5)/(10-(support_height/2)));
    support_len=sqrt(pow(10, 2)+pow(depth+(height/2), 2));
    difference() {
        back((height/2)-0.5) down(10-support_height) xrot(support_angle) linear_extrude(height=support_len) fwd(support_height/2) hook_section(h=support_height, w=support_width);
        left(width/2) down(50) cube([width, depth, 100]);
    }
}

back(1) difference() {
    cuboid([width+(2*body_chamfer), 2, 20], chamfer=body_chamfer);
    back(0) left(1.3) yrot(90) {
        xrot(-90) linear_extrude(height=1.01) text(text=str("DEPTH=", depth), size=1.5, halign="center");
        up(1.8) xrot(-90) linear_extrude(height=1.01) text(text=str("WIDTH=", width), size=1.5, halign="center");
        up(3.6) xrot(-90) linear_extrude(height=1.01) text(text=str("ANGLE=", hook_angle), size=1.5, halign="center");
    }
}

back(2) hook_array(hole=4.4, h_pitch=45, v_pitch=15, object_width=width, hook_extra_radius=1.5);

