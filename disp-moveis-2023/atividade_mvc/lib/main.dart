//import 'package:app_perfil_usuario/views/detalhes/detalhes_view.dart';
import 'views/my_home_page_view.dart';

import 'package:flutter/material.dart';


import 'package:app_perfil_usuario/views/detalhes/detalhes_view.dart';
import 'package:app_perfil_usuario/views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      /*
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      */
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: Colors.black, secondary: Colors.green)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //routes: <String, WidgetBuilder>{
      //  "/perfil": (BuildContext context) => const Perfil(),
      //}
      routes: {
        'home': (context) => const HomeView(),
        'details': (context) => const DetalhesView(),
      },
    );
  }
}
