import 'package:auth_firebase/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/login': (context) => const LoginPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        Navigator.of(context).pushNamed('/login');
      } else {
        print('User is signed in!');
        Navigator.of(context).pushNamed('/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerPeso = TextEditingController();
  final TextEditingController _controllerAltura = TextEditingController();

  final _firebaseAuth = FirebaseAuth.instance;

  login() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: _controllerPeso.text,
        password: _controllerAltura.text,
      );

      if (UserCredential != null) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed('/');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario nao encontrado'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Senha Invalida'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  sair() async {
    await _firebaseAuth.signOut().then((user) => null)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 230, 231),
      appBar: AppBar(
        title: const Text('IMC Calculator'),
        backgroundColor: const Color.fromARGB(255, 19, 159, 201),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        //padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  scale: 1000.0,
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-Z2YCMPrOwqdLwJ0aSRcuUG_pNollSjK6Pw&usqp=CAU',
                ),
              ),

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

              // Buttom
              SizedBox(
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
                  onPressed: login,
                  child: const Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      //fontSize: 25.0,
                    ),
                  ),
                ),
              ),

              /*
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Press the buttom above to check the result'),
                ),
              ),
              */
            ],
          ),
        ),
      ),
    );
  }
}
