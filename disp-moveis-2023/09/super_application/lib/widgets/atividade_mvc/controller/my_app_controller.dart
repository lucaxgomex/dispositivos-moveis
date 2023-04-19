import 'package:flutter/material.dart';

import '../views/form.dart';

class MVCApplication extends StatelessWidget {
  const MVCApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //routes: <String, WidgetBuilder>{
      //  "/perfil": (BuildContext context) => const Perfil(),
      //}
    );
  }
}