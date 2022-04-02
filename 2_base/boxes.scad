/** @~de
	@file 
	@brief Abgerundete Rechtecke
	@version 1.0
	@author Marius Kintel
	@author Christof Hahn
	
*/

// roundedBox([width, height, depth], float radius, bool sidesonly);

// EXAMPLE USAGE:
// roundedBox([20, 30, 40], 5, true);

// size is a vector [w, h, d]

/**
	@brief Draws a roundet box
	@code
								roundedBox			( [ 100 , 90 , 80 ] , 5 , false );
	translate  ( [ 105 ,0,0 ] )	roundedBox			( [ 100 , 90 , 80 ] , 5 , true );
	@endcode
*/ 


module roundedBox(size, radius, sidesonly) {
	
  rot = [ [0,0,0], [90,0,90], [90,90,0] ];
	
  if (sidesonly) {
    cube(size - [2*radius,0,0], true);
    cube(size - [0,2*radius,0], true);
    for (x = [radius-size[0]/2, -radius+size[0]/2],
           y = [radius-size[1]/2, -radius+size[1]/2]) {
      translate([x,y,0]) cylinder(r=radius, h=size[2], center=true, $fn=200);
    }
  } else {
    cube([size[0], size[1]-radius*2, size[2]-radius*2], center=true);
    cube([size[0]-radius*2, size[1], size[2]-radius*2], center=true);
    cube([size[0]-radius*2, size[1]-radius*2, size[2]], center=true);

    for (axis = [0:2]) {
      for (x = [radius-size[axis]/2, -radius+size[axis]/2],
             y = [radius-size[(axis+1)%3]/2, -radius+size[(axis+1)%3]/2]) {
        rotate(rot[axis])
          translate([x,y,0])
          cylinder(h=size[(axis+2)%3]-2*radius, r=radius, center=true, $fn=200);
      }
    }
    for (x = [radius-size[0]/2, -radius+size[0]/2],
           y = [radius-size[1]/2, -radius+size[1]/2],
           z = [radius-size[2]/2, -radius+size[2]/2]) {
      translate([x,y,z]) sphere(r=radius, $fn=100);
    }
  }
}//----- roundedBox ----------------------------------------------------------------------------


/**
	@brief Draws a rounded hollow box

	@code
	translate  ( [ 210,0,0 ] )	roundedHollowBox	( [ 100 , 90 , 80 ] , 10 , 20 , false );
	translate  ( [ 315,0,0 ] )	roundedHollowBox	( [ 100 , 90 , 80 ] , 5 , 2 , true );
	@endcode
*/ 

module roundedHollowBox(size, radius, wallthickness, sidesonly) {
	
	X = size [0] - 2 * wallthickness;
	Y = size [1] - 2 * wallthickness;
//	Z = size [2] - 2 * wallthickness;
	Z = size [2];
	
	difference () {	
		roundedBox ( size, radius, sidesonly );
		translate ( [ 0,0, wallthickness] ) roundedBox ( [X,Y,Z] , radius, sidesonly );
	}
	
}

module roundedHollowBox2(size, radius, size2 , sidesonly ) {
	
	X = size [0] - 2 * wallthickness;
	Y = size [1] - 2 * wallthickness;
//	Z = size [2] - 2 * wallthickness;
	Z = size [2];
	
	difference () {	
		roundedBox ( size, radius, sidesonly );
		translate ( [ 0,0, wallthickness] ) roundedBox ( [X,Y,Z] , radius, sidesonly );
	}
	
}






module roundedBox2 (size = [100,100,100] , radius = [10,10,10], roundedBottom = true , roundedTop= true, roundedSides ) {
	
	
  difference () {
  
     hull () {
	   translate ( 0,0,90 ) cube ( [100,100,10 ] ); 
	   translate ( 0 ,0,0 ) sphere ( d = 10 ); // radius [0] ); 
	   translate ( 0 ,90,0 ) sphere ( d = 10 ); 
	   translate ( 90 ,0,0 ) sphere ( d = 10 ); // radius [0] ); 
	   translate ( 90 ,90,0 ) sphere ( d = 10 ); 
//	   translate ( size[0] - radius [0] /2 ,0,0 ) sphere ( d = radius [0] ); 
//	   translate ( size[0] - radius [0] /2 ,0,0 ) sphere ( d = radius [0] ); 
	 
	 }
 }  
}
	


