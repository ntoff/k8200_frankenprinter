$fn=64;

module bed_spring_washer(){
    //washers for the springs on the bed
    large_dia=11;
    small_dia=7;
    thickness=1.5;
    thickness_small=thickness*2;
    hole=3.5;

    difference(){
        union(){
            cylinder(d=small_dia,h=thickness_small);
            cylinder(d=large_dia,h=thickness);
        }
        cylinder(d=hole,h=thickness_small);
    }

}

module extruder_tensioner_washer(){
    dia=9;
    hole=4;
    thickness=1.5;
    
    difference(){
        cylinder(d=dia,h=thickness);
        cylinder(d=hole,h=thickness);
    }
}

//for (i=[0:7])translate([(i%4)*12,(i-i%4)*3,0])bed_spring_washer();
union(){
    translate([2,20])cube([8,8,1.5]);    
    translate([0,26])cube([12,15,1.5]);   
    for (i=[0:12:20])translate([i,24])extruder_tensioner_washer();
}