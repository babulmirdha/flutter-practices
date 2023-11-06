

import 'package:flutter/material.dart';

import '../models/GridItem.dart';
import '../models/ListItem.dart';
import '../widgets/ListViewItem.dart';

class MyHomePage1 extends StatelessWidget {

  List<ListItem> listItems = [

    ListItem( title: "Item Group 1", gridItems: [
      GridItem(imageName: "", title: "Grid Item 1-1"),
      GridItem(imageName: "", title: "Grid Item 1-2")
    ]  )

  ];

  MyHomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Nagad"),
      ),
      body: ListView.builder(itemBuilder: (context, index){


        var item = listItems[index];

        return ListViewItem(listItem: item );

      },
        itemCount: listItems.length,),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
