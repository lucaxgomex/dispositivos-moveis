import 'package:flutter/material.dart';
import 'dart:math' show pow;

class IMC extends StatelessWidget {
  const IMC({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final TextEditingController _controllerPeso = TextEditingController();
  final TextEditingController _controllerAltura = TextEditingController();

  String imcResultado = '';

  double finalResult = 0;

  void _calculate() {
    setState(() {
      var peso = double.parse(_controllerPeso.text);
      var altura = double.parse(_controllerAltura.text) * 0.01;

      double imc = peso / pow(altura, 2);

      if (imc < 18.6) {
        imcResultado = 'Abaixo do peso';
      } else if (imc > 18.7 && imc < 24.9) {
        imcResultado = 'Peso ideal';
      } else if (imc > 25 && imc < 29.9) {
        imcResultado = 'Levemente acima do peso';
      } else if (imc > 30 && imc < 34.9) {
        imcResultado = 'Obesidade grau I';
      } else if (imc > 35 && imc < 39.9) {
        imcResultado = 'Obesidade grau II';
      } else if (imc >= 40) {
        imcResultado = 'Obesidade grau III';
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Resultado => ${imc.toStringAsFixed(2)}'),
          content: Center(
            child: Text(imcResultado),
          ),
        ),
      );
    });
  }

  void _clearField() {
    setState(() {
      _controllerPeso.clear();
      _controllerAltura.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('IMC Calculator: '),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _clearField,
          ),
        ],
      ),
      body: SingleChildScrollView(
        //padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-Z2YCMPrOwqdLwJ0aSRcuUG_pNollSjK6Pw&usqp=CAU',
              width: 200,
              height: 200,
            ),
            /*
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  scale: 1000.0,
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-Z2YCMPrOwqdLwJ0aSRcuUG_pNollSjK6Pw&usqp=CAU',
                ),
              ),
              */
            //Input 1
            Container(
              width: 300.0,
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _controllerPeso,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  //label: Text('teste: '),
                  labelText: 'Peso (Kg): ',
                  labelStyle: TextStyle(
                    color: Colors.green,
                    //fontSize: 25.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),

            // Input 2
            Container(
              width: 300.0,
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _controllerAltura,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  //label: Text('teste: '),
                  labelText: 'Altura (Cm): ',
                  labelStyle: TextStyle(
                    color: Colors.green,
                    //fontSize: 25.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),

            /*
              Container(
                width: 300.0,
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _alcoolValue,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('teste: '),
                  ),
                ),
              ),
              Container(
                width: 300.0,
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _gasValue,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Type here how much gasoline you want: '),
                  ),
                ),
              ),
              */

            const SizedBox(),

            // Buttom
            Container(
              width: 300.0,
              height: 50.0,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.green),
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                  ),
                ),
                //onPressed: _calculate,
                onPressed: _calculate,
                child: const Text(
                  "Calcular",
                  style: TextStyle(
                    color: Colors.white,
                    //fontSize: 25.0,
                  ),
                ),
              ),
            ),

            const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Pressione o botão acima para ver o resultado'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
