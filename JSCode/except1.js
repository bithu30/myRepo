   //var my_string = "1234";
    var my_string = 1234;
    var rev_str = '';
    try {
        rev_str = my_string.split('').reverse().join('');
        console.log("Reversed string is : "+rev_str);
    } catch(ex) {
             console.log("Error : "+ex.message)                             
    }finally {
        console.log ("Type of my_string is : "+typeof(my_string))
    }
