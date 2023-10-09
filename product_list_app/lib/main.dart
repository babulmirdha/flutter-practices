import 'package:flutter/material.dart';
import 'package:product_layout_app/product_view_item.dart';
import 'package:product_layout_app/ProductItem.dart';
import 'ProductDetailWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Product layout demo home page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  void _onItemSelected(ProductItem item, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailWidget(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Product Listing")),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children:  <Widget>[
            ProductViewItem(
                item: const ProductItem(
                    name: "iPhone",
                    description: "iPhone is the stylist phone ever",
                    price: 1000,
                    image: "iphone.png"),
                onItemSelected: _onItemSelected
            ),
            ProductViewItem(
                item: const ProductItem(
                    name: "Pixel",
                    description: "Pixel is the most featureful phone ever",
                    price: 800,
                    image: "pixel.png"),
                onItemSelected: _onItemSelected
            ),
            ProductViewItem(
                item: const ProductItem(
                    name: "Laptop",
                    description: "Laptop is most productive development tool",
                    price: 2000,
                    image: "laptop.png"),
                onItemSelected: _onItemSelected
            ),
            ProductViewItem(
                item: const ProductItem(
                    name: "Tablet",
                    description:
                        "Tablet is the most useful device ever for meeting",
                    price: 1500,
                    image: "tablet.png"),
                onItemSelected: _onItemSelected
            ),
            ProductViewItem(
                item: const ProductItem(
                    name: "Pendrive",
                    description: "Pendrive is useful storage medium",
                    price: 100,
                    image: "pendrive.png"),
                onItemSelected: _onItemSelected
            ),
            ProductViewItem(
                item: const ProductItem(
                    name: "Floppy Drive",
                    description: "Floppy drive is useful rescue storage medium",
                    price: 20,
                    image: "floppy.png"),
                onItemSelected: _onItemSelected
            ),
          ],
        ));
  }
}
