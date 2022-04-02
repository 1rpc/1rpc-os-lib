/**	@~de
	@file 
	@brief Robotic basis für Makerspace roboter und systeme 
	
	# Einführung
	
	Der Makerspace Robotik Werkzeugkassten soll eine Flexe 
	
	Die Idee
	
	"Echte" ergo belastbare mechanische Bauteile mit denen haltbare Geräte gebaut werden können. Dazu wird bei den Bauteilen auf preiswerte mechnische Standardbauteile zurückgegriffen:
	
	- 20x20 Aluminiumprofile aka Bosch-Profil. Bosch, weil preiswerter als Item
	- 8'er Wellen
	- 8'er 
	- Zahnriemen
	- Pullies
	- 
	
	- Motoren
	  - Nema 17
	  - ND-10
	  - kleine Getriebemotor
	  - DC-Motor: Mabuchi 5040
	  
	
	Das Grundraster ist: 20x20x20
	
	## Werkzeug
	
		- Lötkolben
		- Universalnetzteil
		- Schraubstock
		- kleiner Schrauber
		- Feilen
		- Spachtel
		- Pinzette
		- Gewindebohrer
		- Satz Hex-Schraubendreher mit 
		- Seitenschneider
		- Manipulierzange
		- Schere
		- Lineal
		- Messschieber
		- (Haarwinkel)
		- Haarlineal
		- Multimeter
		- Universalnetzteil

	
	
	## Elemente

	
	### Zusätzliche Bauteile 
	
	#### Schrauben
	
	#### Muttern
	
	- 
	

	- Einpressmuttern SL-Typ
		- M3x4x5
		- M2x6x3,5
		- M4
	
	
	### Wellen
	
	### Experimentier
	
	- Breadboards
	- Dupont Verbinder
	- 
	
	## Verbrauchmaterial 
	- 
	
	
	
*/

include	<1rpc-os-lib/1_const/const.scad>
include	<1rpc-os-lib/1_const/colors.scad>
use		<1rpc-os-lib/2_base/boxes.scad>
use 	<1rpc-os-lib/2_base/transform.scad>
//include	<1rpc-os-lib/3_standard/stepper_motors/stepper.scad>
use		<1rpc-os-lib/3_standard/stepper_motors/nema_stepper_motor_mount.scad>


module Nema_Holes ( aNemaSize, aDepth ) {

		//stepper_motor_mount(nema_standard,slide_distance=0, mochup=true, tolerance=0, aBoltHoleSize = 3.5 ) {
	
			linear_extrude ( height = aDepth ) stepper_motor_mount( nema_standard=17 , slide_distance=0 , mochup = false , tolerance = 0.6,aBoltHoleSize = 4 );
	
}//----- Nema_Holes -------------------------------------------------------------------------------

module Holes ( aWidth, aThickness, WithCapHoles = true, All=true , N20 = true ) {

		//stepper_motor_mount(nema_standard,slide_distance=0, mochup=true, tolerance=0, aBoltHoleSize = 3.5 ) {
	
	X  = aWidth / 3;
	Y  = aWidth / 3;
	Dia = 6.2;
	
	translate ( [ 1.5 * X, 0.5 * Y , -0.1 ] ) cylinder ( d= Dia , h= aThickness + 1 );
	translate ( [ 0.5 * X, 1.5 * Y , -0.1 ] ) cylinder ( d= Dia , h= aThickness + 1 );
	translate ( [ 2.5 * X, 1.5 * Y , -0.1 ] ) cylinder ( d= Dia , h= aThickness + 1 );
	translate ( [ 1.5 * X, 2.5 * Y , -0.1 ] ) cylinder ( d= Dia , h= aThickness + 1 );
	
	if ( All == true ) {
		translate ( [ 0.5 * X, 0.5 * Y , -0.1 ] ) cylinder ( d= Dia , h= aThickness + 1 );
		translate ( [ 2.5 * X, 0.5 * Y , -0.1 ] ) cylinder ( d= Dia , h= aThickness + 1 );
		translate ( [ 0.5 * X, 2.5 * Y , -0.1 ] ) cylinder ( d= Dia , h= aThickness + 1 );
		translate ( [ 2.5 * X, 2.5 * Y , -0.1 ] ) cylinder ( d= Dia , h= aThickness + 1 );
		translate ( [ aWidth / 2, aWidth / 2 , -0.1 ] ) cylinder ( d= 23  , h= aThickness + 1 );
		
	}
	
