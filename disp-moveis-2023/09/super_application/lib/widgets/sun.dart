import 'package:flutter/material.dart';

class Sun extends StatelessWidget {
  const Sun({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        'https://media2.giphy.com/media/hx7ZgqLsKBksV8LskJ/giphy.gif?cid=6c09b9529154f3963ddaaca0cb9a57c850c6381c0940c50e&rid=giphy.gif&ct=s'
      ),
    );
  }
}