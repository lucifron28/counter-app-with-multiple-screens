import 'package:flutter/material.dart';
import 'history.dart';

class CounterApp extends StatelessWidget {
  CounterApp({super.key});

  final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    primary: Colors.blue,
    secondary: Colors.green,
    tertiary: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(colorScheme: colorScheme, useMaterial3: true),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

List<String> history = [];

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
      history.add('Counter Incremented: $_counter');
    });
  }

  void decrementCounter() {
    setState(() {
      _counter--;
      history.add('Counter Decremented: $_counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Counter App'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CounterHistory()),
                ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Text(
                  'Counter Value:',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: incrementCounter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Increment'),
                ),
                ElevatedButton(
                  onPressed: decrementCounter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Decrement'),
                ),
              ],
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
