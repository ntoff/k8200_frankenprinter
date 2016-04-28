kano = 8;

difference(){
    union(){
        color("blue")cube([5,15,12]);
        translate([-0.1,0,10])color("blue")cube([5.2,15,2]);
        color("red")cube([20,15,5]);
        translate([20,-10])color("green")cube([5,25,kano]);
    
    }
    translate([1.5,0,3])cube([2,15,15]);
    translate([2.5,7.5])cylinder(d=2.8,h=15);
    translate([20,-10]){
        #translate([5,0,kano/2])rotate([-90,0,0])cylinder(d=5,h=12);
        #translate([5,11,kano/2])rotate([-100,0,0])cylinder(d=5,h=8);
        #translate([5,15,kano/2-0.5])rotate([-110,0,0])cylinder(d=5,h=8);
        #translate([5,19,kano/2-2])rotate([-120,0,0])cylinder(d=5,h=8);
    }
}

