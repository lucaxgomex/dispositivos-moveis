import 'package:flutter/material.dart';

import '../data/list_user.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  List<Map<String, dynamic>> _allPessoas = [];

  bool _isLoading = true;

  void _refreshContato() async {
    final pessoas = await SQLHelper.getAllPessoas();
    setState(() {
      _allPessoas = pessoas;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshContato();
  }

  Future<void> _deletePessoa(int id) async {
    await SQLHelper.deletePessoa(id);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text("Contato deletado!"),
    ));
    _refreshContato();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECEAF4),
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _allPessoas.length,
              itemBuilder: (context, index) => Card(
                    margin: const EdgeInsets.all(15),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          _allPessoas[index]['nome'],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      subtitle: Text(_allPessoas[index]["email"]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              _deletePessoa(_allPessoas[index]['id']);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.add),
      ),
    );
  }
}