use <lib.scad>
include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

module allen_holder_component(height, chamfer_depth, chamfer_angle, text_depth, txt, base_d, arm_l) {
    difference() {
        union(){
            cuboid([base_d+4, arm_l+base_d, height], chamfer=0.5);
            translate([0, (arm_l+base_d)/2 - (height/4), -height+1])
                cuboid([base_d+4, height/2, height+5], chamfer=0.5);
        }
        cylinder(height+2, d=base_d-2, center=true, $fn=120);
        up((height-chamfer_depth)/2)
            cylinder(chamfer_depth+1, d1=base_d+1, d2=base_d+1+(2*tan(chamfer_angle)*chamfer_depth), center=true, $fn=120);
        back(text_depth-(arm_l+base_d)/2)
            rotate([90, 0, 0])
                linear_extrude(height=text_depth+0.1)
                    text(text=txt, halign="center", valign="center");
    }
}

module allen_holder(allens, height = 20, chamfer_depth=5, chamfer_angle=10, text_depth=2) {
    function width(i, n=0) = i==len(allens) ? n : width(i+1, n=n+allens[i][1]+4);

    right(width(0)/2)
    for (i = [0:len(allens)-1]) {
        name = allens[i][0];
        base_d = allens[i][1];
        arm_l = allens[i][2];

        delta = width(i=i);

        translate([(base_d/2)+2-delta, -(arm_l+base_d)/2, height/2])
            allen_holder_component(
                height=height,
                chamfer_depth=chamfer_depth,
                chamfer_angle=chamfer_angle,
                text_depth=text_depth,
                txt=name,
                base_d=base_d,
                arm_l=arm_l);
    }

    up(0.5)
        hook_array(hole=4.8, h_pitch=45, v_pitch=15, object_width=width(0), hook_extra_radius=1.5);
}

allens = [
    // label, base diameter, side arm length
    ["10", 21, 60],
    ["8", 21, 60],
    ["6", 21, 55],
    ["5", 21, 55],
    ["4", 15.5, 45],
    ["3", 15.5, 45],
    ["2.5", 15.5, 45],
    ["2", 15.5, 45],
];

allen_holder(allens=allens, height=11);
