import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String _dropdownValue = 'Colors';

  Color getColor() {
    if (_dropdownValue == 'Red') {
      return Colors.red;
    } else if (_dropdownValue == 'Blue') {
      return Colors.blue;
    } else if (_dropdownValue == 'Green') {
      return Colors.green;
    } else if (_dropdownValue == 'Yellow') {
      return Colors.yellow;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColor(),
      appBar: AppBar(
        title: Text('Drop Down App'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: _dropdownValue,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            _dropdownValue = newValue!;
            setState(() {
              getColor();
            });
          },
          items: <String>['Colors', 'Red', 'Blue', 'Green', 'Yellow']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
