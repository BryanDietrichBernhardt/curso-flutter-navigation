import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
        '/secondScreen': (context) => SecondScreen(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text("First Page"),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/secondScreen");
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
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Second Page"),
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
