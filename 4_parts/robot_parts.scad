
include	<1rpc-os-lib/1_const/const.scad>
include	<1rpc-os-lib/1_const/colors.scad>
use		<1rpc-os-lib/2_base/boxes.scad>
use 	<1rpc-os-lib/2_base/transform.scad>
use     <1rpc-os-lib/3_standard/dcmotor/dcmotor.scad>



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



module Felge ( aInnerWidth , aOuterWidth , aDepth ) {
	
	union () { 
		translate ( [0,0,-5] )difference () {
			// Achse
			cylinder ( d = 14 , h = aDepth + 10, center = true );
			// Löcher
			union () {		
				cylinder ( d = 5 , h = aDepth + 10.2 , center = true );
				// Bohrung
				 rottrans ( [ 0 ,-12.5,-4] , [90,0,0] ) cylinder ( d=3.2, h=7 , center = true ); 
			}
		} 
		
		translate ( [ 0,3,-5 ] ) cube ( [ 5 , 3, 40 ] , center = true ); 
		
	
		difference () {
			cylinder ( d = aInnerWidth , h = aDepth , center = true );		
			cylinder ( d = aInnerWidth - 4 , h = aDepth + 0.2 , center = true );
		} 
		translate ( [0,0,12] )difference () {
			cylinder ( d = aOuterWidth , h = 1 , center = true );		
			cylinder ( d = aInnerWidth - 1 , h = 1 + 0.2 , center = true );
		}
		translate ( [0,0,14.5] ) difference () {
			cylinder ( d = aOuterWidth , h = 1 , center = true );		
			cylinder ( d = aInnerWidth - 1 , h = 1 + 0.2 , center = true );
		}
		translate ( [0,0,-14.5] )difference () {
			cylinder ( d = aOuterWidth , h = 1 , center = true );		
			cylinder ( d = aInnerWidth - 1 , h = 1 + 0.2 , center = true );
		}
		translate ( [0,0,-12] )difference () {
			cylinder ( d = aOuterWidth , h = 1 , center = true );		
			cylinder ( d = aInnerWidth - 1 , h = 1 + 0.2 , center = true );
		}
	}
	
		rottrans ( [aInnerWidth / 4 + 1,0,0] , [0,0,0] ) cube ( [ aInnerWidth / 2 - 4 , 1, 30 ] , center = true ); 
		rottrans ( [aInnerWidth / 4 + 1,0,0] , [0,0,120] ) cube ( [ aInnerWidth / 2 - 4 , 1, 30 ] , center = true ); 
		rottrans ( [aInnerWidth / 4 + 1,0,0] , [0,0,240] ) cube ( [ aInnerWidth / 2 - 4 , 1, 30 ] , center = true ); 
		rottrans ( [aInnerWidth / 4 + 1,0,0] , [0,0,60] ) cube ( [ aInnerWidth / 2 - 4 , 1, 30 ] , center = true ); 
		rottrans ( [aInnerWidth / 4 + 1,0,0] , [0,0,180] ) cube ( [ aInnerWidth / 2 - 4 , 1, 30 ] , center = true ); 
		rottrans ( [aInnerWidth / 4 + 1,0,0] , [0,0,300] ) cube ( [ aInnerWidth / 2 - 4 , 1, 30 ] , center = true ); 
		
}



/**	@~
	@brief Testring für 48BYJ Schrittmotor 

	@attention 
*/


module MotorRing () {
	
	
	difference () {
		union () {
			cylinder ( d= 30, h = 1 ); 
			cylinder ( d=22.4, h=5 );
		}	
		translate ( [0,0,-0.1] ) cylinder ( d = 9.5 , h = 5.2 );	
	}
}	


module msb_ball_slide (aBottom = true ) {
	
	difference () {

		union () { 
			translate ( [-25.5,-9.6,-1] ) cube  ( [ 51 , 19 , 2 ] );
		
			translate ( [ 0,0, 0 ] ) sphere ( d= 19 );
		}
		union () {
			translate ( [ 0,0, 0 ] ) sphere ( d= 15.8 );
			translate ( [ 20,0,-2.05 ] ) cylinder ( d=6, h=20 );	
			translate ( [ -20,0,-2.05 ] ) cylinder ( d=6, h=20 );	
			if ( aBottom ) {
				translate ( [-26,-9.7,0.5 ] ) cube  ( [ 52 , 19.5 , 20 ] );
				translate ( [-25.5,-9.5,-22.5 ] ) cube  ( [ 51 , 20 , 20 ] );
 			} else {
				translate ( [-26,-9.7,-10.5 ] ) cube  ( [ 52 , 19.5 , 10 ] );
			}
		}
	}
	//sphere ( r=15.3 );
}

