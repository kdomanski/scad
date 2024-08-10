include <BOSL2/std.scad>
include <BOSL2/shapes.scad>

length = 300;
thickness_side = 1.5;
thickness_top = 1.5;

strip_width = 10;
strip_height = 1.5;


difference() {
    diffusor_width = strip_width + 2*thickness_side;
    
    cuboid([diffusor_width, length, strip_height+0.5+thickness_top],
        chamfer=1, edges=[TOP+LEFT, TOP+RIGHT], anchor=BOTTOM);
        
    translate([0, -0.01, -0.001])
        cuboid([strip_width, length+1, strip_height+0.5],
            chamfer=0.5, edges=[TOP+LEFT, TOP+RIGHT], anchor=BOTTOM);
}
