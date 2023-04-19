//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  final String inputLink;
  const MyWidget({super.key, required this.inputLink});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController textEditingControllerPessoaNome =
        TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      margin: const EdgeInsets.all(10.0),
      child: TextFormField(
        autofocus: true,
        keyboardType: TextInputType.url,
        decoration: const InputDecoration(
          label: Text('Type your email here: '),
        ),
        controller: textEditingControllerPessoaNome,
      ),
    );
  }
}
