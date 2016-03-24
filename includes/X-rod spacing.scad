include <config.scad>
include <adjustments.scad>

module x_rod_spacing() {
    translate([0,0,0])cube([x+10,y+10,4],center=true);
}

module block_bolt_cutouts(){
    translate([-x/2,-y/2,0])cylinder(d=block_bolt_size+clearance, h=5,center = true);
    translate([-x/2,y/2,0])cylinder(d=block_bolt_size+clearance, h=5,center = true);
    translate([x/2,-y/2,0])cylinder(d=block_bolt_size+clearance, h=5,center = true);
    translate([x/2,y/2,0])cylinder(d=block_bolt_size+clearance, h=5,center = true);
    
    translate([-x/2,-y/2,30/2+2.1])cylinder(d=block_bolt_head+clearance, h=30,center = true);
    translate([-x/2,y/2,30/2+2.1])cylinder(d=block_bolt_head+clearance, h=30,center = true);
    translate([x/2,-y/2,30/2+2.1])cylinder(d=block_bolt_head+clearance, h=30,center = true);
    translate([x/2,y/2,30/2+2.1])cylinder(d=block_bolt_head+clearance, h=30,center = true);
    
    translate([0,-y/2,23])cube([x+11,1,20],center=true);
    translate([0,y/2,23])cube([x+11,1,20],center=true);
    
    translate([0,0,23])rotate([90,0,0])nut(nut_size=8,nut_h=y-10,center=true);
    translate([0,0,23])rotate([90,0,0])cylinder(d=5+clearance,h=y+25,center=true);
}

module smooth_rod_block(){
    translate([0,-y/2,30/2-2])cube([x+10,20,30],center=true);
    translate([0,y/2,30/2-2])cube([x+10,20,30],center=true);
 }
 
 module smooth_rods(){
    translate([0,-y/2,15])rotate([0,90,0])cylinder(d=10.3,h=450,center=true,$fn=64);
    translate([0,y/2,15])rotate([0,90,0])cylinder(d=10.3,h=450,center=true,$fn=64);
 }
 