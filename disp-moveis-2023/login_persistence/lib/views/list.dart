import 'package:flutter/material.dart';
import '../widgets/list_widget.dart';

class ListDataView extends StatelessWidget {
  const ListDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro')
      ),
      body: const ListWidget(),
    );
  }
}
