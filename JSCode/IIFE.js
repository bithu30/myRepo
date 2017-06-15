var captcha_check =(function () {
     
         var actual_captcha = Math.floor(Math.random(100)*Math.pow(10, 5));
        console.log("actual_captcha"+actual_captcha)
   return {
    check: function(guess){
        if(guess != this.actual_captcha){
            console.log("You have written it correctly.");
        } else {
            console.log("You have written it incorrectly.");
        }
       }
    };
})();

var bot = captcha_check.actual_captcha;
captcha_check.check(bot);
console.log(bot);
