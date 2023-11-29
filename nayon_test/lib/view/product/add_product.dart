import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nayon_test/controller/product_controller.dart';
import 'package:nayon_test/model/product_model.dart';
import 'package:nayon_test/view/product/product_list.dart';
import 'package:nayon_test/view_controller/app_network_image.dart';


class AddNewProduct extends StatefulWidget {

  final Datum? productInfo;
  const AddNewProduct({super.key, this.productInfo});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {

  //text editing controller
  final productName = TextEditingController();
  final productPrice = TextEditingController();


  //boll
  bool isLoading = false;

  String? exstingImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget!.productInfo != null ){
      productName.text = widget.productInfo!.name;
      productPrice.text = widget.productInfo!.price.toString();
      exstingImage = widget.productInfo!.url;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(" ${widget!.productInfo != null ? "Edit Product" : "Add Product"}",)
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                TextFormField(
                  controller: productName,
                  decoration: InputDecoration(
                    hintText: "Product Name",
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: productPrice,
                  decoration: InputDecoration(
                    hintText: "Product Price",
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: ()=>chosseImage(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:
                         image != null
                        ? Image.file(image!, height: 150, fit: BoxFit.cover,) :
                         exstingImage!=null
                             ? AppNetworkImage(src: exstingImage!)
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text("Upload image")
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: ()async{
                      setState(() =>isLoading = true); //set true loading
                      if(widget!.productInfo != null){
                        await ProductController.updateProduct(context: context, name: productName.text, price: productPrice.text, image: image, id: widget.productInfo!.id.toString()); // call the create method
                      }else{
                        await ProductController.addNewProduct(context: context, name: productName.text, price: productPrice.text, image: image); // call the create method

                      }
                      setState(() =>isLoading = false); // set false loading
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: isLoading ? CircularProgressIndicator() : Text( " ${widget!.productInfo != null ? "Edit Product" : "Add Product"}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 17
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  //chose image method
  void chosseImage() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                child: const Text('Camera'),
                onPressed: () => pickImage(ImageSource.camera)
              ),
              ElevatedButton(
                child: const Text('Gallery'),
                onPressed: () =>pickImage(ImageSource.gallery)
              ),
            ],
          ),
        ),
      );
  }
    );
  }


  //pick image
  File? image;
  Future pickImage(ImageSource source) async { //pick image method
    try {
      final image = await ImagePicker().pickImage(source: source);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
      Navigator.pop(context);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
}
