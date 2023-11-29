import 'package:flutter/material.dart';
import 'package:nayon_test/controller/auth_controller.dart';
import 'package:nayon_test/view/product/product_list.dart';

class Login extends StatefulWidget {
  const Login({super.key}); 

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  //email text editing controller
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  //form globel key
  final _signInKey = GlobalKey<FormState>();

  //bool
  bool isLoading = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailTextEditingController.text = "nayon@gmail.com";
    passwordTextEditingController.text = "12345678";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.only(left: 20, right: 20, top: 100),
            child: Form(
              key: _signInKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Login",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    controller: emailTextEditingController,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),

                    ),
                    validator: (v){
                      if(v!.isEmpty){
                        return "Field must not be empty.";
                      }else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    obscureText: true,
                    controller: passwordTextEditingController,
                    decoration: InputDecoration(
                      hintText: "password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),

                    ),
                    validator: (v){
                      if(v!.isEmpty){
                        return "Field must not be empty.";
                      }else{
                        return null;
                      }
                    },
                  ),

                  const SizedBox(height: 30,),
                  InkWell(
                    onTap: ()async{
                      setState(() =>isLoading = true);
                      if(_signInKey.currentState!.validate()){
                        await AuthController.login(email: emailTextEditingController.text, pass: passwordTextEditingController.text, context: context);
                      }
                      setState(() =>isLoading = false);
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child:  Center(
                        child: isLoading ? CircularProgressIndicator() : Text("Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17
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
      ),
    );
  }
}