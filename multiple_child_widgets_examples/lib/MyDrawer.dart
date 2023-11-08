import 'package:flutter/material.dart';
import 'package:multiple_child_widgets_examples/menu_items.dart';

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
          
          for(var item in widgetList) drawerListItem(context, widget: item)

        ],
      ),
    );
  }
}
