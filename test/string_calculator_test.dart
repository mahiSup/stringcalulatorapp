
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

    test('should return the sum of two numbers', () {
      expect(calculator.add('1,5'), equals(6));
    });

    test('should return the sum of multiple numbers', () {
      expect(calculator.add('1,2,3'), equals(6));
    });

    test('should handle newlines between numbers', () {
      expect(calculator.add('1\n2,3'), equals(6));
    });

    test('should handle custom delimiters', () {
      expect(calculator.add('//;\n1;2;3'), equals(6));
    });

    test('should throw exception when negative numbers are included', () {
      // Test case with one negative number
      expect(() => calculator.add('1,-2'), throwsA(
          isA<FormatException>().having((e) => e.message, 'message', 'Negative numbers not allowed:-2')
      ));
    });
    test('should throw exception with multiple negative numbers', () {
      // Test case with multiple negative numbers
      expect(() => calculator.add('-1,-2,-3'), throwsA(
          isA<FormatException>().having((e) => e.message, 'message', 'Negative numbers not allowed:-1,-2,-3')
      ));
    });


  });
}