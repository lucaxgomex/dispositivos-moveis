import 'package:flutter/material.dart';

class Beach extends StatelessWidget {
  const Beach({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        'https://media.tenor.com/XzIiN6XMP0wAAAAC/pool-cartoon.gif'
      ),
    );
  }
}