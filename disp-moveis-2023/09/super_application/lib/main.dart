import 'package:flutter/material.dart';

//import 'widgets/all.dart';

import 'widgets/list_view_builder/main.dart';
import 'widgets/bottom_navigation_bar/main.dart';
import 'widgets/gas_station/main.dart';
import 'widgets/row_column/main.dart';
import 'widgets/imc_calculator/main.dart';
import 'widgets/atividade_mvc/controller/my_app_controller.dart';

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
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.local_grocery_store)),
                Tab(icon: Icon(Icons.pageview)),
                Tab(icon: Icon(Icons.local_gas_station)),
                Tab(icon: Icon(Icons.verified_user)),
                Tab(icon: Icon(Icons.rowing)),
                Tab(icon: Icon(Icons.boy_rounded)),
              ],
            ),
            //title: const Text('Tabs Demo'),
            title: const Center(
              child: Text('My Little Tabs')
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              MyList(),
              const MyRow(),
              const MyApp(),
              const MVCApplication(),
              const RowAndColumn(),
              const IMC(),
            ],
          ),
        ),
      ),
    );
  }
}
