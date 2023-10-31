import 'package:flutter/material.dart';

class ListViewWithBuilder extends StatelessWidget {
  const ListViewWithBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      ListView.builder(itemBuilder: ( context, index){
        return Text("Item # ${index+1}");
      }, itemCount: 15,),
    );
  }
}
