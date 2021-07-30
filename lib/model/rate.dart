class Rate {
  final double theRate;

  Rate({
    this.theRate,
  });
}

double calculateRating(double oldR, double newR) {
  double theR = (oldR + newR) / 2;
  return theR;
}
