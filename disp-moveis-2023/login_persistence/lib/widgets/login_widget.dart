import 'package:flutter/material.dart';
import '../models/pessoa_model.dart';
//import '../views/home_view.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  //final _user = User(username: '', password: '');

  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> _register() async {
    User newUser = User(
      _controllerUsername.text,
      _controllerEmail.text,
      _controllerDescription.text,
      _controllerPassword.text
    );

  }

  /*

  Future<void> _cadastro() async {
      PessoaModel novaPessoa = PessoaModel(
          _textEditingControllerPessoaNome.text,
          _textEditingControllerPessoaEmail.text,
          _textEditingControllerPessoaSenha.text);

      await SQLHelper.createPessoa(
          novaPessoa.nome, novaPessoa.email, novaPessoa.senha);

      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => ListaPessoaView(),
        ),
      );
    }

  */

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 300.0,
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _controllerUsername,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  //label: Text('teste: '),
                  labelText: 'Username: ',
                  labelStyle: TextStyle(
                    color: Colors.green,
                    //fontSize: 25.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 300.0,
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _controllerEmail,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  //label: Text('teste: '),
                  labelText: 'E-mail: ',
                  labelStyle: TextStyle(
                    color: Colors.green,
                    //fontSize: 25.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 300.0,
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _controllerDescription,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  //label: Text('teste: '),
                  labelText: 'Description: ',
                  labelStyle: TextStyle(
                    color: Colors.green,
                    //fontSize: 25.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 300.0,
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _controllerPassword,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  //label: Text('teste: '),
                  labelText: 'Peso (Kg): ',
                  labelStyle: TextStyle(
                    color: Colors.green,
                    //fontSize: 25.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            
            SizedBox(
              width: 300.0,
              height: 50.0,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.green),
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                  ),
                ),
                //onPressed: _calculate,
                onPressed: _register,
                child: const Text(
                  'Cadastrar',
                  style: TextStyle(
                    color: Colors.white,
                    //fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
