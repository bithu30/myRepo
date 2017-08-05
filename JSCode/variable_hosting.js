function outer() {
    a = 0;
    inner();

    function inner() {
        b = 2;
    }

}

outer();