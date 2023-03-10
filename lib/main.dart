import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// classe para passar argumentos por rotas
class SecondScreenArgs {
  final int id;
  final String name;

  SecondScreenArgs(this.id, this.name);
}

// precisa obrigatóriamente ter um StatelessWidget inicialmente para chamar o home e inicial as rotas das telas
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        SecondScreen.routeName: (context) => SecondScreen()
        //'/secondScreen': (context) => SecondScreen(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int count = 1;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text("First Page"),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/secondScreen",
                    arguments: SecondScreenArgs(1, "Bryan $count"));
                count++;
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return const SecondScreen();
                // }));
              },
              child: const Text("Next Page"),
            ),
          )),
    );
  }
}

class SecondScreen extends StatelessWidget {
  // identificação da rota
  static const routeName = "/secondScreen";

  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as SecondScreenArgs;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Second Page ${arguments.name}"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            child: const Text("Return"),
          ),
        ),
      ),
    );
  }
}
