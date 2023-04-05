import 'package:app_perfil_usuario/views/perfil_view.dart';
import 'package:flutter/material.dart';

import '../model/pessoa_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //PessoaModel pessoa1 = new PessoaModel("", "");

    TextEditingController textEditingControllerPessoaNome = TextEditingController();
    TextEditingController textEditingControllerPessoaEmail = TextEditingController();

    void cadastro() {
      PessoaModel novaPessoa = PessoaModel(
          textEditingControllerPessoaNome.text,
          textEditingControllerPessoaEmail.text);
      //Navigator.pushNamed(context, "/perfil", arguments: <String, String>{
      //  'nome': novaPessoa.nome,
      //  "email": novaPessoa.email,
      //});
      Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => Perfil(args: novaPessoa),
          ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Image.network(
              "https://st3.depositphotos.com/9998432/13335/v/600/depositphotos_133351884-stock-illustration-default-placeholder-woman.jpg",
              width: 200.0,
              height: 200.0,
            ),
            Container(
              width: 300.0,
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text("Nome"),
                ),
                controller: textEditingControllerPessoaNome,
              ),
            ),
            Container(
              width: 300.0,
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text("Email"),
                ),
                controller: textEditingControllerPessoaEmail,
              ),
            ),
            ElevatedButton(
              onPressed: cadastro,
              child: const Text("Enviar"),
            ),
          ])),
    );
  }
}
