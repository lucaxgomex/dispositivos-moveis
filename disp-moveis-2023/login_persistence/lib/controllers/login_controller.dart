import 'package:flutter/material.dart';
import '../views/login.dart';

class LoginController extends StatelessWidget {
  const LoginController({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginView(),
      },
    );
  }
}