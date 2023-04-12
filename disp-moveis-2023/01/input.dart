import 'dart:io';

void main() {
  stdout.write('Digite um valor: ');
  String? input = stdin.readLineSync();
  print('O valor digitado foi: $input');
}

