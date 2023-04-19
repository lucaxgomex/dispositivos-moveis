import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(
    title: "Gasoline x Alcool",
  ));
}

class MyApp extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final title;
  const MyApp({super.key, this.title = ''});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _alcoolValue = TextEditingController();
  final TextEditingController _gasValue = TextEditingController();

  String result = '';

  double finalResult = 0;

  void _calcular() {
    setState(() {
      finalResult =
          (double.parse(_alcoolValue.text) / double.parse(_gasValue.text)) *
              100.0;

      if (finalResult >= 70.0) {
        result = 'You should use ALCOOL';
      } else {
        result = 'You should use GASOLINE';
      }
    });

    /*
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Resultado => ${imc.toStringAsFixed(2)}'),
          content: Center(
            child: Text(imcResultado),
          ),
        ),
      );
      */
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Gasoline x Alcool'),
            ),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                scale: 1000.0,
                'https://media.istockphoto.com/vectors/stream-of-gold-coins-pours-from-the-fuel-handle-pump-nozzle-with-hose-vector-id1251678227?k=20&m=1251678227&s=612x612&w=0&h=WueKOjZwKgOk0wRBcj9zhL7Bli9N4Vy3vs8NcDJHwBA=',
              ),
            ),
            Container(
              width: 300.0,
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _alcoolValue,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Type here how much alcool you want: '),
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
            ElevatedButton(
              onPressed: _calcular,
              child: const Text('Calculate'),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                    'RS${finalResult.toStringAsFixed(2)}! $result'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
