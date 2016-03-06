 var Car = function ( name,mileage,max_speed) {
 		
 		this.name = name;
 		this.mileage = mileage;
 		this.max_speed = max_speed;
 };

var input = ['Cheverlot','80/ltr',200];
 var my_car = new Car(input[0], input[1], input[2]) 
 console.log(my_car.name);
 console.log(my_car.mileage);
 console.log(my_car.max_speed);