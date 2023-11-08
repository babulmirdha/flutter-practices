import 'package:flutter/material.dart';
import 'package:gridview_in_list_app/models/GridItem.dart';

class GridViewItem  extends StatelessWidget{
  final GridItem gridItem;
   const GridViewItem({super.key,required this.gridItem});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(8),
      color: Colors.blue,
      child: Center(
        child: Text(
          'Item ${gridItem.title}',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );


  }
}