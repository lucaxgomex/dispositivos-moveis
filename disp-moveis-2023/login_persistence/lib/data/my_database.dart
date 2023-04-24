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
      return db.execute(script);
    },
    version: 1,
  );

  // Inserindo dados no banco de dados
  await database.then((db) {
    db.insert(
      'login',
      {'username': 'usuario', 'password': '123456'},
      conflictAlgorithm: sqf.ConflictAlgorithm.replace,
    );
  });
}
  // Lendo dados do banco de dados
  /*
  final List<Map<String, dynamic>> maps = await database.query('login');

  // Imprimindo os dados lidos do banco de dados
  maps.forEach((map) {
    print(
        'id: ${map['id']}, username: ${map['username']}, password: ${map['password']}');
  });
}
*/

/*

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static String CREATE_PESSOAS_TABLE_SCRIPT =
      "CREATE TABLE pessoas(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, nome TEXT, senha TEXT, email TEXT, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)";

  static Future<sql.Database> db() async {
    var dataBasePath = await sql.getDatabasesPath();

    String path = join(dataBasePath, 'banco.db');

    var bd = await sql.openDatabase(path, version: 1,
        onCreate: (db, versaoRecente) async {
      await db.execute(CREATE_PESSOAS_TABLE_SCRIPT);
    });

    print('Banco: ' + bd.isOpen.toString());

    return bd;
  }

  static Future<int> createPessoa(
      String nome, String email, String senha) async {
    final db = await SQLHelper.db();

    final data = {'nome': nome, 'email': email, 'senha': senha};
    final id = await db.insert('pessoas', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getAllPessoas() async {
    final db = await SQLHelper.db();

    return db.query('pessoas', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getPessoaByName(String nome) async {
    final db = await SQLHelper.db();

    return db.query('pessoas', where: "nome = ?", whereArgs: [nome]);
  }

  static Future<List<Map<String, dynamic>>> getPessoaById(int id) async {
    final db = await SQLHelper.db();

    return db.query('pessoas', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updatePessoa(int id, String nome, String email) async {
    final db = await SQLHelper.db();

    final data = {
      'nome': nome,
      'email': email,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('pessoas', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deletePessoa(int id) async {
    final db = await SQLHelper.db();

    try {
      await db.delete('pessoas', where: "id = ?", whereArgs: [id]);
    } catch (e) {}
  }
}

*/