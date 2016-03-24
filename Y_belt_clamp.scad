/* 
Bed to bolt motor end: 21
Bed to bolt idler end: 16

Note: Belt is a tiny bit loose (or at least mine is) with current settings which is good
and allows for some wiggle room so it self centers. Nothing worse than a belt clamped in
crooked making it want to wander around.

Not loose enough to pull out or affect tensioning though.
*/

include <includes/adjustments.scad>


hole_width = 18; //stupid name for how far apart the holes are
mount_bolt_dia = 5.1; //usually hole() will take care of clearance but for some reason it's a bit tight with 5.0mm so 5.1 for clearance.
nut_size = 8; //how big are your nuts, nut() will take care of the clearance so just measure them with calipers.
belt_pitch = 2; //distance between the teeth
belt_width = 6.4; //how wide the belt
belt_tooth = 1; //how thick the teeth are

module spacer(){
    difference(){
        //cube spacer
        translate([0,0,bed_to_belt/2])cube([hole_width+15,mount_bolt_dia+10,bed_to_belt],center=true);
        union(){
            //bolts
            translate([-hole_width/2,0,bed_to_belt/2])hole(hole_dia=mount_bolt_dia,h=bed_to_belt+1,center=true,$fn=32);
            translate([hole_width/2,0,bed_to_belt/2])hole(hole_dia=mount_bolt_dia,h=bed_to_belt+1,center=true,$fn=32);
            //nuts
            translate([-hole_width/2,0,4])rotate([0,0,30])nut(hole_dia=nut_size,nut_h=bed_to_belt,center=false,$fn=32);
            translate([hole_width/2,0,4])rotate([0,0,30])nut(hole_dia=nut_size,nut_h=bed_to_belt,center=false,$fn=32);
        }
    }
}
module clamp(){
        difference(){
        //cube clamp
        translate([0,0,0])cube([hole_width+15,mount_bolt_dia+10,5],center=true);
        union(){
            //bolts
            translate([-hole_width/2,0,0])hole(hole_dia=mount_bolt_dia,h=6,center=true,$fn=32);
            translate([hole_width/2,0,0])hole(hole_dia=mount_bolt_dia,h=6,center=true,$fn=32);
            //belt teeth grips
            for (i = [-mount_bolt_dia-belt_pitch:belt_pitch:mount_bolt_dia+belt_pitch]){
                translate([0,i,1.5])cube([belt_width,belt_tooth,2],center=true);
                
            }
            translate([0,0,2.5])cube([belt_width,mount_bolt_dia+10,2],center=true);
        }
    }
}

spacer(bed_to_belt = 16); //idler end
translate([0,-mount_bolt_dia-15,0])spacer(bed_to_belt = 21); //motor end
translate([0,mount_bolt_dia+15,2.5])clamp();
translate([0,(mount_bolt_dia+15)*2,2.5])clamp();


