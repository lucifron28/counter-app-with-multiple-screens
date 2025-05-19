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
          final reversedHistory = history.reversed.toList();
          final value = reversedHistory[index];
          return ListTile(
            title: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                padding:EdgeInsets.all(8.0),
                color:
                    reversedHistory[index].contains('Incremented')
                        ? Colors.greenAccent
                        : Colors.redAccent,
                child: Text(value),
              ),
            ),
          );
        },
      ),
    );
  }
}
