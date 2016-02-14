for ( var item of my_array){
    rev = item.split('').reverse().join('');
    if ( item == rev ) {
        console.log(item);
    }
}
