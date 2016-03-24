//these two are needed otherwise you need to put them in
//if you forget it'll complain about unknown variables.
$fn=32;
center=false;

module nut()
{
cylinder(d=(2*(tan(30)*nut_size)),h=nut_h, center=center, $fn=6); // don't do anything here
    //echo ("point to point:"); // this just echoes
    //echo ((tan(30)*nut_size)*2); //the diameter of a circle that will encompass the exterior of the hexagonal shape.
}

module hole()
{ 

    //hole = size of the hole
    //h = height
    cylinder(d=(hole_dia+(hole_dia-(cos(360 / (2*$fn)) * hole_dia) )),h=h,center=center,$fn=$fn); 
    //echo ("real hole diameter");
    //echo ((hole_dia+(hole_dia-(cos(360 / (2*$fn)) * hole_dia) )));
}

