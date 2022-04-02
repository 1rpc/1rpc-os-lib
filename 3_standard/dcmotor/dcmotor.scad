include	<1rpc-os-lib/1_const/const.scad>
include	<1rpc-os-lib/1_const/colors.scad>
use		<1rpc-os-lib/2_base/transform.scad>

$fn=20;

module motor1 () {
 union() {
        difference()
        {
            cylinder(r=10.125,h=32.16);   
            translate([-11,7.7,-1])
            color ("red")
            cube([20.31,7,35]);
            translate([-10,-14.7,-1])
            color ("yellow")
            color ("blue") cube([20.31,7,35]);
            translate([5,0,13])
        color ("Magenta") cylinder(r=1.94/2, h=20,$fn=100);  
        translate([-5,0,13])
        color ("Magenta") cylinder(r=1.94/2, h=20,$fn=100);  
        translate([0,5,13])
        color ("Magenta") cylinder(r=1.94/2, h=20,$fn=100);   
            
        }
        translate([0,0,21])
        color ("blue") cylinder(r=6.04/2, h=12,$fn=100);
        translate([0,0,30])
        color ("Magenta") cylinder(r=1.94/2, h=7.22,$fn=100);
    }
	
}




module motor_x () {
	difference () {
		color ( Gray ) cylinder ( d= 19.5, h=24.6);
		union () {
			color ( Steel )translate ( [ -10,7.3,-0.1] ) cube ( [ 30,10, 25  ] );
			color ( Steel )translate ( [ -10,-17.30,-0.1] ) cube ( [ 30,10, 25  ] );
		} 
	}
	color ( Steel ) translate ( [ 0,0,24.6] )  cylinder ( d= 5.3, h=1.2);
	color ( Steel ) translate ( [ 0,0,-1.8] )  cylinder ( d= 9.65, h=1.8);
	color ( Steel ) translate ( [ 0,0,-2.8] )  cylinder ( d= 1.7, h=38);
}




module motor_N20 () {
	difference () {
		color ( Gray ) cylinder ( d= 12, h=15.25);
		union () {
			color ( Steel )translate ( [ 5,-5,-0.1] ) cube ( [ 5,12, 16  ] );
			color ( Steel )translate ( [ -10,-5,-0.1] ) cube ( [ 5,12, 16  ] );
		} 
	}
	color ( Steel ) translate ( [ 0,0,15] )  cylinder ( d= 4, h=0.5);
	color ( Steel ) translate ( [ 0,0,-1] )  cylinder ( d= 5, h=1.1);
	color ( Steel ) translate ( [ 0,0,-1.4] )  cylinder ( d= 1.7, h=18.6);
}


module motor_N20_hole () {
	
	difference () {
		cylinder ( d= 12, h=15.25);
		union () {
			translate ( [ 5,-5,-0.1] ) cube ( [ 5,12, 16  ] );
			translate ( [ -10,-5,-0.1] ) cube ( [ 5,12, 16  ] );
		} 
	}
	translate ( [ 0,0,15] )  cylinder ( d= 4, h=0.5);
	translate ( [ 0,0,-1] )  cylinder ( d= 5, h=1.1);
	translate ( [ 0,0,-1.4] )  cylinder ( d= 1.7, h=18.6);
}



module gearbox_x () {
	
	difference () {
		union () {
			color ( Yellow ) union () {
				translate ( [-11, -9,24.5 ] )  cube([22,18,32]); 
			}
			translate ( [ 0,0,14 ] ) difference () {
				color ( Yellow ) cylinder ( d= 22, h=10.8);
				union () {
					color ( Yellow )translate ( [ -10,9,-0.1] ) cube ( [ 30,10, 11		] );
					color ( Yellow )translate ( [ -10,-19,-0.1] ) cube ( [ 30,10, 11  ] );
				} 
			}
			color ( Yellow ) transrot ( [6,9,56],[90,0,0])  cylinder ( d= 10, h=18);
			color ( Yellow ) transrot ( [-6,9,56],[90,0,0])  cylinder ( d= 10, h=18);
			color ( Yellow ) transrot ( [-6,-9,56],[0,0,0])  cube ( [12,18,5]);
			color ( Yellow ) rottrans ( [0,40,9],[90,0,0])  cylinder ( d= 3.8, h=1.8);

			// Nabe
			color ( White )  rottrans ( [0,51,-8] , [90,0,0] ) difference () {
				cylinder ( d=5.3, h= 26 );
				union () {
					translate ( [-5,1.5,18.1 ] )  cube ( [10,3,8 ] );
					translate ( [-5,-4.5,18.1 ] )  cube ( [10,3,8 ] );
					cylinder ( d=2, h= 26.1 );
					
				}
			}
		}
		union () {
			 rottrans ( [9,30.5,-9.55] , [90,0,0] ) cylinder ( d=2.3, h= 19.1 );
			 rottrans ( [-9,30.5,-9.55] , [90,0,0] ) cylinder ( d=2.3, h= 19.1 );
		}
	}
}


module gearbox_N20 () {

			color ( Yellow ) translate ( [ -5, -6 ,15 ] ) difference () {
				cube([10,12,0.8]); 
				union () {
					translate ( [5,6,0] ) cylinder (d = 4, h= 1 );
				}
			}
			color ( Yellow ) translate ( [-5,-6,17.5] ) cube([10,12,0.8]); 
			color ( Yellow ) translate ( [-5,-6,23.2  ])    cube([10,12,0.8]); 
			
			
			difference () {
				translate ([0,0,18 ] ) cylinder ( d=3 , h= 15 );
				translate ( [-1.5,1.2,24.1] ) cube ( [ 3, 3 , 9 ] );
			}
	
	
}

module gearbox_N20_hole () {
	
	
	translate ( [-5,-6,15] ) cube ( [10,12,9] );
	
}

		
		
module gearmotor_x () {
	
  motor_x	();
  gearbox_x	();
}	


// gearmotor_x ();

//motor1 ();

module gearmotor_N20 () {
  motor_N20	();
  gearbox_N20 ();
}

module gearmotor_N20_hole () {
  motor_N20_hole	();
  gearbox_N20_hole ();
}


gearmotor_N20_hole();

translate ( [20,0,0] ) gearmotor_N20();

translate ( [40,0,0] ) motor1 ();

