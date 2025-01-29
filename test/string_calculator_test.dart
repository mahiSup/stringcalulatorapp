
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


  });
}