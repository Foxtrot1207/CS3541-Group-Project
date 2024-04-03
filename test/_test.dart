import 'package:flutter_test/flutter_test.dart';
import 'package:healthapp/bmi_calc.dart';

void main() {
  final model = CalcBMIModel();

  test('BMI calculation accuracy', () {
    double result = model.bmiCalc(160, 60);
    expect(result, closeTo(31.24, 0.1));
  });

  test('Exception when weight is zero', () {
    expect(() => model.bmiCalc(0, 160), throwsA(isA<ArgumentError>()));
  });

  test('Exception when height is zero', () {
    expect(() => model.bmiCalc(72, 0), throwsA(isA<ArgumentError>()));
  });

  test('Exception when weight is negative', () {
    expect(() => model.bmiCalc(-1, 160), throwsA(isA<ArgumentError>()));
  });

  test('Exception when height is negative', () {
    expect(() => model.bmiCalc(72, -1), throwsA(isA<ArgumentError>()));
  });
}
