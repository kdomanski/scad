use <lib.scad>

//cylinder_holder(holes=[16, 16, 16, 16], height=20, chamfer_depth=2);

// morse taper 2
d1 = 14.529;
d2 = 17.780;
h  = 65.020;

fwd(12) difference() {
    cuboid([24, 24, 10], chamfer=0.5);
    down((h/2)-10) cylinder(d1=d1,d2=d2,h=h,center=true, $fn=120);
}

down(5.5) hook_array(hole=4.8, h_pitch=15, v_pitch=15, object_width=24, hook_extra_radius=1.5);