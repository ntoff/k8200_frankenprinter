/*Note: They were originally going to be adjustable but getting them level and straight
was a pain so added the static option. If adjustment is desired then set static to false

designed to use zip ties to hold rods but they seem tight enough without. YMMV.
*/

include <includes/config.scad>
include <includes/adjustments.scad>

$fn = 32;   //how round stuff is
screw = 5;  //diameter of the screw, adjustments.scad should add wiggle room
screw_cap = 12; //how fat the head of the screw is + a bit of wiggle room
zip_tie = 3;    //how thick the zip tie is, not how wide
rod_to_hole = 22; //distance from the center of the rod to the center of the slotted hole.
height = 15; //height of the piece
static = false; //allows it to be adjustable or not
length = rod_to_hole + 15; //overall length of the piece, more or less automatic but adjust as needed.


module y_rod_mount(){
    difference(){
        union(){
            hull(){
                cylinder(d=Y_rod_diameter+10,h=height);
                translate([0,10,height/2])cube([20,1,height],center=true);
                translate([0,length,height/2])cube([20,1,height],center=true);
                #translate([0,rod_to_hole,0])cylinder(d=2,h=height); //marks the middle of the adjustable mount screw hole
            }
            if (static == true)
                    {
                        translate([0,rod_to_hole,-1.5]){
                        translate([0,0,-1.5])linear_extrude(1.5)square([20,12],center=true);
                        linear_extrude(1.5)square([20,16],center=true);
                        }
                    }
        }

        union(){
            #translate([0,0,-5])hole(hole_dia=Y_rod_diameter,h=height+10,center=false);
            translate([0,(Y_rod_diameter/2)+zip_tie/2-0.5,height/2])cube([35,zip_tie,height-6],center=true);
            translate([7.5,0,height/2])cube([15,1,height+2],center=true);

            hull(){//adjustable mounting screw cutout
                translate([0,rod_to_hole-5,-5])hole(hole_dia=screw,h=40,center=false);
                translate([0,rod_to_hole+5,-5])hole(hole_dia=screw,h=40,center=false);
            }

            hull(){//adjustable mounting screw cap cutout
                translate([0,rod_to_hole-5,5])cylinder(d=screw_cap,h=40);
                translate([0,rod_to_hole+5,5])cylinder(d=screw_cap,h=40);
            }
        }
    }
}
for (i = [0 : 30 : 90]){
rotate([0,180]){
    translate([-i,0])y_rod_mount(static=true);
    translate([-i,0])y_rod_mount(static=true);
    translate([-i,0])y_rod_mount(static=true);
    translate([-i,0])y_rod_mount(static=true);

}
}