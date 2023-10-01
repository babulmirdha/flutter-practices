import 'package:flutter/material.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body: Table(
        children: const <TableRow>[
          TableRow(
            children: <Widget>[
              TableCell(child: Center(child: Text('Cell 1'))),
              TableCell(child: Center(child: Text('Cell 2'))),
            ],
          ),
          TableRow(
            children: <Widget>[
              TableCell(child: Center(child: Text('Cell 3'))),
              TableCell(child: Center(child: Text('Cell 4'))),
            ],
          ),
        ],
      ),
    );
  }
}
