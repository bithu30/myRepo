process.stdin.resume();
process.stdin.setEncoding('ascii');

var input_stdin = "";
var input_stdin_array = "";
var input_currentline = 0;

process.stdin.on('data', function (data) {
    input_stdin += data;
});

process.stdin.on('end', function () {
    input_stdin_array = input_stdin.split("\n");
    console.log(input_stdin_array);	
    main();    
});

function readLine() {
    return input_stdin_array[input_currentline++];
}

var height =  1;
var cycleArr= new Array(springGrowth(),summerGrowth())
function main() {
    var t = parseInt(readLine());
    
    for(var a0 = 0; a0 < t; a0++){
        var n = parseInt(readLine());
        if ( n == 0) {
            console.log(height);
        }else if ( n == 1) {
            
            console.log(height * 2);
        } else {
            
            growthCycles(n)
	    console.log(height);
        }
    }

}

    
function  growthCycles(n) {
    var spring_cycle=true
    for ( var i = 0 ; i < n;i++) {
        
        if ( spring_cycle==true ) {
            springGrowth()
            spring_cycle=false
        } else {
             summerGrowth()
            spring_cycle=true
        }
        
    }
    
    
}
function springGrowth() {
    height *= 2;
}

function summerGrowth() {
    height+=1;
}


}
function springGrowth() {
    height *= 2;
}

function summerGrowth() {
    height += 1;
}
