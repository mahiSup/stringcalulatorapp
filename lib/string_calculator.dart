class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    final numberStrings = numbers.split(',');
    List<int> negatives = [];
    int sum = 0;

    for (var numStr in numberStrings) {
      final num = int.parse(numStr);
      if (num < 0) {
        negatives.add(num);
      } else {
        sum += num;
      }
    }
    if (negatives.isNotEmpty) {
      throw FormatException(
          "Negative numbers not allowed:< ${negatives.join(',')}>");
    }
    return sum;
  }
}

