use <hooks.scad>

module pliers_holder(num_of_pliers, hole_size, hole_pitch, height=40, chamfer_depth=2, chamfer_angle=60) {
    width = hole_pitch*(num_of_pliers);
    depth = 2*hole_size;
    
    translate([0, 0, -height+10])
    difference(){
        translate([0, 0, height/2])
            cube([width, depth, height], center=true);
    
        last_hole_x = (num_of_pliers-1)*hole_pitch;
        translate([-last_hole_x/2, 0, 0])
        for (i = [0 : hole_pitch : last_hole_x]) {
            translate([i, 0, height-chamfer_depth])
                cylinder(h=chamfer_depth+1, d1=hole_size, d2=hole_size+(2*tan(chamfer_angle)*chamfer_depth), $fn=60);
            
            translate([i, 0, -1])
                cylinder(h=height, d=hole_size, $fn=60);
        }
    }
    
    translate([0, depth/2, 0])
        hook_array(hole=4.8, h_pitch=45, v_pitch=15, object_width=width);
}

pliers_holder(num_of_pliers=4, hole_size=16, hole_pitch=24, height=20, chamfer_depth=2, chamfer_angle=45);
