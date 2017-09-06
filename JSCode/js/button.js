/*var btn = document.getElementById("btn");

  btn.addEventListener ("click",function() {
    number = btn.innerHTML;
    number = parseInt(number)  + 1;
    btn.innerHTML= number;
  });*/
function increase(){
    var b = document.getElementById("btn");
    var number = b.innerHTML;
    number = parseInt(number);
    number=number+1;
    b.innerHTML = number;
}
  

