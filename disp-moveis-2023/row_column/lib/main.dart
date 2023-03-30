import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Centrelize Column and Row'),
          backgroundColor: Colors.purple[200],
        ),
        body: const App(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
} 

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        // Row 1
        Row(
          //Creates even space between each item and their parent container
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              color: Colors.blue, 
              height: 200, 
              width: 200, 
            ),
            Container(
              color: Colors.blue, 
              height: 200, 
              width: 200, 
            ),
          ],
        ),
        //Row 2
        SizedBox(
          height: 200,
          child: Row(
            //Stretches to vertically fill its parent container
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.green,
                  height: 200,
                  width: 200,
                  ),
                ),
              ],
            )
          ),
        // Row 3
        Row(
          //Creates even space between each item and their parent container
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              color: Colors.blue, 
              height: 200, 
              width: 200, 
            ),
            Container(
              color: Colors.blue, 
              height: 200, 
              width: 200, 
            ),
            Container(
              color: Colors.blue, 
              height: 200, 
              width: 200, 
            ),
          ],
        )
      ]
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Row 1
          Row(
            children: <Widget>[
              Container(
                color: Colors.blue, 
                height: 40, 
                width: 40, 
                child: const Text('1')),
              Container(
                color: Colors.blue, height: 40, width: 40, child: const Text('2')),
              Container(
                color: Colors.blue, height: 40, width: 40, child: const Text('3')),
            ],
          ),
          // Row 2
          Row(
            children: <Widget>[
              Container(
                color: Colors.blue, height: 40, width: 40, child: const Text('1')),
              //Will expand to fill all remaining space
              Expanded(
                  child: Container(
                    color: Colors.green,
                    height: 40,
                    width: 40,
                    child: const Text('2'))),
              Container(
                color: Colors.blue, height: 40, width: 40, child: const Text('3')),
            ],
          ),
          //Row 3
          SizedBox(
              height: 200,
              child: Row(
                //Stretches to vertically fill its parent container
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    color: Colors.blue,
                    height: 40,
                    width: 40,
                    child: const Text('1')),
                  Expanded(
                      child: Container(
                        color: Colors.green,
                        height: 40,
                        width: 40,
                        child: const Text('2'))),
                  Container(
                    color: Colors.blue,
                    height: 40,
                    width: 40,
                    child: const Text('3')),
                ],
              )),
          // Row 4
          Row(
            //Creates even space between each item and their parent container
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                color: Colors.blue, height: 40, width: 40, child: const Text('1')),
              Container(
                color: Colors.blue, height: 40, width: 40, child: const Text('1')),
              Container(
                color: Colors.blue, height: 40, width: 40, child: const Text('3')),
            ],
          )
        ]);
  }
}