var height =  1;

function main() {
        var n = 6;
        if ( n == 0) {
            console.log(height);
        }else if ( n == 1) {
            
            console.log(height * 2);
        } else {
            
            growthCycles(n)
	    console.log(height);
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

main();
