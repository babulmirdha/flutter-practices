import 'package:flutter/material.dart';
import 'package:gridviw_master_detail_with_different_page_app/pages/cash_out_page.dart';
import 'package:gridviw_master_detail_with_different_page_app/pages/payment_page.dart';
import 'package:gridviw_master_detail_with_different_page_app/pages/send_money_page.dart';
import 'package:gridviw_master_detail_with_different_page_app/pages/top_up_page.dart';
import 'package:gridviw_master_detail_with_different_page_app/widgets/grid_view_item.dart';

import '../models/grid_item.dart';

class HomeGridViewPage extends StatelessWidget {
   HomeGridViewPage({super.key});


  List<GridItem> gridItems = [
    GridItem(imageName: "name_1.png", text: "TopUP", page: TopUpPage()),
    GridItem(imageName: "name_1.png", text: "Send Money", page: SendMoneyPage()),
    GridItem(imageName: "name_1.png", text: "Cash out", page: CashOutPage()),
    GridItem(imageName: "name_1.png", text: "Payment", page: PaymentPage()),

  ];


  @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar(title: Text("Fagad")),
     body: GridView.builder(
         itemCount: gridItems.length,
         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

       crossAxisCount: 3,

     ), itemBuilder: (context, index){

           var gridItem = gridItems[index];

          return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> gridItem.page));
              },
              child: GridViewItem(gridItem: gridItem));
     }),
   );
  }



}