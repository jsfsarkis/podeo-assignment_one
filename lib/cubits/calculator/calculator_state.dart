part of 'calculator_cubit.dart';

@immutable
class CalculatorState {
  final String expression;
  final String result;
  final Map<String, dynamic> history;

  const CalculatorState({
    required this.expression,
    required this.result,
    required this.history,
  });

  // Map<String, dynamic> historyToMap(List<List<String>> history) {
  //   Map<String, dynamic> map = {};
  //   for (int i = 0; i<history.length; i++) {
  //     map
  //   }
  //   return map;
  // }

  Map<String, dynamic> toMap() {
    return {
      'expression': expression,
      'result': result,
      'history': history,
    };
  }

  factory CalculatorState.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) {
      return const CalculatorState(expression: '', result: '', history: {});
    }
    return CalculatorState(
      expression: map['expression'],
      result: map['result'],
      history: map['history'],
    );
  }
}
