import 'package:flutter/material.dart';

class List1 extends StatelessWidget {
  const List1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return Container(
      
    );*/
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.amber[300],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }
}

class List2 extends StatelessWidget {
  const List2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return Container(
      
    );*/
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.blueAccent[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.blueAccent[400],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.blueAccent[200],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }
}

class List3 extends StatelessWidget {
  const List3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return Container(
      
    );*/
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.deepPurple[800],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.deepPurple[600],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.deepPurple[400],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }
}