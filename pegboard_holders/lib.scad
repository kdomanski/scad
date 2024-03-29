include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

module top_hook(hole, hook_followup=2, hook_extra_radius) {
    r = (hole/2) + hook_extra_radius;
    
    translate([0, 0, r]) {
        rotate([0, 90, 0])
            rotate_extrude(angle=90, $fn=120)
                translate([r, 0, 0])
                    circle(d=hole, $fn=120);
    
        translate([0, r, -0.01]) {
            cylinder(hook_followup/2, d=hole, $fn=120);
            translate([0, 0, (hook_followup/2)-0.01])
                cylinder((hook_followup/2)+0.01, d1=hole, d2=hole*0.75, $fn=120);
        }
    }
}

module bottom_hook(hole, hook_followup=2) {
    rotate([-90, 0, 0]) {
        cylinder(hook_followup, d=hole, $fn=120);
        translate([0, 0, hook_followup])
            cylinder(hook_followup, d1=hole, d2=hole*0.8, $fn=120);
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

module cylinder_holder(holes, height=40, chamfer_depth=2, bottom_support=0, labels=false, labels_override=[], txt_size=6, clearance_around_drill=0, clearance_around_holes=3, hooks=true) {
    function width(i, n=0) = i==len(holes) ? n : width(i+1, n=n+holes[i]+(2*clearance_around_holes));

    w = width(0)+2;
    depth = max(holes)+(clearance_around_holes+chamfer_depth)*2;

    down((height+bottom_support)/2-10) difference(){
        cuboid([w, depth, height+bottom_support], chamfer=0.5);

        right(width(0)/2)
        for (i = [0:len(holes)-1]) {
            delta = width(i=i);
            right((holes[i]/2)+clearance_around_holes-delta) up(bottom_support/2) {
                if(bottom_support == 0)
                    cyl(h=height+0.01, d=holes[i]+clearance_around_drill, chamfer=-chamfer_depth, $fn=60);
                else
                    cyl(h=height+0.01, d=holes[i]+clearance_around_drill, chamfer2=-chamfer_depth, $fn=60);

                if(labels) {
                    back(2-depth/2)
                        rotate([90, 0, 0])
                            linear_extrude(height=2.01) {
                                txt = labels_override[i] == undef ? str(holes[i]) : labels_override[i];
                                text(text=txt, size=txt_size, halign="center", valign="center");
                            }
                }
            }
        }
    }

    if (hooks)
        back(depth/2) hook_array(hole=4.8, h_pitch=45, v_pitch=15, object_width=w);
}

