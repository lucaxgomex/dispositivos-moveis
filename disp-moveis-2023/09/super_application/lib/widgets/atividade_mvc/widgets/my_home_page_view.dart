import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final args;
  final String url;
  const Perfil({super.key, this.args, required this.url});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(
              widget.url,
              width: 150.0,
              height: 150.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(widget.args.nome),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(widget.args.email),
            )
          ]
        ),
      ),
    );
  }
}