module show_ball_slide () {
	
	transrot ( [0,22,0],[180,0,0] ) msb_ball_slide ( true );
	msb_ball_slide ( false );
}



/**
  @brief Rad mit Aufnahme für den N20 DC-Getriebemotor

	Nabendurchmesser 3mm
    Abflachungen einseitig Höhe 2,4 mm
	Gesamtlänge 9,25 mm

*/


module msb_wheel_N20 ( 	aDiameter	= 50,
					    aHeight		=  8,
					    aThickness  =  4 ) {
	
	difference () { 
		union () {
			difference () {
				union () {
					cylinder ( d = aDiameter , h = aHeight , $fn = 160); 
					translate ( [ 0, 0, 0 ] ) cylinder ( d = aDiameter + 0.6 , h = 1.2 , $fn = 160); 
					translate ( [ 0, 0, aHeight - 1.2 ] ) cylinder ( d = aDiameter + 0.6 , h = 1.2 , $fn = 160); 
				}
				union () {
					translate ( [0,0,-0.1] ) cylinder ( d = aDiameter - 2 *aThickness , h = aHeight + 0.2 , $fn = 160); 
				}
			}
			
			// Speichen
			translate ( [ 0,12, aHeight / 2 ] ) 						cube ( [ aThickness , aDiameter / 2 - 2.5 , aHeight ] , true ); 
			translate ( [ -13,4.5, aHeight / 2 ] ) rotate ( [0,0,  72] )	cube ( [ aThickness , aDiameter / 2.5 - 2 , aHeight ] , center = true ); 
			translate ( [ -8,-11, aHeight / 2 ] )rotate ( [0,0, 144] ) 	cube ( [ aThickness , aDiameter / 2 - 2.5 ,aHeight ] , center = true ); 
			translate ( [ 8,-11, aHeight / 2 ] )rotate ( [0,0, 216] ) cube ( [ aThickness , aDiameter / 2 - 2 ,aHeight ] , center = true ); 
			translate ( [ 13,4.5, aHeight / 2 ] )rotate ( [0,0, 288] ) 	cube ( [ aThickness , aDiameter / 2 - 2.5 ,aHeight ] , center = true ); 

			cylinder ( d = 16   , h = 18 , $fn = 160); 
//			cylinder ( d =  9.5 , h = 30 , $fn = 160); 
		}
		union () {
			difference () {
				translate ( [0,0,-0.1] ) cylinder ( d = 3.4,h = 18.2 , $fn = 160); 
				transrot ( [-2,1,10],[0,0,0]) cube ( [4, 4 ,12] ); 

			}
			transrot ( [0,0,14],[-90,0,0]) cylinder ( d = 3.96 , h = 8 , $fn = 160); 
		}
	}		
}



/** @brief Rad für den N20-motor



Gummiring 4mm * 60mm
*/
module msb_wheel_N20_V2 ( 	aDiameter	= 50,
							aHeight		=  8,
							aThickness  =  4 ) {
	
	difference () { 
		union () {
			difference () {
				union () {
					cylinder ( d = aDiameter , h = aHeight , $fn = 160); 
					translate ( [ 0, 0, 0 ] ) cylinder ( d = aDiameter + 0.6 , h = 1.2 , $fn = 160); 
					translate ( [ 0, 0, aHeight - 1.2 ] ) cylinder ( d = aDiameter + 0.6 , h = 1.2 , $fn = 160); 
				}
				union () {
					translate ( [0,0,-0.1] ) cylinder ( d = aDiameter - 2 *aThickness , h = aHeight + 0.2 , $fn = 160); 
				}
			}
			
			// Speichen
			translate ( [ 0,12, aHeight / 2 ] ) 						    cube ( [ aThickness , aDiameter / 2 - 2.5 , aHeight ] , true ); 
			translate ( [ -10.5,-6, aHeight / 2 ] ) rotate ( [0,0,  120] )	cube ( [ aThickness , aDiameter / 2 - 2.5 , aHeight ] , center = true ); 
			translate ( [  10.5,-6, aHeight / 2 ] )rotate ( [0,0, 240 ] ) 	cube ( [ aThickness , aDiameter / 2 - 2.5 , aHeight ] , center = true ); 
			
			// Achse

			cylinder ( d = 16   , h = 10 , $fn = 160); 
//			cylinder ( d =  9.5 , h = 30 , $fn = 160); 
		}
		union () {
			difference () {
				translate ( [0,0,-0.1] ) cylinder ( d = 3.6,h = 18.2 , $fn = 160); 
				transrot ( [-2,1.2,-0.1],[0,0,0]) cube ( [4, 4 ,12] ); 

			}
			transrot ( [0,0,14],[-90,0,0]) cylinder ( d = 3.96 , h = 8 , $fn = 160); 
		}
	}		
}






