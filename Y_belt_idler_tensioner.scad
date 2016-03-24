/*note: includes a bolt to secure it but doesn't seem to need it, is tight enough to stay there while loose enough
to slide around, possibly self centering? eh, dunno.

Print as is with supports. I couldn't think of a better orientation that kept the rail insert things
perfect. They need to be rather accurate otherwise it might not fit, or might just fall off.
*/

$fn=32;
include <includes/adjustments.scad>
include <includes/config.scad>
bearing_bolt = 6;
bearing_bolt_cap = 12;
thickness = 6;
screw_meat=3.5;
bearing_width =18;

module rail_steady(){
    translate([0,0,0])cube([1,16,bearing_width+(thickness*2)],center=true);
    translate([-1,0,0])cube([1,12,bearing_width+(thickness*2)],center=true); 
    
}

module bearing_plate(){
    difference(){
        hull(){
            translate([-nema_size_x/2+0.5,nema_size_y/2-0.5-5])cube([1,1,thickness],center=true);
            translate([-nema_size_x/2+0.5,-nema_size_y/2+0.5-5])cube([1,1,thickness],center=true);
            translate([nema_size_x/2-23,0])cylinder(d=20,h=thickness,center=true);
            //translate([nema_size_x/2-23,-nema_size_y/2+15])cylinder(d=20,h=thickness,center=true);
            //translate([nema_size_x/2-23,nema_size_y/2-15])cylinder(d=20,h=thickness,center=true);
        }
        hull(){
            translate([-12,0])hole(hole_dia=bearing_bolt,h=thickness+1,center=true);
            translate([-1,0])hole(hole_dia=bearing_bolt,h=thickness+1,center=true);
        }
    }
}

union(){
    color("blue")translate([-(nema_size_x/2)-(thickness+0.49),-(nema_hole_spacing/2),0])rail_steady();
    color("black")translate([-(nema_size_x/2)-(thickness/2),-5,0])cube([thickness,nema_size_y,bearing_width+(thickness*2)],center=true);
    color("green")translate([0,0,-(bearing_width+thickness)/2])bearing_plate();
    color("green")translate([0,0,(bearing_width+thickness)/2])bearing_plate();
    difference(){   
        union(){
            color("red")translate([-(nema_size_x/2)-(thickness+0.5)-(27/2),-(nema_hole_spacing/2)+(27/2),0])rotate([0,0,90])rail_steady(); 
            translate([0,0,-(bearing_width+(thickness*2))/2])linear_extrude(bearing_width+(thickness*2))polygon(points=[[-(nema_size_x/2)-(thickness-0.5)-27,-(nema_hole_spacing/2)+(27/2)+0.49],[-(nema_size_x/2)-(thickness),16],[-(nema_size_x/2)-(thickness),-(nema_hole_spacing/2)+(27/2)+0.49]]);
        }
            union(){
                translate([-(nema_size_x/2)-(thickness+0.5)-(27/2),0])rotate([90,0])hole(hole_dia=bearing_bolt,h=30,center=true);
                translate([-(nema_size_x/2)-(thickness+0.5)-(27/2),7.5-1.5+screw_meat])rotate([90,0])hole(hole_dia=bearing_bolt_cap,h=15,center=true);
            }
    }
}