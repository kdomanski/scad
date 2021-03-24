use <lib.scad>

holes = [6, 6, 6, 10, 12, 12, 12];
labels = ["3.2", "4.2", "5.2", "6.2", "8.2", "10.3", "12.4"];

cylinder_holder(holes=holes, height=20, chamfer_depth=1, bottom_support=3, labels=true, labels_override=labels, txt_size=5, clearance=0.5);
