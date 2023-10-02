
import 'package:flutter/material.dart';
import 'package:multiple_child_widgets_examples/ui_screens/ColumnScreen.dart';
import 'package:multiple_child_widgets_examples/ui_screens/GridViewScreen.dart';
import 'package:multiple_child_widgets_examples/ui_screens/ListViewScreen.dart';
import 'package:multiple_child_widgets_examples/ui_screens/StackScreen.dart';
import 'package:multiple_child_widgets_examples/ui_screens/TableScreen.dart';
import 'package:multiple_child_widgets_examples/ui_screens/my_flow.dart';

import 'ui_screens/RowScreen.dart';

const widgetList = <Widget>[
 RowScreen(),
 ColumnScreen(),
 StackScreen(),
 ListViewScreen(),
 TableScreen(),
 GridViewScreen(),
 MyFlow()
];