import 'package:flutter/material.dart';
import 'package:stringcalulatorapp/string_calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'String Number Addition with Custom Delimiter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  late StringCalculator calculator = StringCalculator();
  String _result = '';
  String _errorMessage = '';

  void _calculateSum() {
    setState(() {
      _errorMessage = '';
      final String input = '1;2,3';
      try {
        final sum = calculator.add(input);
        _result = 'Sum: $sum';
      } on FormatException catch (e) {
        _result = '';
        _errorMessage = e.message;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('String Number Addition'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input for numbers with potential custom delimiter
            TextField(
              controller: _controller,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: 'Enter numbers',
                border: OutlineInputBorder(),
              ),
              maxLines: null, // Allow multiline input
            ),
            SizedBox(height: 16),

            // Add button
            ElevatedButton(
              onPressed: _calculateSum,
              child: Text('Calculate Sum'),
            ),
            SizedBox(height: 16),

            // Display result or error message
            if (_result.isNotEmpty)
              Text(
                _result,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
