use <lib.scad>

pilot_hole = 2.5;
plate_thickness = 3;
height = 30;
width = 6;

plate_distance = height - 2*plate_thickness;

difference() {
    cuboid([width, 27, plate_distance], chamfer=0.4);
    fwd(8)  cyl(d=pilot_hole, h=plate_distance+0.01, chamfer=-0.4, $fn=120);
    back(8) cyl(d=pilot_hole, h=plate_distance+0.01, chamfer=-0.4, $fn=120);
}

up(7) back(27/2) down(5.5) hook_array(hole=4.8, h_pitch=15, v_pitch=15, object_width=width, hook_extra_radius=1.5);