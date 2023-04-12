import 'package:flutter/material.dart';
//import 'package:tabbar_application/widgets/cloud.dart';
import 'widgets/all.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.cloud_outlined)),
                Tab(icon: Icon(Icons.beach_access_sharp)),
                Tab(icon: Icon(Icons.brightness_5_sharp)),
              ],
            ),
            //title: const Text('Tabs Demo'),
            title: const Center(
              child: Text('My Little Tabs')
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              MyWidget(),
              //Icon(Icons.directions_car),
              Beach(),
              Sun(),
            ],
          ),
        ),
      ),
    );
  }
}
