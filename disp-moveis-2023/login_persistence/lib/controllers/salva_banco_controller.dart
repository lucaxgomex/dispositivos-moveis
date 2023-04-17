import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

int idContato = 0;

openBanco() async {
  var dataBasePath = await getDatabasesPath();

  String path = join(dataBasePath, 'banco.db');

  var bd = await openDatabase(path, version: 1,
      onCreate: (db, versaoRecente) async {
    String sql =
        'CREATE TABLE contatos (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR)';
    await db.execute(sql);
  });

  print('Banco: ${bd.isOpen.toString()}');
  return bd;
}

salvar() async {
  Database db = await openBanco();

  Map<String, dynamic> dadosContato = {
    'nome': 'Dalila Natanne',
  };

  setState(() async {
    idContato = await db.insert('contatos', dadosContato);
  });
}