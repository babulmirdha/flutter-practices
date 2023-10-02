import 'package:flutter/material.dart';
import 'package:multiple_child_widgets_examples/ui_screens/ColumnScreen.dart';
import 'package:multiple_child_widgets_examples/ui_screens/RowScreen.dart';
import 'package:multiple_child_widgets_examples/ui_screens/GridViewScreen.dart';
import 'package:multiple_child_widgets_examples/ui_screens/ListViewScreen.dart';
import 'package:multiple_child_widgets_examples/ui_screens/TableScreen.dart';
import 'package:multiple_child_widgets_examples/ui_screens/my_flow.dart';

import 'ui_screens/StackScreen.dart';

Widget drawerListItem(BuildContext context, {required Widget widget}) {
  return ListTile(
    title: Text(widget.runtimeType.toString()),
    onTap: () {
      // Handle drawer item tap for Settings
      Navigator.pop(context); // Close the drawer
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => widget), // Navigate to SettingsScreen
      );
    },
  );
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'My App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          drawerListItem(context, widget: const RowScreen()),
          drawerListItem(context, widget: const ColumnScreen()),
          drawerListItem(context, widget: const StackScreen()),
          drawerListItem(context, widget: const ListViewScreen()),
          drawerListItem(context, widget: const TableScreen()),
          drawerListItem(context, widget: const GridViewScreen()),
          drawerListItem(context, widget: const MyFlow()),

        ],
      ),
    );
  }
}
