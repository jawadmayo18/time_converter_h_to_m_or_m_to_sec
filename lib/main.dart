import 'package:flutter/material.dart';

void main() {
  runApp(TimeConverterApp());
}

class TimeConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TimeConverterScreen(),
    );
  }
}

class TimeConverterScreen extends StatefulWidget {
  @override
  _TimeConverterScreenState createState() => _TimeConverterScreenState();
}

class _TimeConverterScreenState extends State<TimeConverterScreen> {
  final TextEditingController _inputController = TextEditingController();
  double _convertedTime = 0.0;
  String _conversionType = "Hours to Minutes";

  void _convertTime() {
    double inputValue = double.tryParse(_inputController.text) ?? 0.0;

    setState(() {
      if (_conversionType == "Hours to Minutes") {
        _convertedTime = inputValue * 60; // 1 Hour = 60 Minutes
      } else if (_conversionType == "Minutes to Seconds") {
        _convertedTime = inputValue * 60; // 1 Minute = 60 Seconds
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text("Time Converter"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter Time Value",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            SizedBox(height: 10),

            // Input Field
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter number",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),

            // Dropdown for selecting conversion type
            DropdownButton<String>(
              value: _conversionType,
              onChanged: (value) {
                setState(() {
                  _conversionType = value!;
                });
              },
              items: [
                "Hours to Minutes",
                "Minutes to Seconds",
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(fontSize: 18)),
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            // Convert Button
            ElevatedButton(
              onPressed: _convertTime,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                "Convert",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),

            SizedBox(height: 20),

            // Display Result
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.blueAccent,
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Converted Time: ${_convertedTime.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
