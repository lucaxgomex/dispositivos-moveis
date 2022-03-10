import 'package:flutter/material.dart';

void main() {
  //runApp(const MyApp());
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('I am poor'),
        backgroundColor: Colors.green[900],
      ),
      body: const Center(
        child: Image(
          image: AssetImage('images/coal.png'),
        ),
      ),
    ),
  ));
}
