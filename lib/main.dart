import 'package:demo_pigeon_ios/pigeons/message_generated.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  String text = "Default";

  Future<void> call() async {
    final res = await PigeonApi().testMessage("From Flutter");

    setState(() {
      text = res.response ?? "Cannot get Native message";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: call,
        tooltip: 'Call Native',
        child: const Icon(Icons.add),
      ),
    );
  }
}
