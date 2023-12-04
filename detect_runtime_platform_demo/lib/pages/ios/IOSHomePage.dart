import 'package:flutter/cupertino.dart';

class IOSHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('iOS App'),
      ),
      child: Center(
        child: Text('Welcome to iOS App!'),
      ),
    );
  }
}