import 'package:flutter/material.dart';

import '../model/pessoa_model.dart';
import '../widgets/my_home_page_view.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController urlController =
        TextEditingController();

    TextEditingController emailController =
        TextEditingController();

    TextEditingController usernameController =
        TextEditingController();

    TextEditingController psswdController = TextEditingController();

    void cadastro() {
      PessoaModel novaPessoa = PessoaModel(
        emailController.text,
        usernameController.text
      );
      //Navigator.pushNamed(context, "/perfil", arguments: <String, String>{
      //  'nome': novaPessoa.nome,
      //  "email": novaPessoa.email,
      //});

      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (
            BuildContext context) => Perfil(
              args: novaPessoa,
              url: urlController.text
          ),
        )
      );
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
            Container(
              width: 500.0,
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                enableInteractiveSelection: true,
                autofocus: true,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                  label: Text('Type your image link here: '),
                ),
                controller: urlController,
              ),
            ),

            Container(
              width: 500.0,
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text('Type your email here: '),
                ),
                controller: emailController,
              ),
            ),


            Container(
              width: 500.0,
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  label: Text('Type your username here: '),
                ),
                controller: usernameController,
              ),
            ),


            Container(
              width: 500.0,
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Type your password here: '),
                ),
                controller: psswdController,
              ),
            ),


            ElevatedButton(
              onPressed: cadastro,
              child: const Text('Register'),
            ),
          ])),
    );
  }
}
