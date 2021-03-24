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

module cylinder_holder(holes, height=40, chamfer_depth=2, bottom_support=0) {
    function width(i, n=0) = i==len(holes) ? n : width(i+1, n=n+holes[i]+6);

    w = width(0)+2;
    depth = 2*max(holes);

    down((height+bottom_support)/2-10) difference(){
        cuboid([w, depth, height+bottom_support], chamfer=0.5);

        right(width(0)/2)
        for (i = [0:len(holes)-1]) {
            delta = width(i=i);
            right((holes[i]/2)+3-delta) up(bottom_support/2)
                if(bottom_support == 0)
                    cyl(h=height+0.01, d=holes[i], chamfer=-chamfer_depth, $fn=60);
                else
                    cyl(h=height+0.01, d=holes[i], chamfer2=-chamfer_depth, $fn=60);
        }
    }

    back(depth/2) hook_array(hole=4.8, h_pitch=45, v_pitch=15, object_width=w);
}
