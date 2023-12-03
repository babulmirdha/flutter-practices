import 'package:flutter/material.dart';
import 'package:my_location_demo/last_known_location_page.dart';

import 'location_update_page.dart';
import 'my_positionIncluding_location_service_check_page.dart';
import 'my_current_position_page.dart';

class MasterPage extends StatelessWidget {
   MasterPage({super.key});
  
  
 final _widgetList = <Widget>[
   const MyCurrentPositionPage(),
   const MyPositionIncludingLocationSerciceCheckPage(),
   const LastKnownLocationPage(),
   const LocationUpdatePage(),
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
