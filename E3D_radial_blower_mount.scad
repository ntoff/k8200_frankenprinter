base_width = 35;
printing = false;

module e3d_cutout(){
    translate([0,5]){
        translate([0,0,-1])cylinder(d=12,h=10); //e3d size
        hull(){ //remp
            translate([0,0,-1])cylinder(d=10.5,h=10);
            translate([0,12,-1])cylinder(d=13,h=10);
        }
    }
}

module base(){
    union(){
        color("red")translate([0,0,5.97/2])cube([base_width,30,5.97],center=true);
        color("yellow")translate([0,-15+1.5,15/2])cube([base_width,3,15],center=true);
        color("cyan")for (i=[-(base_width/2)+3:(base_width-3):base_width]){translate([i,-15+3,5.97])rotate([0,-90])linear_extrude(3)polygon(points=[[0,0],[15-5.97,0],[0,27]]);}
        color("blue")translate([-base_width/2,5,5.97/2])cube([20,40,5.97],center=true);
    }
    
    
}

module fanmount(){
    color("green"){
        translate([-20,28,-8.5])rotate([90,0])cylinder(d=50,h=3); //main roundy bit
        hull(){ //sticky outy bits
            translate([0,28,5.97+5.5])rotate([90,0])cylinder(d=10,h=3,$fn=16);
            translate([-40,28,5.97+5.5-40])rotate([90,0])cylinder(d=10,h=3,$fn=16);
        }
        translate([0,28,5.97+5.5])rotate([-90,0])cylinder(d=7,h=3.4,$fn=16); //spacers on the sticky outy bits
        translate([-40,28,5.97+5.5-40])rotate([-90,0])cylinder(d=7,h=3.4,$fn=16);//spacers on the sticky outy bits
    }
    
    
}

module screwholes(w,d){
    rotate([-90,0])hull(){
        translate([-w/2,0,0])cylinder(d=d,h=10,$fn=32);
        translate([w/2,0,0])cylinder(d=d,h=10,$fn=32);
    } 
        
}

if (printing==true){
    translate([45,0,3])
        rotate([90,0])
            translate([20,-28,8.5])
                fanbkt();
}
else {fanbkt();}

module fanbkt(){
    difference(){
        translate([0,0,2])fanmount();
        //cutouts for fan mount
        union(){
            color("black")translate([-base_width/2,20,5.97/2])screwholes(w=15,d=3.5); // hole for mounting fan back to thing
            translate([0,27.5,5.97+5.5+2])rotate([-90,0])cylinder(d=2.9,h=10,$fn=16,center=true);
            translate([-40,27.5,5.97+5.5-40+2])rotate([-90,0])cylinder(d=2.9,h=10,$fn=16,center=true);
        }
    }
}

difference(){
    base();
    //cutouts for base
    color("black")union(){
        e3d_cutout();
        translate([-base_width/4,-20,10])screwholes(w=5,d=3.5); // hole for mounting to carriage
        translate([base_width/4,-20,10])screwholes(w=5,d=3.5); // hole for mounting to carriage
        color("black")translate([-(base_width/4+2.5),15,5.97/2])screwholes(w=0,d=2.9); // hole for mounting fan back to thing
        color("black")translate([-((base_width/4+2.5)+12),15,5.97/2])screwholes(w=0,d=2.9); // hole for mounting fan back to thing
    }
}



