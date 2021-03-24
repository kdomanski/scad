use <lib.scad>
include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

module pliers_holder(num_of_pliers, hole_size, hole_pitch, height=40, chamfer_depth=2) {
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

pliers_holder(num_of_pliers=4, hole_size=16, hole_pitch=24, height=20, chamfer_depth=2);

