import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        'https://cdn.dribbble.com/users/2000228/screenshots/6833456/gif_cloud.gif'
      ),
    );
  }
}