// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Item {
  String name;
  bool check;

  Item(this.name, this.check);
}

// ignore: must_be_immutable
class MyList extends StatefulWidget {
  var items = <Item>[];

  MyList({super.key}) {
    items = [];
    items.add(Item('Arroz', true));
    items.add(Item('Feijao', false));
    items.add(Item('Carne', false));
    items.add(Item('Macaxeira', false));
    items.add(Item('Abobora', false));
    items.add(Item('Frango', false));
  }

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
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
