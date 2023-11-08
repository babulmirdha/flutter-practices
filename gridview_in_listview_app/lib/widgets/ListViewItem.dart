import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ListItem.dart';
import 'GridViewItem.dart';

class ListViewItem extends StatelessWidget {


  final ListItem listItem;

   const ListViewItem({super.key, required this.listItem });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Text(listItem.title),

        GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns in the grid
          crossAxisSpacing: 8.0, // Spacing between the columns
          mainAxisSpacing: 8.0, // Spacing between the rows
        ),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
          return GridViewItem(gridItem: listItem.gridItems[index]);
        },
            itemCount: listItem.gridItems.length,



        )


      ],
    );
  }

}

