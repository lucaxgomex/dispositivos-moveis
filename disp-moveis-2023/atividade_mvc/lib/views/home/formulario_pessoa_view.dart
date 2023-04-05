import 'package:app_perfil_usuario/model/pessoa_model.dart';

import 'package:app_perfil_usuario/controller/my_app_controller.dart';

import 'package:flutter/material.dart';
import 'package:app_perfil_usuario/views/detalhes/detalhes_parametros_view.dart';
import 'package:flutter/services.dart';

// Está classe é responsável por criar o formulário
// de cadastro da pessoa.
class FormularioPessoa extends StatefulWidget {
  const FormularioPessoa({super.key});

  @override
  State<FormularioPessoa> createState() => _FormularioPessoaState();
}

class _FormularioPessoaState extends State<FormularioPessoa> {
  final _nomeTextController = TextEditingController();
  final _emailTextController = TextEditingController();

  final pessoaController = PessoaController();
  
  final _formkey = GlobalKey<FormState>();

  // Esta função é responsável pela validação dos campos
  // do formuário, verificando se estão vazios.
  String? validarCampo(String? value) {
    if (value == null || value.isEmpty) {
      return "Por favor, digite um valor";
    }

    return null;
  }

  // Nesta função os controladores dos campos são resetados,
  // juntamente com o estado do formulário.
  void _limparCampos() {
    _formkey.currentState!.reset();

    setState(() {
      _nomeTextController.clear();
      _emailTextController.clear();
    });
  }

  // Após verificar se as informações são válidas,
  // os dados são enviadas para a tela de datalhes.
  void verDetalhesDoCadastro() {
    if (_formkey.currentState!.validate()) {
      PessoaModel pessoa = pessoaController.criarPessoa(_nomeTextController.text, _emailTextController.text);
      Navigator.pushNamed(context, 'detalhes', arguments: DetalhesParametros(pessoa));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 350,
      height: 220,
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              controller: _nomeTextController,
              inputFormatters: [LengthLimitingTextInputFormatter(30)],
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Nome')),
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              validator: validarCampo,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailTextController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Email')),
              onEditingComplete: () => FocusScope.of(context).unfocus(),
              validator: validarCampo,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: _limparCampos,
                  icon: const Icon(Icons.clear),
                  label: const Text("Limpar"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                ),
                ElevatedButton(
                    onPressed: verDetalhesDoCadastro,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    child: const Text('Concluído')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
