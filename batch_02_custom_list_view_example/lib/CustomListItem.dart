import 'package:flutter/cupertino.dart';

class CustomListItem extends StatelessWidget {
  final String imageName;
  final String name;
  final String desc;
  final double price;

  const CustomListItem(
      {super.key,
      required this.imageName,
      required this.name,
      required this.desc,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 64,
          height: 64,
          child: Image.asset(imageName),
        ),
        Expanded(
          child: Column(
            children: [Align(
          alignment : Alignment.topLeft,
                child: Text(name )),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(desc)),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(price.toString()))
            ],
          ),
        )
      ],
    );
  }
}
