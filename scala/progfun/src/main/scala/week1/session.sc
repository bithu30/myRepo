object session {

  def abs(x:Double) = if ( x < 0 ) -x else x
  def sqrt(x: Double) = {

    def squareIter(guess: Double, x: Double): Double =
      if (isGoodEnough(guess, x)) guess
      else squareIter(improve(guess, x), x)

    def isGoodEnough(guess: Double, x: Double) =
      abs(guess * guess - x) / x < 0.001

    def improve(guess: Double, x: Double) =
      (guess + x / guess) / 2

    squareIter(1.0, x)
  }
  sqrt(2)
  sqrt(1e-6)
  sqrt(1e60)
}