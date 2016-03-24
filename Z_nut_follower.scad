/*
todo: clean this crap up, includes are including includes.

*/
include <includes/X-rod spacing.scad> //this one in particular is a mess.
include <includes/adjustments.scad>
include <includes/config.scad>

//y and z_nut are found in config.scad
housing = z_nut+6;
housing_length = y-6;

//probably wrong, I'm no good with math
//point1 = sin(30)*(tan(30)*(housing));
point2 = (tan(30)*(housing));
point1 = sin(30)*point2;
//echo (point1);
//echo (point2);

module nutygon(){ //this bit makes the outer housing for the nut that connects to the flat plate.
    linear_extrude((housing_length)/2)
    polygon(
        points = [[(housing)/2,0],[(housing)/2,point1],[0,point2],[-(housing)/2,point1],[-(housing)/2,-point2],[(housing)/2,-point2]]);
}

module z_follower(){
    union(){
        difference(){
            translate([0,0,0])cube([x+10,y+10,3],center=true); //the flat plate
            block_bolt_cutouts(); //this is a mess. creates the holes for the 4 bolts.
        }
        translate([0,0,10])
            rotate([90,0,0])
                difference(){
                    union(){
                        nutygon();
                        mirror([0,0,1])nutygon();
                    }
                    rotate([0,0,30])cylinder(d=z_rod+2,h=housing_length+1,center=true,$fn=36); //hole for the threadded rod to go through
                    translate([0,0,-(housing_length/2)+8])rotate([0,0,30])nut(nut_size=z_nut,nut_h=housing_length); //top bit where the spring loaded nut goes
                    translate([0,0,-(housing_length/2)-0.01])rotate([0,0,30])nut(nut_size=z_nut,nut_h=6); //bottom nut goes in here
                }
    }
}

z_follower();
translate([x+11,0])z_follower();


