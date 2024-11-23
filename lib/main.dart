import 'package:flutter/material.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UnitConverterScreen(),
    );
  }
}

class UnitConverterScreen extends StatefulWidget {
  @override
  _UnitConverterScreenState createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  final TextEditingController _inputController = TextEditingController();
  String? _selectedFromUnit;
  String? _selectedToUnit;
  String _result = "";

  // Expanded list of units
  final List<String> _units = [
    'Kilometers', 'Miles', 'Meters', 'Centimeters', 'Yards'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue[300]!,
              Colors.blue[700]!,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Display the result at the top
                Text(
                  _result,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Ensure readability
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),

                // Input field for the value
                TextField(
                  controller: _inputController,
                  decoration: InputDecoration(
                    labelText: 'Enter Value',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),

                // Unit selection drop-downs
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      hint: Text("From Unit"),
                      value: _selectedFromUnit,
                      onChanged: (value) {
                        setState(() {
                          _selectedFromUnit = value;
                        });
                      },
                      items: _units.map((unit) {
                        return DropdownMenuItem(
                          value: unit,
                          child: Text(unit),
                        );
                      }).toList(),
                    ),
                    SizedBox(width: 10),
                    DropdownButton<String>(
                      hint: Text("To Unit"),
                      value: _selectedToUnit,
                      onChanged: (value) {
                        setState(() {
                          _selectedToUnit = value;
                        });
                      },
                      items: _units.map((unit) {
                        return DropdownMenuItem(
                          value: unit,
                          child: Text(unit),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Convert button
                ElevatedButton(
                  onPressed: _convert,
                  child: Text('Convert'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _convert() {
    double input = double.tryParse(_inputController.text) ?? 0;

    if (_selectedFromUnit == null || _selectedToUnit == null) {
      setState(() {
        _result = "Please select both units.";
      });
      return;
    }

    double output;
    // Conversion logic for each unit
    if (_selectedFromUnit == 'Kilometers' && _selectedToUnit == 'Miles') {
      output = input * 0.621371; // km to miles
    } else if (_selectedFromUnit == 'Miles' && _selectedToUnit == 'Kilometers') {
      output = input / 0.621371; // miles to km
    } else if (_selectedFromUnit == 'Kilometers' && _selectedToUnit == 'Meters') {
      output = input * 1000; // km to meters
    } else if (_selectedFromUnit == 'Meters' && _selectedToUnit == 'Kilometers') {
      output = input / 1000; // meters to km
    } else if (_selectedFromUnit == 'Kilometers' && _selectedToUnit == 'Centimeters') {
      output = input * 100000; // km to cm
    } else if (_selectedFromUnit == 'Centimeters' && _selectedToUnit == 'Kilometers') {
      output = input / 100000; // cm to km
    } else if (_selectedFromUnit == 'Kilometers' && _selectedToUnit == 'Yards') {
      output = input * 1093.61; // km to yards
    } else if (_selectedFromUnit == 'Yards' && _selectedToUnit == 'Kilometers') {
      output = input / 1093.61; // yards to km
    } else if (_selectedFromUnit == 'Miles' && _selectedToUnit == 'Meters') {
      output = input * 1609.34; // miles to meters
    } else if (_selectedFromUnit == 'Meters' && _selectedToUnit == 'Miles') {
      output = input / 1609.34; // meters to miles
    } else if (_selectedFromUnit == 'Miles' && _selectedToUnit == 'Centimeters') {
      output = input * 160934; // miles to cm
    } else if (_selectedFromUnit == 'Centimeters' && _selectedToUnit == 'Miles') {
      output = input / 160934; // cm to miles
    } else if (_selectedFromUnit == 'Miles' && _selectedToUnit == 'Yards') {
      output = input * 1760; // miles to yards
    } else if (_selectedFromUnit == 'Yards' && _selectedToUnit == 'Miles') {
      output = input / 1760; // yards to miles
    } else if (_selectedFromUnit == 'Meters' && _selectedToUnit == 'Centimeters') {
      output = input * 100; // meters to cm
    } else if (_selectedFromUnit == 'Centimeters' && _selectedToUnit == 'Meters') {
      output = input / 100; // cm to meters
    } else if (_selectedFromUnit == 'Meters' && _selectedToUnit == 'Yards') {
      output = input * 1.09361; // meters to yards
    } else if (_selectedFromUnit == 'Yards' && _selectedToUnit == 'Meters') {
      output = input / 1.09361; // yards to meters
    } else {
      output = input; // for same units
    }

    setState(() {
      _result = "$input $_selectedFromUnit = ${output.toStringAsFixed(2)} $_selectedToUnit";
    });
  }
}
