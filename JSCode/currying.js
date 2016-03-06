"use strict"
    let pressure = (gravity) => (mass) => (height) => gravity * mass * height;  
    let m = input[0];   //m : stores value of mass.
    let g = input[1];   //g : stores value of gravity.
    let h = input[2];   //h : stores value of height.

    let accelerationDueToGravity = pressure(g)   //Blank should be replaced by a function which takes a single argument.
    let particleMass = accelerationDueToGravity(m)                //Blank should be replaced by a function which takes a single argument.
    let particleHeight = particleMass(h)             //Blank should be replaced by a function which takes a single argument.

    let totalPressure = particleHeight;

    console.log(totalPressure);
