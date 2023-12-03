import 'package:flutter/material.dart';

import 'determine_position_page.dart';
import 'my_current_position_page.dart';

class MasterPage extends StatelessWidget {
   MasterPage({super.key});
  
  
 final _widgetList = <Widget>[
   const MyCurrentPositionPage(),
   const DeterminePositionPage(),
 ];
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Main Page"),),
      body: ListView.builder(itemBuilder:(context, index){

       var widget = _widgetList[index];

        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
          },
          child: ListTile(

            title: Text( widget.runtimeType.toString())

             ),
        );
      },
      itemCount: _widgetList.length,
      ),
    );
  }
}
