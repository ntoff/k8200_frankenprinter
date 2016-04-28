l=113;
w=25;
h=51;

cutl=70;
cutw=w+5;
cuth=20;

rotate([-90,0,0])
difference(){
    cube([l+3,w+3,h+3],center=true);
    translate([0,-1.5,0])cube([l,w,h],center=true);
    translate([0,1.5,0])cube([l-5,w,h-5],center=true);
    /*
    #union(){
    translate([l/2-cutl/2+1.5-10,0,-((h/2)-(cuth/2)+1.5)])cube([cutl,cutw,cuth],center=true);
    translate([0,-1.5,0])cube([l,w,h],center=true);
    translate([-l/2+15,w/2,-h/2+15])rotate([90,0,0])cylinder(d=8,h=5,$fn=32,center=true);
    }
    /**/
}

