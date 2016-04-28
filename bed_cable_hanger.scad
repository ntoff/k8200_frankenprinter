//5.5 70 42 15

nut=6;

module nut()
    {
    cylinder(d=(2*(tan(30)*nut_size)),h=nut_h, center=center, $fn=6); // don't do anything here
        //echo ("point to point:"); // this just echoes
        //echo ((tan(30)*nut_size)*2); //the diameter of a circle that will encompass the exterior of the hexagonal shape.
    }


difference(){
    union(){
        minkowski(){
            cube([5,60,4.5]);
            translate([5,5])cylinder(d=10,h=4.5,$fn=32);
        }
        //translate([10,42,9])rotate([0,0,30])cube([25,8,5]);
        
        translate([6,49,9])
            rotate([90,0,30])
                linear_extrude(8)polygon(
                    points = [[0,-4],[15,0],[25,0],[25,5],[15,5],[0,0]]);
    }

    union(){
        translate([25,55,17])
            rotate([0,90,30])
            difference(){
                cylinder(d=20,h=4,$fn=32);
                cylinder(d=15,h=4,$fn=32);
            }
        translate([15,50,14])rotate([0,90,30])cylinder(d=5,h=20,$fn=16);
        translate([-3,0,(9-3.2)/2])cube([15,70,3.2]);
        translate([15-3-5.5,15,0])cylinder(d=3.4,h=10,$fn=16);
        translate([15-3-5.5,15,9-1.2])nut(nut_size=nut,nut_h=4,center=false);
    }
}


%cube([15,70,9]);
