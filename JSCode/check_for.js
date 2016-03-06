var str = "Bijith";
console.log(str);
var vowels = ['a','e','i','o','u'];
var constants = []

for ( var letter of str ) {
  if ( vowels.indexOf(letter) != -1 ) {
	console.log(letter);
  } else {
	constants.push(letter);
  }
}

while( constants.length > 0 ){
	console.log(constants.shift());

}
