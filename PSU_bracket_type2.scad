psu_width = 113;
psu_height = 51;

terminal_length = 70;
terminal_width = 12;
terminal_height = 15;
bracket_height = 30;
floor_thickness = 2;
wall_thickness = 3;
back_thickness = 3;
brace_thickness = 4;
profile_thickness = 27;
bolt = 5.2;



rotate([90,0,0])
    union(){
        //the brace pieces
        for (i = [0:(psu_width+(wall_thickness*2))-brace_thickness:(psu_width+(wall_thickness*2))-brace_thickness]){
            translate([0,0,i])
                linear_extrude(brace_thickness)
                    polygon(
                        points = [[0,0],[0,bracket_height+floor_thickness],[profile_thickness,0]]);
        }
        //holes for mounting to frame
        difference(){
            cube([profile_thickness,brace_thickness,psu_width+(wall_thickness*2)]);
            translate([profile_thickness/2,brace_thickness/2,15])rotate([90,0])cylinder(d=bolt,h=brace_thickness+2,center=true);
            translate([profile_thickness/2,brace_thickness/2,(psu_width+(wall_thickness*2))-15])rotate([90,0])cylinder(d=bolt,h=brace_thickness+2,center=true);
        }
        //the box holder for the psu
        difference(){
            //outer casing
            translate([-psu_height-wall_thickness-back_thickness,0,0])cube([psu_height+wall_thickness+back_thickness,bracket_height+floor_thickness,psu_width+(wall_thickness*2)]);
            union(){//the cutouts
            //translate([-psu_height-back_thickness,floor_thickness,wall_thickness])cube([psu_height,bracket_height+0.1,psu_width]);
            difference(){
                translate([-psu_height-back_thickness,floor_thickness,wall_thickness])cube([psu_height,bracket_height+0.1,psu_width]);
                union(){        
                    translate([-5-back_thickness,floor_thickness,wall_thickness])cube([5,5,psu_width]);
                    translate([-psu_height-back_thickness,floor_thickness,wall_thickness])cube([5,12+5,15]);
                    translate([-psu_height-back_thickness,floor_thickness,psu_width+wall_thickness-20])cube([5,12+5,15]);
                    translate([-psu_height-back_thickness,floor_thickness,psu_width+wall_thickness-5])cube([psu_height,5,5]);
                }
            }
            translate([-terminal_height-back_thickness-5,-terminal_width,wall_thickness+11])cube([terminal_height,bracket_height+0.1,terminal_length]);
            }
        }
    }
/**/

