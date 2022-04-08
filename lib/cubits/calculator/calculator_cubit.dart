import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:meta/meta.dart';

part 'calculator_state.dart';

class CalculatorCubit extends HydratedCubit<CalculatorState> {
  CalculatorCubit() : super(const CalculatorState(expression: '', result: '', history: {}));

  String expression = '';
  String result = '';
  Map<String, dynamic> history = {};

  void setExpression(String value) {
    if (result.isEmpty) {
      expression += value;
      emit(CalculatorState(
        expression: expression,
        result: result,
        history: history,
      ));
    } else {
      result = '';
      expression = '';
      expression += value;
      emit(CalculatorState(
        expression: expression,
        result: result,
        history: history,
      ));
    }
  }

  void delete() {
    expression = expression.substring(0, expression.length - 1);
    emit(CalculatorState(
      expression: expression,
      result: result,
      history: history,
    ));
  }

  void clearHistory() {
    history = {};
    emit(CalculatorState(expression: expression, result: result, history: history));
  }

  void reset() {
    expression = '';
    result = '';
    emit(CalculatorState(
      expression: expression,
      result: result,
      history: history,
    ));
  }

  void onEqualPressed() {
    String exp = expression;
    exp = exp.replaceAll('x', '*');
    exp = exp.replaceAll('÷', '/');
    try {
      Parser parser = Parser();
      Expression expression = parser.parse(exp);
      ContextModel cm = ContextModel();
      result = '${expression.evaluate(EvaluationType.REAL, cm)}';
      result = removeTrailingZeros(result);
      history[history.length.toString()] = [this.expression, result];
      emit(CalculatorState(
        expression: this.expression,
        result: result,
        history: history,
      ));
    } catch (e) {
      emit(CalculatorState(
        expression: expression,
        result: 'Invalid Syntax',
        history: history,
      ));
    }
  }

  String removeTrailingZeros(String n) {
    if (n.contains('.')) {
      return n.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
    } else {
      return n;
    }
  }

  @override
  CalculatorState? fromJson(Map<String, dynamic> json) {
    print('-------------------------------------------------------------------------');
    return CalculatorState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CalculatorState state) {
    print('======================================================================');
    return state.toMap();
  }
}
