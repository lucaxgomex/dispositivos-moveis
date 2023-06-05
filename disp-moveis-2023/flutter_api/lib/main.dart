import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String result = '';

  _buscaCep() async {
    var url = Uri.parse('https://viacep.com.br/ws/01001000/json/');
    http.Response response;

    response = await http.get(url);

  
    print(response.statusCode.toString());
    print(response.body.toString());

    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno['logradouro'];


    setState(() {
      result = logradouro;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Request'),
      ),
      body: Column(

        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                _buscaCep();
              },
              child: const Text('Busca CEP'),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 3.0),
            child: Text(
              result
            ),
          ),

        ],
      ),
    );
  }
}
