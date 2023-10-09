import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body: GridView.count(
        crossAxisCount: 3, // Number of columns
        children: [
          ...List.generate(9, (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        }),
          ...[
            const Center(child: Text("My Item 1")),
            const Center(child: Text("My Item 2")),
          ]

        ],
      ),
    );
  }
}
