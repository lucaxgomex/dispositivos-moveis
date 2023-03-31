import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  final TextEditingController _alcoolValue = TextEditingController();
  final TextEditingController _gasValue = TextEditingController();

  var abastecimentoIdeal = '';

  double finalResult = 0;

  void _calcular() {
    setState(() {
      //var valorAlcool = double.parse(_alcoolValue.text);
      //var valorGasolina = double.parse(_gasValue.text);

      //finalResult = valorAlcool / valorGasolina * 100;

      finalResult =
          (double.parse(_alcoolValue.text) / double.parse(_gasValue.text)) *
              100.0;

      if (finalResult >= 70) {
        abastecimentoIdeal = "-> Abastecer com Alcool";
      } else {
        abastecimentoIdeal = "-> Abastecer com Gasolina";
      }
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
        actions: <Widget> [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
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
                  controller: _alcoolValue,
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
                  controller: _alcoolValue,
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
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                    ),
                    
                  ),
                
                  onPressed: _calcular,
                  child: const Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      //fontSize: 25.0,
                    ),
                  ),
                ),
              ),
       
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                      "Resultado: ${finalResult.toStringAsFixed(1)} $abastecimentoIdeal"
                    ),
                ),
              ),
            ],
          ),
       ),
    );
  }
}
