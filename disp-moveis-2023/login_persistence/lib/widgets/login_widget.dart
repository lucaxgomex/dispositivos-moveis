import 'package:flutter/material.dart';
import '../controllers/login_controller.dart';
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
  final _controller = LoginController();
  final _user = User(username: '', password: '');


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Login'
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha'
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
                onPressed: _controller,
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