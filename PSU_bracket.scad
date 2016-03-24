$fn=32;
include <includes/adjustments.scad>
include <includes/config.scad>
include <includes/k8200_rail.scad>

//size of the PSU, most of it is just for reference as only the width is used
psu_length = 200;
psu_width = 110;
psu_height = 50;

rlen = psu_width-27;//-27 because it hangs over a bit of the extrusion that runs 90 degrees

rotate([90,0])
difference(){
    union(){
        color("blue")translate([0,0,27])k8200_rail_dual(); //bit that clips into the extrusions

        color("red")linear_extrude(psu_width){ //support brace triangle + flat upright
            polygon(
                points = [[-13.5,0],[-13.5,27],[-13.5-40,0]]);
                
            polygon(
                points = [[13.5,0],[13.5,-3],[-13.5-60,-3],[-13.5-60,0]]);
        }
    }   
    color("green")translate([-4,0,4])linear_extrude(psu_width-8)//the back brace support triangle cutout
        polygon(
            points = [[-13.5,0],[-13.5,27],[-13.5-40,0]]);
    //below can be removed for extra strength, cutouts just to try to lessen the print time/material used
        translate([-18,-6,50])cube([50,50,psu_width-75]);
        translate([-13.5,-6,0])cube([50,50,27]);
}
    


//k8200_rail_profile();