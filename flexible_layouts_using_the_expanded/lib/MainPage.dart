import 'package:flexible_layouts_using_the_expanded/ColumnPage.dart';
import 'package:flexible_layouts_using_the_expanded/RowPage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main"),),
      body: Center(
        child: Column(children: [
          TextButton(onPressed: (){

            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ColumnPage()));

          }, child: Text("Column Example")),
          TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => RowPage()));
          }, child: Text("Row Example"))
        ],),
      ),
    );
  }
}
