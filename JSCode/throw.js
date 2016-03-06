var height = 7

try {
	
	if ( isNaN(height) ) {
		
		throw new Error ("notANumberError");
	
	} else if ( height > 10 ) {

		throw new Error ("hugeHeightError");
	
	} else if ( height < 4 ) {

	
		throw new Error ( "tinyHeightError");
	
	} else {
		
		console.log ( height);
	}

} catch ( err){

	console.log(err.message);

}