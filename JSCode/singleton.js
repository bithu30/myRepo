 (function() {
	if ( typeof MyExt === 'undefined' ) {

		this.MyExt = {
			add: function ( a, b ) {
				return a + b;
			},
			multi : function ( a, b ) {
				return a * b;
			}
		};
	}
}
 )();

console.log ( MyExt.multi( 4,3 ) );
console.log ( MyExt.add(2,3 ) );
