/*
Circular arc
This can create a semi-circle, quarter circle or anything in between or up to a full circle.

Parameters:
radius: Radius of the arc
height: Height of the cylinder
angle: Angle of the arc in degrees (0-360)
$fn: Number of fragments to use for the arc

Usage:
circular_arc(radius=10, height=5, angle=90, $fn=100);

Example:
circular_arc(radius=10, height=5, angle=90, $fn=100);  // quarter circle to a cylinder with radius 10 and height 5
circular_arc(radius=10, height=5, angle=180, $fn=100); // semi-circle to a cylinder with radius 10 and height 5

*/
module circular_arc(
    radius,
    height,
    angle,
    $fn=$fn) {
    rotate_extrude(angle = angle, convexity = 10, $fn=$fn) {
        translate([0, 0, 0]) square([radius, height]);
    }
}
