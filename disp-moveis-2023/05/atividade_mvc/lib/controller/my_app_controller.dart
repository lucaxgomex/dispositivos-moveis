import 'package:flutter/material.dart';

import '../views/my_home_page_view.dart';

import 'package:app_perfil_usuario/model/pessoa_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class PessoaController{
  PessoaModel criarPessoa(String nome, String email){
    PessoaModel pessoa = PessoaModel(nome, email);
    return pessoa;
  }
}