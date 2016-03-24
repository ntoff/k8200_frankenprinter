/*
Notes:

2 holes up the top (as mounted) are for LED's, either some kind of status indicator
or perhaps just illumination. Intended for indicating when the hot end and bed heaters are on.


*/

$fn=32;
include <includes/adjustments.scad>
include <includes/config.scad>

frame_screw = 5;
frame_screw_cap = 10;
thickness = 6;

//27 square

module nema_holes(){
    union(){
        translate([-nema_hole_spacing/2,nema_hole_spacing/2])hole(hole_dia=nema_screw,h=thickness+1,center=true);
        translate([nema_hole_spacing/2,nema_hole_spacing/2])hole(hole_dia=nema_screw,h=thickness+1,center=true);
        translate([nema_hole_spacing/2,-nema_hole_spacing/2])hole(hole_dia=nema_screw,h=thickness+1,center=true);
        translate([-nema_hole_spacing/2,-nema_hole_spacing/2])hole(hole_dia=nema_screw,h=thickness+1,center=true);
        hole(hole_dia=nema_center_hole,h=thickness+1,center=true,$fn=64);
    }
}

module rail_steady(){
    translate([0,0,0])cube([1,16,nema_size_x],center=true);
    translate([-1,0,0])cube([1,12,nema_size_x],center=true); 
    
}

module motor_plate(){
    difference(){
        cube([nema_size_y,nema_size_x,thickness],center=true);
        nema_holes();
        translate([(nema_size_x/2)-(nema_center_hole/2),nema_size_x/2])cube([nema_size_x,nema_size_y,thickness+1],center=true);
        translate([nema_size_x/2,(nema_size_y/2)-(nema_center_hole/2)])cube([nema_size_x,nema_size_y,thickness+1],center=true);
    }
}
module frame_mount(){
    difference(){
        union(){
            translate([-(nema_size_x/2)-(thickness+0.5),-(nema_hole_spacing/2),nema_size_x/2-(thickness/2)])rail_steady();
            translate([-(nema_size_x/2)-(thickness/2),0,(nema_size_x/2)-(thickness/2)])cube([thickness,nema_size_y,nema_size_x],center=true);
            hull(){
                translate([(nema_size_x/2)-(thickness/2),-(nema_size_y/2)-(thickness/2),0])cube([thickness,thickness,thickness],center=true);
                translate([-(nema_size_x/2)-(thickness/2),-(nema_size_y/2)-(thickness/2),(nema_size_x/2)-(thickness/2)])cube([thickness,thickness,nema_size_x],center=true);
            }
        }
        union(){
            translate([-(nema_size_x/2)-(thickness/2),0,14])
            rotate([0,-90]){
                translate([0,-nema_hole_spacing/2])hole(hole_dia=frame_screw,h=thickness+10,center=true);
                translate([18,-nema_hole_spacing/2])hole(hole_dia=frame_screw,h=thickness+10,center=true);
                translate([0,-nema_hole_spacing/2,-10])hole(hole_dia=frame_screw_cap,h=thickness+10,center=true);
                translate([18,-nema_hole_spacing/2,-10])hole(hole_dia=frame_screw_cap,h=thickness+10,center=true);
                
            }
            translate([-(nema_size_x/2)+0.5,12,12])rotate([0,-90])hole(hole_dia=5,h=thickness+10,center=true);
            translate([-(nema_size_x/2)+0.5,12,25])rotate([0,-90])hole(hole_dia=5,h=thickness+10,center=true);
        }
    }
}

union(){
    frame_mount();
    motor_plate();
}