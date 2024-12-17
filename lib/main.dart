import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'next_page.dart';
import 'form_page.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  String text = '初期値';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Widget Sample'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              developer.log('Add button pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              developer.log('Share button pressed');
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Foo',
                style: TextStyle(
                    fontSize: 40,
                    // color: Colors.purpleAccent,
                    // fontWeight: FontWeight.bold,
                    // fontStyle: FontStyle.italic,
                    // decoration: TextDecoration.underline,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = Colors.blue[700]!),
              ),
              const Text(
                'Bar',
                style: TextStyle(fontSize: 40, fontFamily: 'Raleway'),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FormPage()));
                  },
                  child: const Text('入力フォーム'),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
