include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

chuck_shield_width=85;
chuck_ring_diameter=100;
hole_x_offset=5;
hole_y_offset=-25;
thickness=10;
chamfer=1;
pivot_chamfer=0.3;
pivot_width=25;
pivot_d=5;
warning_text="KEEP CLOSED";

side_overhang_x=tan(60)*abs(hole_y_offset);
total_width=chuck_ring_diameter+(2*hole_x_offset);
center_segment_width=total_width-(2*side_overhang_x);

module side_overgang(pivot=false) {
    difference(){
        hull() {
            cyl(h=chuck_shield_width, d=thickness, chamfer=chamfer, $fn=60);
            translate([side_overhang_x, hole_y_offset, 0])
                cyl(h=chuck_shield_width, d=thickness, chamfer=chamfer, $fn=60);
        }
        if(pivot) {
            difference() {
                translate([side_overhang_x, hole_y_offset, (pivot_width/2)+0.01])
                    zrot(60)
                        cube([thickness+0.01, thickness*2, chuck_shield_width-pivot_width+0.02], center=true);
                translate([side_overhang_x-(sin(60)*thickness), hole_y_offset+(cos(60)*thickness), 0])
                    cyl(h=chuck_shield_width, d=thickness, chamfer=chamfer, $fn=60);
            }
            translate([side_overhang_x, hole_y_offset, -(chuck_shield_width/2)+(pivot_width/2)])
                cyl(h=pivot_width+0.01, d=pivot_d, chamfer=-pivot_chamfer, $fn=60);
        }
    }
}

right(center_segment_width/2) side_overgang(pivot=true);
left(center_segment_width/2) yrot(180) side_overgang(pivot=false);
difference() {
    hull() {
        left(center_segment_width/2) cyl(h=chuck_shield_width, d=thickness, chamfer=chamfer, $fn=60);
        right(center_segment_width/2) cyl(h=chuck_shield_width, d=thickness, chamfer=chamfer, $fn=60);
    }
    fwd((thickness/2)-2.99)
        rotate([90, -90, 0])
            linear_extrude(height=3)
                text(text=warning_text, size=8, halign="center", valign="center");
}
