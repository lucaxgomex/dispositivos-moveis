import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqf;

const script =
    'CREATE TABLE login(id INTEGER PRIMARY KEY, username TEXT, email TEXT)';

const String db = 'login_database.db';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = sqf.openDatabase(
    // Estabelecendo a conexão com o banco de dados
    join(await sqf.getDatabasesPath(), db),
    onCreate: (db, version) {
      // Criação da tabela
      return db.execute(
        script
      );
    },
    version: 1,
  );
}




static Future<int> createPessoa(
      String nome, String email, String senha) async {
    final db = await SQLHelper.db();

    final data = {'nome': nome, 'email': email, 'senha': senha};
    final id = await db.insert('pessoas', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
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