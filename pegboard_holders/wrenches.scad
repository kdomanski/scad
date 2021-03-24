use <lib.scad>
include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

module wrench_holder_part(txt, handle_width, handle_thickness, height=20, text_depth=2) {
    fwd((handle_width+12)/2)
    difference() {
        cuboid([handle_thickness+8, handle_width+12, height], chamfer=0.5);
        fwd(3.0) cuboid([handle_thickness+0.4, handle_width+7.01, height+0.1], chamfer=-0.5);
        up(2.5)hull() {
            fwd(handle_width/2)  sphere(d=handle_thickness+3.5, $fn=60);
            back(handle_width/2) sphere(d=handle_thickness+3.5, $fn=60);
            up(height) {
                fwd(handle_width/2)  sphere(d=handle_thickness+4.5, $fn=60);
                back(handle_width/2) sphere(d=handle_thickness+4.5, $fn=60);
            }
        }
        down(height/2 - 5) back(handle_width/2 + text_depth + 0.6) xrot(90) linear_extrude(height=text_depth+0.1)
            text(text=txt, size=3,  halign="center", valign="center");
    }
}

module wrench_holder(wrenches) {
    function width(i, n=0) = i==len(wrenches) ? n : width(i+1, n=n+wrenches[i][2]+8);

    right(width(0)/2)
    for (i = [0:len(wrenches)-1]) {
        delta = width(i=i);

        left((delta-(wrenches[i][2]/2))-4)
        wrench_holder_part(
            txt=wrenches[i][0],
            handle_width=wrenches[i][1],
            handle_thickness=wrenches[i][2]);
    }

    up(0)
        hook_array(hole=4.8, h_pitch=45, v_pitch=15, object_width=width(0), hook_extra_radius=1.5);
}

wrenches1 = [
    // label, handle width, handle thickness
    ["6", 7.6, 3.2],
    ["7", 8.6, 3.2],
    ["8", 9, 3.8],
    ["9", 10, 3.8],
    ["10", 10.3, 4.3],
    ["11", 11.0, 4.3],
    ["12", 12.0, 4.3],
    ["13", 12.5, 4.3],
];

wrenches2 = [
    // label, handle width, handle thickness
    ["14", 13.3, 4.5],
    ["15", 14.4, 4.5],
    ["16", 14.8, 4.8],
    ["17", 15.8, 4.8],
    ["18", 16.2, 4.8],
    ["19", 16.6, 5.0],
    ["21", 17.2, 5.4],
    ["28", 20.8, 6.6],
];

wrench_holder(wrenches=wrenches1);
back(50) wrench_holder(wrenches=wrenches2);
