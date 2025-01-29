
import 'package:stringcalulatorapp/string_calculator.dart';
import 'package:test/test.dart';


void main() {
  group('StringCalculator', () {
    late StringCalculator calculator;

    setUp(() {
      calculator = StringCalculator();
    });

    test('should return 0 for an empty string', () {
      expect(calculator.add(''), equals(0));
    });
    test('should return the number for a single number', () {
      expect(calculator.add('1'), equals(1));
    });


  });
}