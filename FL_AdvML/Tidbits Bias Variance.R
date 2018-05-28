#' E[Error(f_hat)]
#'   = E[(f_hat(x)-f(x))^2]
#'   = Bias(f_hat(x))^2 + Variance(f_hat(x))+σ^2
#'   = E[f_hat(x)-f(x)]^2 + (E[f_hat(x)^2]-E[f_hat(x)]^2)+σ^2
#' Bias: Error caused by simplifying assumptions in the method.
#' Variance: How much the learning method moves around its mean;
#' Irreducible Error = σ^2: Randomness in the system
xseq=seq(1,12,.1)
bias = 1+10* 1/log(xseq*2)
variance= 4 + (xseq/4)^3
bayes=rep(1.5,length(xseq))
total=bayes+variance+bias
plot(xseq,bias,type="l",ylim=c(0,20),col="blue",
     xlab="Complexity",ylab="Expected Error",xaxp=c(-1,100,1),
     main="The bias-variance trade-off")
points(xseq,variance,type="l",col="green")
points(xseq,bayes,type="l",col="red")
points(xseq,total,type="l",col="purple")
abline(v=1+.1*which.min(total),col="black")
legend(8,20.5,  # places a legend at the appropriate place
       c("Total","Bias^2","Variance","Irreducible","Optimal"), # puts text in the legend
       lty=rep(1,4), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5,2.5,2.5,2.5),
       col=c("purple","blue","green","red","black"))
#' Note that we do not have a measure of complexity yet!

#' As we have more data, we can expect the bias and variance curves
#' to become lower, and the optimal point shift to the right:
#' We should use a model with more complexity.
xseq=seq(1,12,.1)
bias2 = 1+10* 1/log(xseq*3)
variance2= 4 + (xseq/6)^3
total2=bayes+variance2+bias2
plot(xseq,bias,type="l",ylim=c(0,20),col="blue",lty=2,
     xlab="Complexity",ylab="Expected Error",xaxp=c(-1,100,1),
     main="The bias-variance trade-off: More data")
points(xseq,bias2,type="l",col="blue")
points(xseq,variance,type="l",lty=2,col="green")
points(xseq,variance2,type="l",col="green")
points(xseq,bayes,type="l",col="red")
points(xseq,total,type="l",lty=2,col="purple")
points(xseq,total2,type="l",col="purple")
abline(v=1+.1*which.min(total),lty=2)
abline(v=1+.1*which.min(total2))
legend(8,20.5,  # places a legend at the appropriate place
       c("Total","Bias^2","Variance","Irreducible","Optimal"), # puts text in the legend
       lty=rep(1,4), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5,2.5,2.5,2.5),
       col=c("purple","blue","green","red","black"))

#' Our improvement from decreasing bias will eventually level off.
#' This shows there are limits to gains from complexity, and these
#' are based on the complexity of the function being modelled. In
#' our fourth order polynomial example adding higher orders could
#' only add noise, since the function itself was a noisy fourth
#' order polynomial.
#'
#' Choosing a point below the optimal means you are underfitting:
#' The complexity of the model is insufficient to optimally model
#' the function.
#'
#' Choosing a point above the optimal means you are overfitting:
#' The complexity of the model is too high for the amount of data
#' and/or the function to support and you are fitting to noise
#' in the data.
#'
#' What is a good measure of complexity?
#' For linear models, the number of parameters is a good measure.
#' For non-linear models, this is sometimes problematic.
#'
#' For example, assuming distinct Y for identical X, a non-linear
#' function of the form y_hat=a+b*cos(c*x) can fit any data
#' *perfectly*! And a is only required if there are any cases
#' where x=0
#'
#' ML = Maximum Likelihood, here calculated assuming Gaussian noise
#'    = Parameters that maximize the probability of seeing the data
#'    given the model type.
x=c(1.6,5.5,7.0,7.6,9.4)
y=c(-2.87,0.07,1.9,2.47,2.91)
df=data.frame(x=x,y=y)
plot(x,y,main="2 parameter ML OLS model")
model=lm(y~x,df)
plot(function(x)predict(model,data.frame(x=x)),from=0,to=10,add=T)
# Pause for a moment
plot(x,y,main="2 parameter ML cosine model")
f=function(x)3*cos(10*x)
plot(f,from=0,to=10,n=1000,add=T)
#' Still, the number of parameters is often a reasonably good choice,
#' and let us think in these terms for now.
#'
#' Model Type                              Number of parameters
#' OLS                                     F+1
#' Poisson Regression                      F+1
#' Polynomial Regression,
#'   - Order O
#'                    full                 (O+F-1)!/(O!+(F-1)!)
#'                    no cross-terms       O*F+1
#' Shallow Neural Network,
#'   - S hidden nodes, with hidden bias    (F+2)*S+1
#'
#' We see that shallow neural networks are less complex than
#' full polynomial regression!
#'
#'
#'
#' If you are interested in general high-quality measures of model
#' complexity exist, you should take a course in statistical
#' learning theory. Unfortunately, the math is not simple!