module roundedBox3 ( aSize = [100,100,1] , aRadius = 5 ) {
	
	
  difference () {
  
     hull () 	  {
	   translate ( [ aRadius , aRadius , 0 ] ) cube ( [ aSize [0] - 2 * aRadius , aSize [1] - 2 * aRadius, aSize [2] ] ); 
	   translate ( [ aRadius , aRadius , 0 ] ) cylinder ( r = aRadius , h = aSize [2] ); // radius [0] ); 
	   translate ( [ aRadius , aSize [1] - aRadius , 0 ] ) cylinder ( r = aRadius , h = aSize [2] ); // radius [0] ); 
	   translate ( [ aSize [0] - aRadius , aRadius , 0 ] ) cylinder ( r = aRadius , h = aSize [2] ); // radius [0] ); 
	   translate ( [ aSize [0] - aRadius , aSize [1] - aRadius , 0 ] ) cylinder ( r = aRadius , h = aSize [2] ); // radius [0] ); 
	 
	 }
 }  
}

//roundedBox3 ();







/**

	@brief 

@parameter size [in] b
*/

module roundedcube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "all") {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "all") ||
							(apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
							(apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
						) {
							sphere(r = radius, $fn=10);
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							rotate(a = rotate)
							cylinder(h = diameter, r = radius, center = true, $fn = 24);
						}
					}
				}
			}
		}
	}
}//---- roundedcube -----------------------------------------------------------------------------------------------------


/** 
	@brief insert for storage systems

	@param aX,aY,aZ Size of the Box
	@param aWallSize	
	@param aColor	aColor

	That's a typical insert box for storage systems like Allit EuroPlus System, or Bosch L-Boxx, Festools Systainer Organizer. 
*/


module insertbox ( aX=54, aY=54, aZ =63 , aWallSize = 2, aColor = "Red" ) {
	
	color ( aColor ) difference ()  {
		roundedcube ( size=[ aX, aY ,aZ ] , center = false, radius = 3, apply_to = "zmin"); 
		translate ( [ aWallSize, aWallSize, aWallSize ] ) roundedcube ( size=[ aX - 2 * aWallSize, aY - 2 * aWallSize , aZ +1  ] , center = false, radius = 3, apply_to = "zmin"); 
	}
}

module insertBox ( aSize = [ 54,54,63] , aWallSize = 2, aColor = "Red" ) {
	
	color ( aColor ) difference ()  {
		roundedcube ( size= aSize , center = false, radius = 3, apply_to = "zmin"); 
		translate ( [ aWallSize, aWallSize, aWallSize ] ) roundedcube ( size=[ aSize [0] - 2 * aWallSize, aSize[1] - 2 * aWallSize , aSize[2] +1  ] , center = false, radius = 3, apply_to = "zmin"); 
	}
}


module insertBox2 ( aSize = [ 54,54,63] , aWallSize = 2, aColor = "Red" ) {
	
	color ( aColor ) 
		roundedHollowBox ( aSize , aWallSize , 3, true );
}



module testRoundedCube () {	
	
	
	color("Yellow")
	roundedcube(3, true, 0.7, "xmin");

	translate(v = [1, 0, 2])
	color("Pink")
	roundedcube([4, 2, 2], false, 0.6, "zmax");

	translate(v = [-4, -1, 2])
	color("Lightblue")
	roundedcube(2, false);

	translate(v = [0, 0, 6])
	color("Orange")
	roundedcube([3, 2, 2], true, 0.2);

	translate(v = [2.5, -0.5, 5])
	color("Green")
	roundedcube([3, 2, 2], false, 0.4, "z");
}


// Demo
module test () {
									roundedBox			( [ 100 , 90 ,  80 ] ,  5 , false );
	translate  ( [ 105 ,0,40 ] )	roundedBox			( [ 100 , 90 , 160 ] ,  5 , true );
	translate  ( [ 210, 0, 0 ] )	roundedHollowBox	( [ 100 , 90 ,  80 ] , 10 , 20 , false );
	translate  ( [ 315, 0,40 ] )	roundedHollowBox	( [ 100 , 90 , 160 ] ,  5 ,  2 , true );
	translate  ( [ 400, 0,0 ] )	insertBox			();
	translate  ( [ 500, 0,0 ] )	insertBox2			();
	
	
}


// test ();
//testRoundedCube ();
