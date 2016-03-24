include <includes/adjustments.scad>

//lm8uu 15 dia 24 len
bearing_dia = 15;
bearing_length = 24;
screw_hole = 5;   //mount screw hole diameter
bearing_dist = 20; //center of bearing to flat mount surface
nut_size = 8;   //size of the hex nut (what size spanner fits it)
outset = 5; //arbitrary distance for the screws away from the bearing holder. Adjust by eye.
carriage_length = 95; //must be > 52 
$fn = 100;


module carrier(){
    union(){
        //bearing holder
        difference(){
            linear_extrude(bearing_dist+1.5)translate([0,0])square([bearing_dia + outset,bearing_length + 2],center=true); //main square bearing holder bit
            translate([0,0,bearing_dist])
                rotate([90,0])
                    union(){
                        hull(){
                            translate([0,0,0])cylinder(d=bearing_dia - 2,h=bearing_length + 5,center=true); //hole for the rod
                            translate([0,4,0])cylinder(d=bearing_dia,h=bearing_length + 5,center=true); //other bit of the hole for the rod
                        }
                        translate([0,0,0])cylinder(d=bearing_dia,h=bearing_length,center=true); //THE BEARING!
                    difference(){
                        translate([0,0,0])cylinder(d=bearing_dia + 9,h=8,center=true); //zip tie hole
                        translate([0,0,0])cylinder(d=bearing_dia + 4,h=8.1,center=true);//zip tie hole
                        }
                    }
        }

        //base
        difference(){
            linear_extrude(5)
                difference(){
                hull(){
                    translate([0,0])square([bearing_dia + 2,bearing_length + 2],center=true); //main square base
                    translate([(bearing_dia/2)+screw_hole+outset,0])circle(d=screw_hole+nut_size,$fn=32); //outey bit
                    translate([-(bearing_dia/2)-screw_hole-outset,0])circle(d=screw_hole+nut_size,$fn=32); //other outey bit
                }
                translate([(bearing_dia/2)+screw_hole+outset,0])circle(d=screw_hole,$fn=32); //the screw holes
                translate([-(bearing_dia/2)-screw_hole-outset,0])circle(d=screw_hole,$fn=32); //the screw holes
            }
            translate([(bearing_dia/2)+screw_hole+outset,0,3])nut(nut_size=nut_size,nut_h=6); //hex nut inset to avoid having to use spanners
            translate([-(bearing_dia/2)-screw_hole-outset,0,3])nut(nut_size=nut_size,nut_h=6); //hex nut inset to avoid having to use spanners
        }
    }
}

//this just puts 2 of them down connected via a bit of stuff to keep them aligned. Remove and just use 'carrier();' for a single bearing holder
union(){
    linear_extrude(5)translate([0,carriage_length/2,0])square([15,carriage_length],center=true);
    translate([0,13,0])carrier();
    translate([0,carriage_length-13,0])carrier();
}
translate([bearing_dia*2+25,0])
union(){
    linear_extrude(5)translate([0,carriage_length/2,0])square([15,carriage_length],center=true);
    translate([0,13,0])carrier();
    translate([0,carriage_length-13,0])carrier();
}
/**/
//carrier(); //single bearing holder