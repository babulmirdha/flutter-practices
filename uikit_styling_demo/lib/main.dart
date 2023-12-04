import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatelessWidget {

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino Icons Example'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.heart_fill, // Use any Cupertino icon you like
              size: 50.0,
              color: CupertinoColors.systemRed,
            ),
            SizedBox(height: 20.0),
            Text(
              'Hello Cupertino Icons!',
              style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
            CupertinoButton(
              child: Text('Show Alert'),
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    title: Text('Cupertino Alert'),
                    content: Text('This is a Cupertino-style alert.'),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

