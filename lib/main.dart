import 'package:flutter/material.dart';
import 'models/PC_Control.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PCControl pcControl = PCControl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('PC Control')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: pcControl.restart,
                child: Text('Restart'),
              ),
              ElevatedButton(
                onPressed: pcControl.hibernate,
                child: Text('Hibernate'),
              ),
              ElevatedButton(
                onPressed: pcControl.shutdown,
                child: Text('Shutdown'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
