import 'package:diah/page/form.dart';
import 'package:flutter/material.dart';
import 'package:diah/page/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Program Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Flutter Demo Home Page';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MyDrawer(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_counter % 2 == 0)
              const Text(
                'GENAP',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              )
            else
              const Text(
                'GANJIL',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 32),
        child: Row(
          // adjust alignment based on counter value
          mainAxisAlignment: _counter == 0
              ? MainAxisAlignment.end
              : MainAxisAlignment.spaceBetween,
          children: [
            if (_counter > 0)
              FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.remove),
              ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
