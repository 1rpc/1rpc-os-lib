/*
 * A nema standard stepper motor module.
 * 
 * Originally by Hans Häggström, 2010.
 * Dual licenced under Creative Commons Attribution-Share Alike 3.0 and LGPL2 or later
 */

include <1rpc-os-lib/1_const/units.scad>
include <1rpc-os-lib/1_const/colors.scad>
include	<1rpc-os-lib/3_standard/stepper_motor/parameter.scad>






function motorWidth(model=Nema23) = lookup(NemaSideSize, model);
function motorLength(model=Nema23, size=NemaMedium) = lookup(size, model);


module motor(model=Nema23, size=NemaMedium, dualAxis=false, pos=[0,0,0], orientation = [0,0,0]) {

  length = lookup(size, model);

  echo(str("  Motor: Nema",lookup(NemaModel, model),", length= ",length,"mm, dual axis=",dualAxis));

  stepperBlack    = BlackPaint;
  stepperAluminum = Aluminum;

  side = lookup(NemaSideSize, model);

  cutR = lookup(NemaMountingHoleCutoutRadius, model);
  lip = lookup(NemaMountingHoleLip, model);
  holeDepth = lookup(NemaMountingHoleDepth, model);

  axleLengthFront = lookup(NemaFrontAxleLength, model);
  axleLengthBack = lookup(NemaBackAxleLength, model);
  axleRadius = lookup(NemaAxleDiameter, model) * 0.5;

  extrSize = lookup(NemaRoundExtrusionHeight, model);
  extrRad = lookup(NemaRoundExtrusionDiameter, model) * 0.5;

  holeDist = lookup(NemaDistanceBetweenMountingHoles, model) * 0.5;
  holeRadius = lookup(NemaMountingHoleDiameter, model) * 0.5;

  mid = side / 2;

  roundR = lookup(NemaEdgeRoundingRadius, model);

  axleFlatDepth = lookup(NemaAxleFlatDepth, model);
  axleFlatLengthFront = lookup(NemaAxleFlatLengthFront, model);
  axleFlatLengthBack = lookup(NemaAxleFlatLengthBack, model);

  color(stepperBlack){
    translate(pos) rotate(orientation) {
      translate([-mid, -mid, 0]) 
        difference() {          
          cube(size=[side, side, length + extrSize]);
 
          // Corner cutouts
          if (lip > 0) {
            translate([0,    0,    lip]) cylinder(h=length, r=cutR);
            translate([side, 0,    lip]) cylinder(h=length, r=cutR);
            translate([0,    side, lip]) cylinder(h=length, r=cutR);
            translate([side, side, lip]) cylinder(h=length, r=cutR);

          }

          // Rounded edges
          if (roundR > 0) {
                translate([mid+mid, mid+mid, length/2])
                  rotate([0,0,45])
                    cube(size=[roundR, roundR*2, 4+length + extrSize+2], center=true);
                translate([mid-(mid), mid+(mid), length/2])
                  rotate([0,0,45])
                    cube(size=[roundR*2, roundR, 4+length + extrSize+2], center=true);
                translate([mid+mid, mid-mid, length/2])
                  rotate([0,0,45])
                    cube(size=[roundR*2, roundR, 4+length + extrSize+2], center=true);
                translate([mid-mid, mid-mid, length/2])
                  rotate([0,0,45])
                    cube(size=[roundR, roundR*2, 4+length + extrSize+2], center=true);

          }

          // Bolt holes
          color(stepperAluminum, $fs=holeRadius/8) {
            translate([mid+holeDist,mid+holeDist,-1*mm]) cylinder(h=holeDepth+1*mm, r=holeRadius);
            translate([mid-holeDist,mid+holeDist,-1*mm]) cylinder(h=holeDepth+1*mm, r=holeRadius);
            translate([mid+holeDist,mid-holeDist,-1*mm]) cylinder(h=holeDepth+1*mm, r=holeRadius);
            translate([mid-holeDist,mid-holeDist,-1*mm]) cylinder(h=holeDepth+1*mm, r=holeRadius);

          } 

          // Grinded flat
          color(stepperAluminum) {
            difference() {
              translate([-1*mm, -1*mm, -extrSize]) 
                cube(size=[side+2*mm, side+2*mm, extrSize + 1*mm]);
              translate([side/2, side/2, -extrSize - 1*mm]) 
                cylinder(h=4*mm, r=extrRad);
            }
          }

        }

      // Axle
      translate([0, 0, extrSize-axleLengthFront]) color(stepperAluminum) 
        difference() {
                     
          cylinder(h=axleLengthFront + 1*mm , r=axleRadius, $fs=axleRadius/10);

          // Flat
          if (axleFlatDepth > 0)
            translate([axleRadius - axleFlatDepth,-5*mm,-extrSize*mm -(axleLengthFront-axleFlatLengthFront)] ) cube(size=[5*mm, 10*mm, axleLengthFront]);
        }

        if (dualAxis) {
          translate([0, 0, length+extrSize]) color(stepperAluminum) 
            difference() {
                     
              cylinder(h=axleLengthBack + 0*mm, r=axleRadius, $fs=axleRadius/10);

              // Flat
              if (axleFlatDepth > 0)
                translate([axleRadius - axleFlatDepth,-5*mm,(axleLengthBack-axleFlatLengthBack)]) cube(size=[5*mm, 10*mm, axleLengthBack]);
          }

        }

    }
  }
}

module roundedBox(size, edgeRadius) {
    cube(size);

}



module nema_demo(){
    for (size = [NemaShort, NemaMedium, NemaLong]) {  
      translate([-100,size*100,0]) motor(Nema34, size, dualAxis=true);
      translate([0,size*100,0])    motor(Nema23, size, dualAxis=true);
      translate([100,size*100,0])  motor(Nema17, size, dualAxis=true);
      translate([200,size*100,0])  motor(Nema14, size, dualAxis=true);
      translate([300,size*100,0])  motor(Nema11, size, dualAxis=true);
      translate([400,size*100,0])  motor(Nema08, size, dualAxis=true);
    }
}


module StepMotor28BYJ () {
	
	difference(){	
		union(){
			color("gray") cylinder(h = 19, r = 14, center = true, $fn = 32);
			color("gray") translate([8,0,-1.5])	cylinder(h = 19, r = 4.5, center = true, $fn = 32);
			color("gold") translate([8,0,-10])	cylinder(h = 19, r = 2.5, center = true, $fn = 32);

			color("Silver") translate([0,0,-9]) cube([7,35,0.99], center = true);				
			color("Silver") translate([0,17.6,-9])	cylinder(h = 1, r = 3.5, center = true, $fn = 32);

			color("Silver") translate([0,-17.6,-9])	cylinder(h = 1, r = 3.5, center = true, $fn = 32);

			color("blue") translate([-3,0,-1]) cube([28,14.6,16.9], center = true);
        		color("blue") translate([-2,0,0])  cube([24.5,16,15], center = true);
		}
			// handle
		color("red") translate([11,0,-16.55]) cube([4,5,6.1], center = true);
		color("red") translate([5,0,-16.55]) cube([4,5,6.1], center = true);

			// screw holes
		color("red") translate([0,17.5,-9])	cylinder(h = 2, r = 2, center = true, $fn = 32);
		color("red") translate([0,-17.5,-9])	cylinder(h = 2, r = 2, center = true, $fn = 32);
	}
}


//StepMotor28BYJ();






// Demo, uncomment to show:
//nema_demo();