	if ( WithCapHoles == true ) {
		translate ( [  aWidth - 5 , aWidth / 3    , -0.1 ] ) cylinder ( d= 3.5 ,  h= aThickness + 1 );
		translate ( [  aWidth - 5 , 2 *aWidth / 3 , -0.1 ] ) cylinder ( d= 3.5 ,  h= aThickness + 1 );
		
		// Hole DC Gearbox Motor - Centered
		translate ( [  aWidth / 2 , 18 , -0.1 ] ) cylinder ( d= 4.3 ,  h= aThickness + 1 );
		
		translate ( [  aWidth /2  + 9 , 10  , -0.1 ] ) cylinder ( d= 3.5 ,  h= aThickness + 1 );
		translate ( [  aWidth /2  - 9 , 10  , -0.1 ] ) cylinder ( d= 3.5 ,  h= aThickness + 1 );
		
		
		// Hole DC Gearbox Motor Robo-1
		translate ( [ 18.5 , 36 , -0.1 ] ) cylinder ( d= 10.5 ,  h= aThickness + 1 ); // Achse
		translate ( [  18.5 , 25 , -0.1 ] ) cylinder ( d= 4.3 ,  h= aThickness + 1 ); // Nuppel
		
		translate ( [  27 , 15.5  , -0.1 ] ) cylinder ( d= 3.5 ,  h= aThickness + 1 );
		translate ( [   9  , 15.5  , -0.1 ] ) cylinder ( d= 3.5 ,  h= aThickness + 1 );
	} 
	
	if ( WithCapHoles != true ) {
		// For 28BYJ-48 Steppermotor
		 translate ( [  aWidth / 2 + 6.5 , aWidth / 2   + 18.5 , -0.1 ] ) cylinder ( d= 4.3 ,  h= aThickness + 1 );
		 translate ( [ ( aWidth / 2 ) - 17.5 , ( aWidth / 2) - 8 , -0.1 ] ) cylinder ( d= 4.3 ,  h= aThickness + 1 );
		
	}
		// Hole DC Gearbox Motor Robo-1
	if ( N20 == true ) {
		 translate ( [   13 , 35  , -0.1 ] ) cube ( [ 10 ,  12 , aThickness + 1  ]);
	}
}




module msb_element ( aWidth = 1 , aThickness = 4.5 , aCount = [ 1 ,1 , 1 ] ) {
	
	half = aWidth / 2;
		Thickness = aThickness + HOLE_ADD;
	
