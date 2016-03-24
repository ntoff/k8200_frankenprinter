
module k8200_rail(){
    translate([0,-0.5])
    union(){
        linear_extrude(rlen){
            translate([0,1])square([16,1.02],center=true);
            translate([0,2])square([12,1.02],center=true);
        }
    }
}

module k8200_rail_dual(){
    translate([0,0,0])k8200_rail(rlen=rlen);
    translate([-13.5,13.5,0])rotate([0,0,-90])k8200_rail(rlen=rlen);
}

module k8200_rail_profile(){
    k=8;
    difference(){
        minkowski(){
            translate([k/2,k/2,0])cylinder(d=k,h=rlen/2,$fn=30);
            translate([-26.999/2,0,0])cube([26.999-k,26.999-k,rlen/2]);
        }
        #k8200_rail_dual(rlen=40);
        rotate([0,0,180])translate([0,-27,0])k8200_rail_dual(rlen=40);
    }
}

//k8200_rail(rlen=40);
//k8200_rail_dual(rlen=40);
//k8200_rail_profile(rlen=40);