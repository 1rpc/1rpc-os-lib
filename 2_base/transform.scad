
/**
 @brief Kombinierte Translation und Rotation */ 

module transrot ( aTranslation , aRotation ) {
	
	translate ( aTranslation ) rotate ( aRotation ) children(0);		
}

/**
 @brief Kombinierte Rotation und Translation */ 
	
module rottrans ( aTranslation , aRotation ) {
		
	rotate ( aRotation ) translate ( aTranslation ) children(0);
}



module test_transform () {
	local_scale ( 10 , [0,0,0] ) cylinder ( d= 5, h=10 , $fn=50 );

	color ( "Red" ) rottrans ( [100, 0,0] , [0,0,30] ) cube ([20,20,20]);
	color ( "Blue" )transrot ( [100, 0,0] , [0,0,30] ) cube ([20,20,20]);
}









