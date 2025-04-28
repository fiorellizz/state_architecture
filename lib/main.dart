import 'package:flutter/material.dart';
import 'package:state_architecture/screens/state_pattern_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exemplo Padrão State',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StatePatternScreen(),
    );
  }
}