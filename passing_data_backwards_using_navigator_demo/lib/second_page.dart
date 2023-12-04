import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  final _productNameController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateInput(String? value) {


    if(value==null || value.isEmpty ){
      return 'Product Name field is required';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _productNameController,
                decoration:  const InputDecoration(
                  labelText: 'Product Name',
                ),
                validator: _validateInput,
              ),
              ElevatedButton(
                onPressed: () {


            var  isValidate =    _formKey.currentState?.validate() ?? false;

                  if (isValidate) {
                    // Form is valid, perform your action here
                    // For example, you can print the input value
                    print('Input: ${_productNameController.text}');

                    Navigator.pop(context, _productNameController.text);

                  }

                },
                child: const Text('Pass Data Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
