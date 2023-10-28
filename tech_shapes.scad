include <rounded_figures.scad>

module micro_usb_b_male(tight_fit = false, inset = false) {
    sizes = tight_fit ? [
        [7.2, 1.05,  5.1],
        [5.0, 1.05,  5.1],
    ] : [
        [7.6, 1.15,  5.4],
        [5.3, 1.1,  5.4],
    ];

    inset_by = inset ? sizes[0][2] : 0;

    color("darkblue")
    translate([0,0,-inset_by]) hull() {
        cube(sizes[0]);
        translate([(sizes[0][0] - sizes[1][0]) / 2, sizes[0][1], 0]) cube(sizes[1]);
    }
}

module usb_c_male(tight_fit = false, inset = false) {
    sizes = tight_fit ? [8.5, 2.5, 7.5] : [8.7, 2.7, 7.6];

    inset_by = inset ? sizes[2] : 0;

    color("darkblue")
    translate([0,0,-inset_by]) rounded_cube(sizes, flat_minus_z = true, flat_plus_z = true, 1.25);
}

module usb_a_male(tight_fit = false, inset = false) {
    sizes = tight_fit ? [12.4, 4.5, 12.7] : [12.75, 4.7, 12.8];

    inset_by = inset ? sizes[2] : 0;
    
    color("darkblue")
    translate([0,0,-inset_by]) cube(sizes);
}

module usb_b_male(tight_fit = false, inset = false) {
    sizes = tight_fit ? [
        [8.5, 6.1,  12.5],
        [5.0, 1.75,  12.5],
    ] : [
        [8.65, 6.4,  12.7],
        [5.3, 2,  12.7],
    ];

    inset_by = inset ? sizes[0][2] : 0;

    color("darkblue")
    translate([0,0,-inset_by]) hull() {
        cube(sizes[0]);
        translate([(sizes[0][0] - sizes[1][0]) / 2, sizes[0][1], 0]) cube(sizes[1]);
    }

}

module displayport_male(tight_fit = false, inset = false) {
    sizes = tight_fit ? [
        [14, 4.7,  11.4],
        [2, 3.1,  11.4],
    ] : [
        [14.2, 4.9,  11.6],
        [2.1, 3.3,  11.6],
    ];
    
    inset_by = inset ? sizes[0][2] : 0;

    color("darkred")
    translate([0,0,-inset_by]) hull() {
        cube(sizes[0]);
        translate([sizes[0][0], sizes[1][1] - sizes[1][1], 0]) cube(sizes[1]);
    }

}

// HDMI Connector
// HDMI Connector
// HDMI Connector
module hdmi_male(tight_fit = false, inset = false) {
    sizes = tight_fit ? [
        [14, 2.95, 9.6], // top size
        [11.65, 1.6, 9.6], // bottom size
    ] : [
        [14.2, 3.15, 9.8],
        [11.85, 1.8, 9.8],
    ];
    
    inset_by = inset ? sizes[0][2] : 0;
    
    bottom_offset_x = (sizes[0][0] - sizes[1][0]) / 2;

    color("darkred")
    translate([0,0,-inset_by]) hull() {
        cube(sizes[0]);
        translate([bottom_offset_x, sizes[0][1], 0]) cube(sizes[1]);
    }
}
// Mini HDMI Connector
module mini_hdmi_male(tight_fit = false, inset = false) {
    sizes = tight_fit ? [
        [10.5, 1.55, 7.4],
        [8.4, 0.9, 7.4],
    ] : [
        [10.7, 1.75, 7.6],
        [8.6, 1.1, 7.6],
    ];
    
    inset_by = inset ? sizes[0][2] : 0;
    bottom_offset_x = (sizes[0][0] - sizes[1][0]) / 2;

    color("darkred")
    translate([0,0,-inset_by]) hull() {
        cube(sizes[0]);
        translate([bottom_offset_x, sizes[0][1], 0]) cube(sizes[1]);
    }
}

// Micro HDMI Connector
module micro_hdmi_male(tight_fit = false, inset = false) {
    sizes = tight_fit ? [
        [6, 1.7, 7.2],
        [4.55, 0.9, 7.2],
    ] : [
        [6.2, 1.9, 7.4],
        [4.75, 1.1, 7.4],
    ];
    
    inset_by = inset ? sizes[0][2] : 0;
    bottom_offset_x = (sizes[0][0] - sizes[1][0]) / 2;

    color("darkred")
    translate([0,0,-inset_by]) hull() {
        cube(sizes[0]);
        translate([bottom_offset_x, sizes[0][1], 0]) cube(sizes[1]);
    }
}



module battery_aa(tight_fit = false, inset = false) {
    end_radius = tight_fit ? 5.3 / 2 : 5.9 / 2;
    battery_radius = tight_fit ? 14.5 / 2 : 15 / 2;

    inset_by = inset ? 50.5 : 0;

    color("green")
    translate([0,0,-inset_by]) cylinder(h = 1.5, r = end_radius, $fn=32);

    color("green")
    translate([0,0,-inset_by]) translate([0, 0, 1.5]) cylinder(h = 49, r = battery_radius, $fn=64);
}

module battery_aaa(tight_fit = false, inset = false) {
    end_radius = tight_fit ? 3.7 / 2 : 3.9 / 2;
    battery_radius = tight_fit ? 10.4 / 2 : 11 / 2;

    inset_by = inset ? 50.5 : 0;

    color("green")
    translate([0,0,-inset_by]) cylinder(h = 1.5, r = end_radius, $fn=32);

    color("green")
    translate([0,0,-inset_by]) translate([0, 0, 1.5]) cylinder(h = 43, r = battery_radius, $fn=64);
}