/**
  @brief Rad mit Aufnahme für den gelben Getriebemotor
	Nabendurchmesser 5,4 mm
    Abflachungen beidseitig Höhe 3,75 mm
	Gesamtlänge 18 mm

*/
module msb_wheel_yellow ( 	aDiameter	= 60,
					    aHeight		=  8,
					    aThickness  =  4 ) {
	
	difference () { 
		union () {
			difference () {
				union () {
					cylinder ( d = aDiameter , h = aHeight , $fn = 160); 
					translate ( [ 0, 0, 0 ] ) cylinder ( d = aDiameter + 0.6 , h = 1.2 , $fn = 160); 
					translate ( [ 0, 0, aHeight - 1.2 ] ) cylinder ( d = aDiameter + 0.6 , h = 1.2 , $fn = 160); 
				}
				union () {
					translate ( [0,0,-0.1] ) cylinder ( d = aDiameter - 2 *aThickness , h = aHeight + 0.2 , $fn = 160); 
				}
			}
			
			// Speichen
			translate ( [ 0,12, aHeight / 2 ] ) 						cube ( [ aThickness , aDiameter / 2 - 1 , aHeight ] , true ); 
			translate ( [ -13,4.5, aHeight / 2 ] ) rotate ( [0,0,  72] )	cube ( [ aThickness , aDiameter / 2 - 1 , aHeight ] , center = true ); 
			translate ( [ -8,-11, aHeight / 2 ] )rotate ( [0,0, 144] ) 	cube ( [ aThickness , aDiameter / 2 - 1 ,aHeight ] , center = true ); 
			translate ( [ 8,-11, aHeight / 2 ] )rotate ( [0,0, 216] ) cube ( [ aThickness , aDiameter / 2 - 1 ,aHeight ] , center = true ); 
			translate ( [ 13,4.5, aHeight / 2 ] )rotate ( [0,0, 288] ) 	cube ( [ aThickness , aDiameter / 2 - 1 ,aHeight ] , center = true ); 

			cylinder ( d = 16   , h = 22 , $fn = 160); 
			cylinder ( d =  9.5 , h = 30 , $fn = 160); 
		}
		union () {
			translate ( [0,0,-0.1] ) cylinder ( d = 3 , h = 30.2 , $fn = 160); 			
		}
	}		
}


/**
  @brief Rad mit Aufnahme für einen Nema 17

	Nabendurchmesser 5mm
    Abflachungen einseitig Höhe 4,5 mm
	Gesamtlänge 22,5 mm
    Nicht abgeflachter Teil: 4,75mm 


*/
module msb_wheel_nema17 ( 	aDiameter	= 80,
					    aHeight		=  7,
					    aThickness  =  4 ) {
	
	difference () { 
		union () {
			difference () {
				union () {
					cylinder ( d = aDiameter , h = aHeight , $fn = 160); 
					translate ( [ 0, 0, 0 ] ) cylinder ( d = aDiameter + 0.6 , h = 1.2 , $fn = 160); 
					translate ( [ 0, 0, aHeight - 1.2 ] ) cylinder ( d = aDiameter + 0.6 , h = 1.2 , $fn = 160); 
				}
				union () {
					translate ( [0,0,-0.1] ) cylinder ( d = aDiameter - 2 *aThickness , h = aHeight + 0.2 , $fn = 160); 
				}
			}
			
			// Speichen
			translate ( [ 0,12, aHeight / 2 ] ) 						cube ( [ aThickness , aDiameter / 2 - 1 , aHeight ] , true ); 
			translate ( [ -13,4.5, aHeight / 2 ] ) rotate ( [0,0,  72] )	cube ( [ aThickness , aDiameter / 2 - 1 , aHeight ] , center = true ); 
			translate ( [ -8,-11, aHeight / 2 ] )rotate ( [0,0, 144] ) 	cube ( [ aThickness , aDiameter / 2 - 1 ,aHeight ] , center = true ); 
			translate ( [ 8,-11, aHeight / 2 ] )rotate ( [0,0, 216] ) cube ( [ aThickness , aDiameter / 2 - 1 ,aHeight ] , center = true ); 
			translate ( [ 13,4.5, aHeight / 2 ] )rotate ( [0,0, 288] ) 	cube ( [ aThickness , aDiameter / 2 - 1 ,aHeight ] , center = true ); 

			cylinder ( d = 16   , h = 22 , $fn = 160); 
			cylinder ( d =  9.5 , h = 30 , $fn = 160); 
		}
		union () {
			translate ( [0,0,-0.1] ) cylinder ( d = 3 , h = 30.2 , $fn = 160); 			
		}
	}		
}


