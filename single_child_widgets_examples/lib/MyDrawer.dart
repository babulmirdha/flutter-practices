import 'package:flutter/material.dart';
import 'package:single_child_widgets_examples/ui_screens/AlignScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/AspectRatioScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/BaselineScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/ConstrainedBoxScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/FittedBoxScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/FractionallySizedBoxScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/PaddingScreen.dart';

import 'ui_screens/SettingsScreen.dart';


Widget drawerListItem(BuildContext context, {required String title, required Widget widget}){
  return    ListTile(
    title: Text(title),
    onTap: () {
      // Handle drawer item tap for Settings
      Navigator.pop(context); // Close the drawer
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
             widget), // Navigate to SettingsScreen
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

          drawerListItem(context, title: 'Padding', widget:  const PaddingScreen()),
          drawerListItem(context, title: 'Align', widget:  const AlignScreen()),
          drawerListItem(context, title: 'FittedBoxScreen', widget:  const FittedBoxScreen()),
          drawerListItem(context, title: 'AspectRatio', widget:  const AspectRatioScreen()),
          drawerListItem(context, title: 'ConstrainedBoxScreen', widget:  const ConstrainedBoxScreen()),
          drawerListItem(context, title: "BaselineScreen", widget:  const BaselineScreen()),
          drawerListItem(context, title: "FractionallySizedBoxScreen", widget:  const FractionallySizedBoxScreen()),

        ],
      ),
    );
  }
}
