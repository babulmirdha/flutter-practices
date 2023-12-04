import 'package:flutter/material.dart';

import 'second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String dataFromSecondPage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'Data from Second Page: $dataFromSecondPage',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Navigate to the ChildScreen and wait for the result
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  SecondPage(),
                  ),
                );

                // Update the state with the data received from the ChildScreen
                setState(() {
                  dataFromSecondPage = result ?? ''; // Use empty string if result is null
                });
              },
              child: Text('Go to Child Screen'),
            ),
          ],
        ),
      ),
    );
  }
}