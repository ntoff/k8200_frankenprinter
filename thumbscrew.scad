nutsize = 6; //size of the nut as dictated by the size of spanner that fits.
bolt_size = 3.2; //size of your bolt + clearance because you don't want it to be a tight fit, you need it loosey goosey.
thumbwheel_thickness = 4; //how thick is your jam, man?
rim_height = 2; //height of the rim above the thumb wheel.
weel_diameter = 20; //diameter of the thumb wheel part. It's wheely not that critical *evil laugh*.
rotation_step  = 10; //smaller number = finer "teeth".
rotation_end = 90; //no need to go larger than 90. Lower number = stylish bro.
flipped = true; //change to have the nut come in from the other side.

//don't touch below here
n=16;
nutdia=2*(tan(30)*nutsize);
new_dia = (2*bolt_size) - (bolt_size * cos(180/n));

module wheel(){
    difference(){
    union(){
        cylinder(d=nutdia+3,h=thumbwheel_thickness + rim_height,$fn=64);
        for (i=[0:rotation_step:rotation_end]){
            rotate([0,0,i])cylinder(d=weel_diameter,h=thumbwheel_thickness,$fn=4);
        }
    }
    if (flipped == true){
        translate([0,0,-2])color("yellow")cylinder(d=nutdia,h=thumbwheel_thickness+rim_height, $fn=6);
    }
    else {
        translate([0,0,2])color("yellow")cylinder(d=nutdia,h=thumbwheel_thickness+rim_height, $fn=6);
    }
    translate([0,0,-0.5])color("red")cylinder(d=new_dia,h=8,$fn=n);
    }
    //below here doesn't get rendered to STL, it's just for reference and information. Will show up with F5 but F6 will ignore it.
    %cylinder(d=weel_diameter,h=thumbwheel_thickness+rim_height,$fn=128);
    echo ("thumbwheel diameter =", weel_diameter, "total height =", thumbwheel_thickness+rim_height);
}

for (i =[0:3]){
    translate([(i % 2)*(weel_diameter)*1.1,(i - i % 2)*(weel_diameter/1.8)])wheel();
}