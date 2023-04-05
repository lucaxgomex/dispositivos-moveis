import 'package:app_perfil_usuario/views/home/formulario_pessoa_view.dart';
import 'package:app_perfil_usuario/views/home/image_pessoa_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  // Parte inicial da aplicação,  nela se encontram
  // os dois componentes principais imagem e formulário de cadastro.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro APP'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ImageHomeView(),
                FormularioPessoa()
              ],
            ),
          ),
        ),
      ),
    );
  }
}