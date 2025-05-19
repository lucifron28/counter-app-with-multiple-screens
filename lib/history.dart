import 'package:flutter/material.dart';
import 'app.dart';

class CounterHistory extends StatelessWidget {
  const CounterHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter History'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.tertiary,
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final value = history[index];
          return ListTile(title: Text(value));
        },
      ),
    );
  }
}
