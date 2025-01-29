class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    // Check for custom delimiter
    if (numbers.startsWith("//")) {
      final delimiterLine = numbers.split('\n')[0];
      final delimiter = delimiterLine.substring(2);
      numbers = numbers.substring(delimiterLine.length + 1);
      numbers = numbers.replaceAll(delimiter, ',');
    } else {
      // Replace newlines with commas for normal cases
      numbers = numbers.replaceAll(RegExp(r'[\n]'), ',');
    }

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



