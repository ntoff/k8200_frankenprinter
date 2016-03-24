module nema_mount() {
    difference(){
        cube([46,42,6],center=true);
        translate([-3,0,0])cylinder(d=24,h=7,center=true);
        translate([10,0,0])cube([27,24,7],center=true);
        translate([31/2,-31/2,0])screw_cutouts();
        translate([-31/2,-31/2,0])screw_cutouts();
        translate([-31/2,31/2,0])screw_cutouts();
        translate([31/2,31/2,0])screw_cutouts();
    }
}

module nema_mount_supported() {
    difference(){
        union(){
        translate([0,21+3,15-3])cube([42,6,30],center=true); //support sides should be polyhedron but this'll do for now
        translate([0,-21-3,15-3])cube([42,6,30],center=true); //support sides should be polyhedron but this'll do for now
        cube([46,42,6],center=true);
        }
        translate([-3,0,0])cylinder(d=24,h=7,center=true);
        translate([10,0,0])cube([27,24,7],center=true);
        translate([31/2,-31/2,0])screw_cutouts();
        translate([-31/2,-31/2,0])screw_cutouts();
        translate([-31/2,31/2,0])screw_cutouts();
        translate([31/2,31/2,0])screw_cutouts();
         translate([7,0,28])rotate([0,35,0])cube([50,70,20],center=true);
    }
}

module screw_cutouts(){
translate([-3.5,0,0])cylinder(d=3.5,h=7,center=true,$fn=16);
cube([3.5*2,3.5,7],center=true);
translate([3.5,0,0])cylinder(d=3.5,h=7,center=true,$fn=16);
}
//nema_mount();