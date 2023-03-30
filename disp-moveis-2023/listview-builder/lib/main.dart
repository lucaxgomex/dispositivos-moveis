import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Shopping List",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePage(),
    );
  }
}

class Item {
  String name;
  bool check;

  Item(this.name, this.check);
}

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  var items = <Item>[];

  HomePage({super.key}) {
    items = [];
    items.add(Item("Arroz", true));
    items.add(Item("Feijão", true));
    items.add(Item("Farinha", true));
  }

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: const <Widget>[
          Icon(Icons.local_grocery_store),
        ],
      ),
      body: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = widget.items[index];
            return CheckboxListTile(
              title: Text(item.name),
              key: Key(item.name),
              value: item.check,
              onChanged: (value) {
                setState(() {
                  item.check = !item.check;
                });
              },
            );
          }),
    );
  }
}
