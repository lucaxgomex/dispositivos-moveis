import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqf;

const script =
    'CREATE TABLE login(id INTEGER PRIMARY KEY, username TEXT, email TEXT)';

const String currentDatabase = 'login_database.db';

class DBClass {
  //  METODO
  static Future<sqf.Database> db() async 
  {
    WidgetsFlutterBinding.ensureInitialized();
    String path = join(await sqf.getDatabasesPath(), currentDatabase);

    var bd = await sqf.openDatabase(
      path, 
      version: 1,
      onCreate: (db, versaoRecente) async {
        await db.execute(script);
    });

    return bd;
  }

  // METODO
  static Future<int> insert(
    String username, 
    String email,
    String description, 
    String password) 
    async {
      final db = await DBClass.db();

      final values = {
        'username': username,
        'email': email,
        'description': description,
        'password': password
      };

      final id = await db.insert(
        'users', 
        values,
        conflictAlgorithm: sqf.ConflictAlgorithm.replace
      );

      return id;
    }
}

/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = sqf.openDatabase(
    // Estabelecendo a conexão com o banco de dados
    join(await sqf.getDatabasesPath(), currentDatabase),
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
*/

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
