import 'package:flutter/material.dart';
import 'package:single_child_widgets_examples/ui_screens/AlignScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/AspectRatioScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/BaselineScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/ConstrainedBoxScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/CustomSingleChildLayoutScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/FittedBoxScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/FractionallySizedBoxScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/IntrinsicHeightScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/IntrinsicWidthScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/LimitedBoxScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/OffstageScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/OverflowBoxScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/PaddingScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/SizedOverflowBoxScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/TransformScreen.dart';
import 'package:single_child_widgets_examples/ui_screens/CustomSingleChildLayoutWidget.dart';

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
          drawerListItem(context, widget: const PaddingScreen()),
          drawerListItem(context, widget: const AlignScreen()),
          drawerListItem(context, widget: const FittedBoxScreen()),
          drawerListItem(context, widget: const AspectRatioScreen()),
          drawerListItem(context, widget: const ConstrainedBoxScreen()),
          drawerListItem(context, widget: const BaselineScreen()),
          drawerListItem(context, widget: const FractionallySizedBoxScreen()),
          drawerListItem(context, widget: const IntrinsicHeightScreen()),
          drawerListItem(context, widget: const IntrinsicWidthScreen()),
          drawerListItem(context, widget: const LimitedBoxScreen()),
          drawerListItem(context, widget: const OffstageScreen()),
          drawerListItem(context, widget: const OverflowBoxScreen()),
          drawerListItem(context, widget: const SizedOverflowBoxScreen()),
          drawerListItem(context, widget: const TransformScreen()),
          drawerListItem(context, widget:  CustomSingleChildLayoutScreen()),
        ],
      ),
    );
  }
}
