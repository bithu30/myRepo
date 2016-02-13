var dt_str='10/11/2009';
var d = new Date(dt_str);
var day = d.getDay();
switch(day){
	case 0:
	  console.log("Sunday");
	  break;
	case 1:
          console.log("Monday");
          break;
	case 2:
          console.log("Tuesday");
          break;
	case 3:
          console.log("Wednesday");
          break;
	case 4:
          console.log("Thursday");
          break;
	case 5:
          console.log("Friday");
          break;

	default:
	  console.log("Saturday");
}
