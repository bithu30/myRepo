var str = "ajitha";
console.log(str);

var re = /[aeiou]/;

var first_letter = str[0];
console.log(first_letter);
var last_letter = str.slice(-1);
console.log(last_letter);

if ( ( first_letter == last_letter ) && ( first_letter.match(re) && last_letter.match(re) ) ){
	console.log(true);
} else {
	console.log(false);
}
