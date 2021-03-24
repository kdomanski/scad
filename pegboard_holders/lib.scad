include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

module top_hook(hole, hook_followup=2, hook_extra_radius) {
    r = (hole/2) + hook_extra_radius;
    
    translate([0, 0, r]) {
        rotate([0, 90, 0])
            rotate_extrude(angle=90, $fn=60)
                translate([r, 0, 0])
                    circle(d=hole, $fn=60);
    
        translate([0, r, 0]) {
            cylinder(hook_followup/2, d=hole, $fn=60);
            translate([0, 0, hook_followup/2])
                cylinder(hook_followup/2, d1=hole, d2=hole*0.75, $fn=60);
        }
    }
}

module bottom_hook(hole, hook_followup=2) {
    rotate([-90, 0, 0]) {
        cylinder(hook_followup, d=hole, $fn=60);
        translate([0, 0, hook_followup])
            cylinder(hook_followup, d1=hole, d2=hole*0.8, $fn=60);
    }
}

module hook_pair(hole, pitch, hook_extra_radius) {
    translate([0, 0, pitch/2])
        top_hook(hole=hole, hook_extra_radius=hook_extra_radius);
    translate([0, 0, -pitch/2])
        bottom_hook(hole=hole);
}

module hook_array(hole, h_pitch, v_pitch, object_width, hook_extra_radius=1) {
    holes = [0 : h_pitch : object_width-hole];
    effective_width=floor((object_width-hole)/h_pitch) * h_pitch;
    
    translate([-effective_width/2, 0, 0])
    for (i = holes) {
        translate([i, 0, 0])
            hook_pair(hole, pitch=v_pitch, hook_extra_radius=hook_extra_radius);
    }
}

module cylinder_holder(num_of_pliers, hole_size, hole_pitch, height=40, chamfer_depth=2) {
    width = hole_pitch*(num_of_pliers);
    depth = 2*hole_size;

    down(height/2-10) difference(){
        cube([width, depth, height], center=true);

        last_hole_x = (num_of_pliers-1)*hole_pitch;
        right(-last_hole_x/2)
        for (i = [0 : hole_pitch : last_hole_x])
            right(i)
                cyl(h=height+0.01, d=hole_size, chamfer=-chamfer_depth, $fn=60);
    }

    back(depth/2) hook_array(hole=4.8, h_pitch=45, v_pitch=15, object_width=width);
}
