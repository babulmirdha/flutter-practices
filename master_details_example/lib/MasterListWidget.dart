
import 'package:flutter/material.dart';

import 'item.dart';

class MasterListWidget extends StatelessWidget {
  final List<Item> items;
  final Function(Item, BuildContext) onItemSelected;

  const MasterListWidget({super.key, required this.items, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index].name),
          onTap: () {
            onItemSelected(items[index], context);
          },
        );
      },
    );
  }
}
