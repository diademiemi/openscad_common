/*
Rounded rectangle
This is a 2D rectangle with rounded corners

Parameters:
size: [x, y] size of the rectangle
radius: radius of the corners
$fn: number of facets to use for the rounded corners

Usage:
rounded_rectangle([x, y], radius, $fn)

Example:
rounded_rectangle([50, 20], 5);  // A rectangle with all corners rounded, with 5mm radius

*/
module rounded_rectangle(
    size,
    radius,
    $fn = 64) {
    // 2d rectangle with rounded corners

    final_x = size[0] - radius * 2;
    final_y = size[1] - radius * 2;

    hull() {
        translate([radius,radius]) circle(r=radius, $fn=$fn);
        translate([final_x + radius , radius]) circle(r=radius, $fn=$fn);
        translate([radius , final_y + radius]) circle(r=radius, $fn=$fn);
        translate([final_x + radius , final_y + radius]) circle(r=radius, $fn=$fn);
    }

}

/*
Rounded cube
This is a cube with rounded corners, and the option to have flat corners on any of the 6 sides.
The flat corners are useful for making a cube that needs to be flush on one side
If all connecting planes of a corner are flat, then a cube is added to fill in the corner

Parameters:
size: [x, y, z] size of the cube
radius: radius of the corners
flat_plus_x: if true, the plus x side will be flat
flat_plus_y: if true, the plus y side will be flat
flat_plus_z: if true, the plus z side will be flat
flat_minus_x: if true, the minus x side will be flat
flat_minus_y: if true, the minus y side will be flat
flat_minus_z: if true, the minus z side will be flat
$fn: number of facets to use for the rounded corners

Usage:
rounded_cube([x, y, z], radius, flat_plus_x, flat_plus_y, flat_plus_z, flat_minus_x, flat_minus_y, flat_minus_z, $fn)

Example:
rounded_cube([50, 50, 20], 5);  // A cube with all corners rounded, with 5mm radius
rounded_cube([50, 50, 20], 10, flat_minus_z = true); // A cube with all corners rounded, except the bottom, making it easier to set down, with 10mm radius

*/
module rounded_cube(
    size,
    radius = 5,
    flat_plus_x = false,
    flat_plus_y = false,
    flat_plus_z = false,
    flat_minus_x = false,
    flat_minus_y = false,
    flat_minus_z = false,
    $fn = 64) {

    final_x = size[0] - radius * 2;
    final_y = size[1] - radius * 2;
    final_z = size[2] - radius * 2;

    intersection() {

        cube(size);

        union() {
            hull() {
                    translate([radius,radius,radius]) sphere(r=radius, $fn=$fn);
                    translate([final_x + radius , radius , radius]) sphere(r=radius, $fn=$fn);
                    translate([radius , final_y + radius , radius]) sphere(r=radius, $fn=$fn);    
                    translate([final_x + radius , final_y + radius , radius]) sphere(r=radius, $fn=$fn);
                    translate([radius , radius , final_z + radius]) sphere(r=radius, $fn=$fn);
                    translate([final_x + radius , radius , final_z + radius]) sphere(r=radius, $fn=$fn);
                    translate([radius,final_y + radius,final_z + radius]) sphere(r=radius, $fn=$fn);
                    translate([final_x + radius,final_y + radius,final_z + radius]) sphere(r=radius, $fn=$fn);
                }

            // Draw spheres that are hull'd to make the rounded corners


            hull() {
                if (flat_plus_x) {
                    translate([size[0] - radius, 0, size[2]]) rotate([0, 90, 0]) linear_extrude(radius) rounded_rectangle([size[2], size[1]], radius, $fn=$fn);
                }
                if (flat_minus_x) {
                    translate([0, 0, size[2]]) rotate([0, 90, 0]) linear_extrude(radius) rounded_rectangle([size[2], size[1]], radius, $fn=$fn);
                }
                if (flat_plus_y) {
                    translate([0, size[1], 0]) rotate([90, 0, 0]) linear_extrude(radius) rounded_rectangle([size[0], size[2]], radius, $fn=$fn);
                }
                if (flat_minus_y) {
                    translate([0, radius, 0]) rotate([90, 0, 0]) linear_extrude(radius) rounded_rectangle([size[0], size[2]], radius, $fn=$fn);
                }
                if (flat_plus_z) {
                    translate([0, 0, size[2] - radius]) linear_extrude(radius) rounded_rectangle([size[0], size[1]], radius, $fn=$fn);
                }
                if (flat_minus_z) {
                    translate([0, 0, 0]) linear_extrude(radius) rounded_rectangle([size[0], size[1]], radius, $fn=$fn);
                }
            }

            hull() {
                // For all 8 corners, if they're all flat, then add a cube to fill in the corner
                // Bottom front left
                if (flat_minus_x && flat_minus_y && flat_minus_z) {
                    translate([0, 0, 0]) cube([radius, radius, radius]);
                }
                // Bottom front right
                if (flat_plus_x && flat_minus_y && flat_minus_z) {
                    translate([size[0] - radius, 0, 0]) cube([radius, radius, radius]);
                }
                // Bottom back left
                if (flat_minus_x && flat_plus_y && flat_minus_z) {
                    translate([0, size[1] - radius, 0]) cube([radius, radius, radius]);
                }
                // Bottom back right
                if (flat_plus_x && flat_plus_y && flat_minus_z) {
                    translate([size[0] - radius, size[1] - radius, 0]) cube([radius, radius, radius]);
                }
                // Top front left
                if (flat_minus_x && flat_minus_y && flat_plus_z) {
                    translate([0, 0, size[2] - radius]) cube([radius, radius, radius]);
                }
                // Top front right
                if (flat_plus_x && flat_minus_y && flat_plus_z) {
                    translate([size[0] - radius, 0, size[2] - radius]) cube([radius, radius, radius]);
                }
                // Top back left
                if (flat_minus_x && flat_plus_y && flat_plus_z) {
                    translate([0, size[1] - radius, size[2] - radius]) cube([radius, radius, radius]);
                }
                // Top back right
                if (flat_plus_x && flat_plus_y && flat_plus_z) {
                    translate([size[0] - radius, size[1] - radius, size[2] - radius]) cube([radius, radius, radius]);
                }
            }

        }

    }

}
