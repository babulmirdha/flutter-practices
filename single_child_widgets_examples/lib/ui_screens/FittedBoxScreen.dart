import 'package:flutter/material.dart';

class FittedBoxScreen extends StatelessWidget  {



  const FittedBoxScreen( {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(runtimeType.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300, width: 400,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Image.asset('assets/bm.png',width: MediaQuery.of(context).size.width),
              ),
            ),
            const Text("A widget that scales and positions its child within itself. It will try to make the child fit within its bounds while maintaining its aspect ratio."),
          const Divider(color: Colors.red,),
            const FittedBox(
              //fit: BoxFit.fill,
              child: Text("A widget that scales and positions its child within itself. It will try to make the child fit within its bounds while maintaining its aspect ratio."),
            ),
            Container(
              height: 300, width: 400,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/bm.png',), fit: BoxFit.scaleDown), color: Colors.blueAccent)
            ),
          ],
        ),
      ),
    );
  }



}