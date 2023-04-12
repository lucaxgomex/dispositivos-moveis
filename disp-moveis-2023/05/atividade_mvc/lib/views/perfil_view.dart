import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  final args;
  const Perfil({super.key, this.args});

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
                "https://st3.depositphotos.com/9998432/13335/v/600/depositphotos_133351884-stock-illustration-default-placeholder-woman.jpg",
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
            ]),
      ),
    );
  }
}