	difference () {
		union () {
			insertBox (  [ aWidth * aCount [0] , aWidth * aCount [1] , aWidth * aCount [2] ] , Thickness *0.9, Green );
			
	/*		color ( Green ) transrot   ( [ aWidth - aThickness,aThickness - 0.3,aWidth - 9], [ 0,-90,0] )  {
				union () {
					translate ( [0,0,16 ] ) linear_extrude ( height =  4 ) polygon( points=[ [0,0] , [2,0],[2,2] ] );
					translate ( [0,0,30 ] ) linear_extrude ( height = 10 ) polygon( points=[ [0,0] , [2,0],[2,2] ] );
				}
			}
			//	polygon( points=[ [0,0] , [2,0],[2,2] ] );
			
			color ( Green ) transrot   ( [ aThickness,aWidth * aCount [1] - aThickness,aWidth - 9], [ 180,-90,0] ) {
				union () {
					translate ( [0,-0.6,10 ] ) linear_extrude ( height = 10 ) polygon( points=[ [0,0] , [2,0],[2,2] ] );
					translate ( [0,-0.6,30 ] ) linear_extrude ( height = 4 ) polygon( points=[ [0,0] , [2,0],[2,2] ] );
				}
				
			} */
			
			
			
		}
		union () {
			// Bottom 
			for ( y = [0 : aCount [1] - 1 ]) {
				for ( x = [0 : aCount [0] - 1 ]) {
					// Nema
					rottrans ( [ half + (x * aWidth) ,half + (y * aWidth) ,HOLE_ADD], [ 0,0,0] )	Nema_Holes	( 17 , Thickness  );
					rottrans ( [ (x * aWidth) ,(y * aWidth),HOLE_ADD], [ 0,0,0] ) 					Holes 		( aWidth, aThickness , false , false , false );

				}
			}
			
			// Forderseite
			for ( z = [0 : aCount [2] - 1 ]) {
				for ( y = [0 : aCount [1] - 1 ]) {
					for ( x = [0 : aCount [0] - 1 ]) {
						rottrans ( [ (z * aWidth) , -1*( aWidth * ( x + 1 ) ), -1*Thickness ], [ 90,-90,0] ) Holes ( aWidth, aThickness , false , true , false );
					}
				}
			}
			
			// Rückseite
			for ( z = [0 : aCount [2] - 1 ]) {
				for ( y = [0 : aCount [1] - 1 ]) {
					for ( x = [0 : aCount [0] - 1 ]) {
						rottrans ( [ (aWidth * z ) , -1*( aWidth * ( x + 1 ) ), -1*(aWidth * aCount [ 1 ] ) - 0.1], [ 90,-90,0] ) Holes ( aWidth, aThickness , false , true , false );
					}
				}
			}
			// Left Side (x = 0)
			for ( z = [0 : aCount [2] - 1 ]) {
				for ( y = [0 : aCount [1] - 1 ]) {
					for ( x = [0 : aCount [0] - 1 ]) {
						rottrans ( [ half + (z * aWidth),half + (y * aWidth) ,-1*Thickness+0.1  ], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
						
						
						if ( y==aCount [1] - 1  ) {					
							rottrans ( [ (z * aWidth), (y * aWidth),-1*Thickness+0.1 ], [ 0,-90,0] ) Holes ( aWidth, aThickness , true , false , true );
						}
						if ( y!=aCount [1] - 1 ) {					
							rottrans ( [ (z * aWidth), (y * aWidth),-1*Thickness+0.1 ], [ 0,-90,0] ) Holes ( aWidth, aThickness , true , false , false );
						}
						
						
					}
				}
			} 
			// Right Side		
			for ( z = [0 : aCount [2] - 1 ]) {
				for ( y = [0 : aCount [1] - 1 ]) {
					for ( x = [0 : aCount [0] - 1 ]) {
						if ( y == aCount [1] - 1 ) {
							rottrans ( [  (z * aWidth) , (y * aWidth) , -1*( aWidth * aCount [ 0 ] )  -0.1 ], [ 0,-90,0] ) Holes ( aWidth, aThickness , true , true , true );
						}	
						if ( y != aCount [1] - 1  ) {
							rottrans ( [  (z * aWidth) , (y * aWidth) , -1*( aWidth * aCount [ 0 ] )  -0.1 ], [ 0,-90,0] ) Holes ( aWidth, aThickness , true , true, false );
						}	
					}
				}
			} 
		} //END: union...		
	}//END: difference...
}//----- module msb_element --------------------------------------------------------------------------------------------------------




module msb_base ( aWidth , aThickness ) {
	
	half = aWidth / 2;
		Thickness = aThickness + HOLE_ADD;
	
