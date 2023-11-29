import 'package:flutter/material.dart';
import 'package:nayon_test/controller/product_controller.dart';
import 'package:nayon_test/model/product_model.dart';
import 'package:nayon_test/view/product/add_product.dart';
import 'package:nayon_test/view_controller/app_network_image.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {


  //create a null future for product model
  Future<ProductModel>? getProductFuture ()async{
    return await ProductController.getAllProduct();  //assign the get all product method int get product future
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductFuture();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Product List",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: FutureBuilder<ProductModel>(
                    future: getProductFuture(),
                    builder: (context, snapshot) {
                      print("dat === ${snapshot.data}");
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Center(child: CircularProgressIndicator(),);
                      }else if(snapshot.hasData){
                        return Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height-210,
                              child: ListView.builder(
                                itemCount: snapshot.data!.data!.length,
                                itemBuilder: (_,index){
                                  return Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: ListTile(
                                      leading: AppNetworkImage(src: snapshot.data!.data![index]!.url,),
                                      title: Text("${snapshot.data!.data![index]!.name}"),
                                      subtitle: Text("Price: ${snapshot.data!.data![index]!.price}"),
                                      trailing: SizedBox(
                                        width: 100,
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewProduct(productInfo: snapshot.data!.data![index],))),
                                              icon: Icon(Icons.edit),
                                            ),
                                            IconButton(
                                              onPressed: ()async{
                                                await ProductController.deleteProduct(product_id: snapshot.data!.data[index]!.id.toString(), context: context);
                                                getProductFuture();
                                                setState(() {

                                                });
                                              },
                                              icon: Icon(Icons.delete),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              margin: EdgeInsets.all(20),
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  TextButton(onPressed: (){}, child: Text("1")),
                                  TextButton(onPressed: (){}, child: Text("1")),
                                  TextButton(onPressed: (){}, child: Text("1")),
                                ],
                              ),
                            ),
                          ],
                        );
                      }else {
                        return const Center(child: Text("Something went wrong"),);
                      }
                    }
                ),
              )
            ],
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewProduct())),
            backgroundColor: Colors.amber,
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

