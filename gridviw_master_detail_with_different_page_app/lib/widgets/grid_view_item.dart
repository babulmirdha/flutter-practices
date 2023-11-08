import 'package:flutter/material.dart';
import 'package:gridviw_master_detail_with_different_page_app/models/grid_item.dart';

class GridViewItem extends StatelessWidget {

 final GridItem gridItem;

  const GridViewItem({super.key, required this.gridItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/${gridItem.imageName}"),
        Text(gridItem.text)
      ],
    );
  }
}