	difference () {
		union () {
			insertBox (  [2*aWidth, 2*aWidth, aWidth] , Thickness *0.9, Green );
			
			color ( Green ) transrot   ( [ 2*aWidth - aThickness,aThickness - 0.3,aWidth - 9], [ 0,-90,0] ) 
			linear_extrude ( height = 2*aWidth - 2 * aThickness ) polygon( points=[ [0,0] , [2,0],[2,2] ] );
			
			color ( Green ) transrot   ( [ aThickness,2*aWidth - aThickness,aWidth - 9], [ 180,-90,0] ) 
			
			linear_extrude ( height = 2*aWidth - 2 * aThickness ) polygon( points=[ [0,0] , [2,0],[2,2] ] );
			
			
			
			
		}
		union () {
			rottrans ( [ half,half,HOLE_ADD], [ 0,0,0] ) Nema_Holes ( 17 , Thickness  );
			rottrans ( [ half,-half,-1*Thickness], [ 90,-90,0] ) Nema_Holes ( 17 , Thickness ) ;// + HOLE_ADD);
			rottrans ( [ half,half,-1*Thickness+0.1], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
			rottrans ( [ half,half,- aWidth - HOLE_ADD], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
			
			translate ([ aWidth,0,0 ] ) union () {
				rottrans ( [ half,half,HOLE_ADD], [ 0,0,0] ) Nema_Holes ( 17 , Thickness  );
				rottrans ( [ half,-half,-1*Thickness], [ 90,-90,0] ) Nema_Holes ( 17 , Thickness ) ;// + HOLE_ADD);
				//#rottrans ( [ half,-half,- aWidth], [ 90,-90,0] ) Nema_Holes ( 17 , Thickness );
				rottrans ( [ half,half,-1*Thickness+0.1], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
				rottrans ( [ half,half,- aWidth - HOLE_ADD], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
			}
			
			translate ([0, aWidth ,0 ] ) union () {
				rottrans ( [ half,half,HOLE_ADD], [ 0,0,0] ) Nema_Holes ( 17 , Thickness  );
				//#rottrans ( [ half,-half,-1*Thickness], [ 90,-90,0] ) Nema_Holes ( 17 , Thickness ) ;// + HOLE_ADD);
				rottrans ( [ half,-half,- aWidth], [ 90,-90,0] ) Nema_Holes ( 17 , Thickness );
				rottrans ( [ half,half,-1*Thickness+0.1], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
				rottrans ( [ half,half,- aWidth - HOLE_ADD], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
			}
			
			translate ([ aWidth , aWidth,0 ] ) union () {
				rottrans ( [ half,half,HOLE_ADD], [ 0,0,0] ) Nema_Holes ( 17 , Thickness   );
				//#rottrans ( [ half,-half,-1*Thickness], [ 90,-90,0] ) Nema_Holes ( 17 , Thickness ) ;// + HOLE_ADD);
				rottrans ( [ half,-half,- aWidth], [ 90,-90,0] ) Nema_Holes ( 17 , Thickness );
				rottrans ( [ half,half,-1*Thickness+0.1], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
				rottrans ( [ half,half,- aWidth - HOLE_ADD], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
			}
			
			
			
			
			
		}
		
	}
}//----- 





module msb_cube_cap ( aWidth , aThickness , aCount ) {
	
	half	= aWidth / 2;
	w		= aWidth - 2 * aThickness;
	X1		= aWidth * aCount [ 0 ] - 2 * aThickness;
	Y1		= aWidth * aCount [ 1 ] - 2 * aThickness;
	w2		= aWidth /3;
	dHole	= 3.8;
	
	difference () {
		//roundedBox			( [ aWidth , aWidth , 100  /*aThickness*/ ] ,  50 , true );
		roundedcube(size = [ X1, Y1 , aThickness ] , center = false, radius = 3, apply_to = "z");
		union () {
			/*rottrans ( [ 10, aThickness / 2 , -9.9 ], [ 90,0,0] ) cylinder ( d = 4 , h = 10 );
			rottrans ( [ 45, aThickness / 2 , -9.9 ], [ 90,0,0] ) cylinder ( d = 4 , h = 10 );
			rottrans ( [ 10, aThickness / 2 , -65 + 9 ], [ 90,0,0] ) cylinder ( d = 4 , h = 10 );
			rottrans ( [ 45, aThickness / 2 , -65 + 9 ], [ 90,0,0] ) cylinder ( d = 4 , h = 10 );*/
			rottrans ( [ w2 - aThickness , aThickness / 2 , aWidth * aCount [0] - 18.9 ], [ 90,0,90] ) cylinder ( d = dHole , h = 10 );
			rottrans ( [ (aCount[1] - 1/3) * aWidth  - aThickness, aThickness / 2 , aWidth * aCount [0] - 18.9 ], [ 90,0,90] ) cylinder ( d = dHole , h = 10 );
			rottrans ( [ w2 - aThickness, aThickness / 2 , -0.1 ], [ 90,0,90] ) cylinder ( d = dHole , h = 10 );
			rottrans ( [ (aCount[1] - 1/3) * aWidth - aThickness, aThickness / 2 , -0.1 ], [ 90,0,90] ) cylinder ( d = dHole , h = 10 ); 
		}
				
		
	}	
}

module test () {
difference () {
	union () {
		msb_cube ( 60 , 4.5);
	
		translate ( [ 5.2 , 5.2, 59 ] ) msb_cap ( 59.6 , 5 );
	} 
	translate ( [ -0.2 , -0.2, 0 ] ) cube ( [15.2,15.2,80] );
}
}


module test2() {
difference () {
	union () {
		msb_cube_cap ( 60 , 4.5);
		} 
	translate ( [ -0.2 , -0.2, 3 ] ) cube ( [70,70, 10] );
}
}




module msb_cubeX ( aWidth , aThickness , aCount ) {
	
	half = aWidth / 2;
		Thickness = aThickness + HOLE_ADD;
	
	difference () {
		union () {
			insertBox (  [aWidth * aCount [0], aWidth * aCount [1], aWidth * aCount [2] ] , Thickness *0.9, Green );
			
			color ( Green ) transrot   ( [ 2*aWidth - aThickness,aThickness - 0.3,aWidth - 9], [ 0,-90,0] ) 
			linear_extrude ( height = 2*aWidth - 2 * aThickness ) polygon( points=[ [0,0] , [2,0],[2,2] ] );
			
			color ( Green ) transrot   ( [ aThickness,2*aWidth - aThickness,aWidth - 9], [ 180,-90,0] ) 
			
			linear_extrude ( height = 2*aWidth - 2 * aThickness ) polygon( points=[ [0,0] , [2,0],[2,2] ] );
			
		}
		union () {
			
			// Bottom - 
			
			for ( x = [ 0 : aCount [0] - 1 ] ) {			
				for ( y = [ 0 : aCount [1] - 1 ] ) {
			
					rottrans ( [ x * aWidth + half,y * aWidth + half,HOLE_ADD], [ 0,0,0] ) Nema_Holes ( 17 , Thickness  );
					rottrans ( [ x * aWidth + half,y * aWidth - half,-1*Thickness], [ 90,-90,0] ) Nema_Holes ( 17 , Thickness ) ;// + HOLE_ADD);
					rottrans ( [ x * aWidth + half,y * aWidth + half,-1*Thickness+0.1], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
					rottrans ( [ x * aWidth + half,y * aWidth + half,- aWidth - HOLE_ADD], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
				}
			}
			
		/*	translate ([ aWidth,0,0 ] ) union () {
				rottrans ( [ half,half,HOLE_ADD], [ 0,0,0] ) Nema_Holes ( 17 , Thickness  );
				rottrans ( [ half,-half,-1*Thickness], [ 90,-90,0] ) Nema_Holes ( 17 , Thickness ) ;// + HOLE_ADD);
				//#rottrans ( [ half,-half,- aWidth], [ 90,-90,0] ) Nema_Holes ( 17 , Thickness );
				rottrans ( [ half,half,-1*Thickness+0.1], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
				rottrans ( [ half,half,- aWidth - HOLE_ADD], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
			}
			
			translate ([0, aWidth ,0 ] ) union () {
				rottrans ( [ half,half,HOLE_ADD], [ 0,0,0] ) Nema_Holes ( 17 , Thickness  );
				//#rottrans ( [ half,-half,-1*Thickness], [ 90,-90,0] ) Nema_Holes ( 17 , Thickness ) ;// + HOLE_ADD);
				rottrans ( [ half,-half,- aWidth], [ 90,-90,0] ) Nema_Holes ( 17 , Thickness );
				rottrans ( [ half,half,-1*Thickness+0.1], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
				rottrans ( [ half,half,- aWidth - HOLE_ADD], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
			}
			
			translate ([ aWidth , aWidth,0 ] ) union () {
				rottrans ( [ half,half,HOLE_ADD], [ 0,0,0] ) Nema_Holes ( 17 , Thickness   );
				//#rottrans ( [ half,-half,-1*Thickness], [ 90,-90,0] ) Nema_Holes ( 17 , Thickness ) ;// + HOLE_ADD);
				rottrans ( [ half,-half,- aWidth], [ 90,-90,0] ) Nema_Holes ( 17 , Thickness );
				rottrans ( [ half,half,-1*Thickness+0.1], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
				rottrans ( [ half,half,- aWidth - HOLE_ADD], [ 0,-90,0] ) Nema_Holes ( 17 , Thickness );
			}
			*/
			
			
			
		}
	}
}




/** Deckel mit Noppen für Klemmbausteine
*/ 

module msb_cube_cap_brick ( aWidth , aHeight , aCount ) {
	
	msb_cube_cap ( aWidth , aHeight , aCount  );
	translate ([   5.5,  5.5 , 5.9 ] )  {
		for ( x = [ 0 : 5 ] ) {			
			for ( y = [ 0 : 5 ] ) {	
				translate ([   7.8 * x,  7.8 *y ,0 ] ) cylinder ( h=2.1 , d=4.8 );
			}
		}
	}
}



color (Green) translate ( [4.5,4.5,100 ] ) msb_cube_cap ( 60,4.5, [ 1 , 2 , 1 ] );
//msb_cube_cap_brick ( 60,4.5, [ 1 , 2 , 1 ] );

color (Green) msb_element ( 60 , 4.5 , [ 1 , 2 , 1 ] );
