class Evaluate {
  String sb;
  double mk;

  Evaluate({this.sb, this.mk});

  Map toJson() {
    return {
      'sb': sb,
      'mk': mk,
    };
  }
}

class EvaluateList {
  List<dynamic> evaluateList = [];

  EvaluateList({this.evaluateList});
}

List<Evaluate> extractEvaluation(var evMap) {
  List<Evaluate> evData = new List(evMap.length);
  for (int i = 0; i < evMap.length; i++) {
    evData[i] = Evaluate(
      sb: evMap[i]['sb'].toString(),
      mk: double.parse(evMap[i]['mk'].toString()),
    );
  }

  return evData;
}
