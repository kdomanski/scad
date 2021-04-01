use <lib.scad>

holes = [6, 6, 6, 10, 12, 12, 12];
labels = ["3.2", "4.2", "5.2", "6.2", "8.2", "10.3", "12.4"];

// cylinder_holder(holes,
//    height=40,
//    chamfer_depth=2,
//    bottom_support=0,
//    labels=false,
//    labels_override=[],
//    txt_size=?,
//    clearance_around_drill=0,
//    clearance_around_hole=2);
cylinder_holder(holes=holes, height=20, chamfer_depth=1, bottom_support=3, labels=true, labels_override=labels, txt_size=5, clearance_around_drill=0.5, clearance_around_holes=2);
