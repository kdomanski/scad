include <BOSL2/std.scad>
include <BOSL2/shapes.scad>

// thread size
size = 8; // [8:M6, 10:M8, 12:M10, 14:M12, 16:M14, 18:M16, 20:M18, 22:M20, 24:M22, 28:M24, 32:M27, 36:M30, 42:M36]
length = 10; // [0:5:200]
angle = 2; // [0:1:45]

a = size;

linear_extrude(length) {
    trapezoid(w1=a*1.5, w2=a, h=2, rounding=0.4, $fn=120);
    fwd(1) {
        left((a/2) - 2.05) {
            zrot(-angle) rect([2, a+2], anchor=RIGHT+BACK);
        }
        right((a/2) - 2.05) {
            zrot(angle) rect([2, a+2], anchor=LEFT+BACK);
        }
    }
}
