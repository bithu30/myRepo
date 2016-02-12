input = '11,221,103,113,532,116,1111';
arr=input.split(',');
arr.sort(function compare(a,b) { return a-b; });
console.log(arr);
var second_largest_number='';
var notUpdate = false;
for (var i =arr.length-1; i >= 0;i--){
	console.log(i);
	console.log(second_largest_number);
	console.log(arr[i]);
	console.log(notUpdate);
	if ( second_largest_number.length==0){
		second_largest_number=arr[i];
		continue;
	}

	if ( (second_largest_number > arr[i]) && (notUpdate == false) ) {
		second_largest_number=arr[i];
		notUpdate = true;
		
	}

	
}

console.log(second_largest_number);
