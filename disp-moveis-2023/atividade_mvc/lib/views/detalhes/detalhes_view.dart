import 'package:flutter/material.dart';

import 'package:app_perfil_usuario/model/pessoa_model.dart';
import 'package:app_perfil_usuario/views/detalhes/detalhes_parametros_view.dart';

class DetalhesView extends StatelessWidget {
  const DetalhesView({super.key});

  // Esta função é responsável pela criação de uma linha da tabela.
  // Ela recebe como parâmetros o contexto do widget, uma lista de widgets e o parâmetro adicional cor.
  
  Widget construirLinha(BuildContext context, List<Widget> elementos, {Color color = Colors.black}) {
    return Container(
      color: color,
      width: MediaQuery.of(context).size.width,
      height: 60,
      margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: elementos,
      ),
    );
  }

  // Esta função é responsável por definir as características dos textos.
  // O resultado do texto podem ser diferentes se o parâmetro titulo for passado como false.
  // Se o título for falso, o estilo do widget texto é alterado para o formato definido.
  Widget construirTexto(String texto, { bool titulo = true}){
    return Text(texto, style: TextStyle(fontSize: titulo? 25: 15, color: titulo ? Colors.white : Colors.black));
  }

  @override
  Widget build(BuildContext context) {
    final parametros = ModalRoute.of(context)!.settings.arguments as DetalhesParametros;

    PessoaModel pessoa = parametros.pessoa;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: Column(children: [
        construirLinha(context, [
          construirTexto('Nome'),
          construirTexto('E-mail')
        ]),
        construirLinha(context, [
          construirTexto(pessoa.nome, titulo: false),
          construirTexto(pessoa.email, titulo: false)
        ], color: Colors.grey.shade200)
      ]),
    );
  }
}