/**
  @brief Rad mit Aufnahme für den Schritt-Getriebemotor 28BYJ

	Nabendurchmesser 5mm
    Abflachungen beitseitig Höhe 3mm
	Gesamtlänge 8 mm
    Nicht abgeflachter Teil 2mm 

*/
module msb_wheel_28BYJ ( 	aDiameter	= 60,
					        aHeight		=  7,
					        aThickness  =  4 ) {
	
	difference () { 
		union () {
			difference () {
				union () {
					cylinder ( d = aDiameter , h = aHeight , $fn = 160); 
					translate ( [ 0, 0, 0 ] ) cylinder ( d = aDiameter + 0.6 , h = 1.2 , $fn = 160); 
					translate ( [ 0, 0, aHeight - 1.2 ] ) cylinder ( d = aDiameter + 0.6 , h = 1.2 , $fn = 160); 
				}
				union () {
					translate ( [0,0,-0.1] ) cylinder ( d = aDiameter - 2 *aThickness , h = aHeight + 0.2 , $fn = 160); 
				}
			}
			
			// Speichen
			translate ( [ 0,12, aHeight / 2 ] ) 						cube ( [ aThickness , aDiameter / 2 - 1 , aHeight ] , center = true ); 
			translate ( [ -13,4.5, aHeight / 2 ] ) rotate ( [0,0,  72] )cube ( [ aThickness , aDiameter / 2 - 1 , aHeight ] , center = true ); 
			translate ( [ -8,-11, aHeight / 2 ] )rotate ( [0,0, 144] ) 	cube ( [ aThickness , aDiameter / 2 - 1 , aHeight ] , center = true ); 
			translate ( [ 8,-11, aHeight / 2 ] )rotate ( [0,0, 216] ) 	cube ( [ aThickness , aDiameter / 2 - 1 , aHeight ] , center = true ); 
			translate ( [ 13,4.5, aHeight / 2 ] )rotate ( [0,0, 288] ) 	cube ( [ aThickness , aDiameter / 2 - 1 , aHeight ] , center = true ); 

			cylinder ( d = 16   , h = 22 , $fn = 160); 
			cylinder ( d =  9.5 , h = 30 , $fn = 160); 
		}
		union () {
			translate ( [0,0,-0.1] ) cylinder ( d = 3 , h = 30.2 , $fn = 160); 			
		}
	}		
}




module motorhalter_N20 () {
	
	// Basis
	difference () {	
		
		//		cube ( [ 50, 110 , 4.5 ] );
		union () {
			roundedcube ( size= [ 50, 110 , 4.5 ] , center = false, radius = 3, apply_to = "zmax"); 
			transrot  ( [ 25,67,10.5 ] , [90,0,0] ) cylinder ( d=20, h=67 , $fn=30);
		}
		
		union () {
			//translate ( [ 25,25,-0.1 ] ) cylinder ( d=5, h=4.7 );
			transrot  ( [ 25,70,10.5 ] , [90,0,0] ) cylinder ( d=18.6, h=65 , $fn=30);
			translate ( [15,4,13] ) roundedcube ( size= [ 20, 63 , 10.5 ] , center = false, radius = 3, apply_to = "zmax" );
//		translate ( [ 10,10,0 ] ) cylinder ( d=10, h=40 );
		//translate ( [ 10,10,0 ] ) cylinder ( d=10, h=40 );
		}
		
	}
	//translate ( [ 0,10,0 ] ) cylinder ( d=8, h=40 );
	
}







//motorhalter_N20 ();
// msb_wheel_N20   ();
//msb_wheel_N20_V2 ();
//msb_wheel_28BYJ ();

