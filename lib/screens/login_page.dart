import 'package:flutter/material.dart';
import 'package:internshala_assignment/screens/register_page.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if(_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
          color: context.canvasColor ,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset("assets/images/hey.png",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                      height: 20.0
                  ),
                  Text(
                    "WELCOME $name",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                      height: 20.0
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Enter user name",
                            labelText: "User Name",
                          ),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "User Name cannot be empty.";
                            }
                            return null;
                          },
                          onChanged: (value){
                            name = value;
                            setState(() {});
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: "Enter password",
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Password cannot be empty.";
                            }
                            else if(value.length<6){
                              return "Password length should be at least 6.";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                            height: 40.0
                        ),
                        Material(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(changeButton ? 50: 8),
                          child: InkWell(
                            splashColor: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                            onTap: () => moveToHome(context),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 75),
                              height: 50,
                              width: changeButton ? 50:150,
                              alignment: Alignment.center,
                              child: changeButton ?
                              const Icon(Icons.done,
                                color: Colors.white,)
                                  : const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("New User?",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            SizedBox(width: 2,),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterPage()));
                              },
                                child: Text("Register",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.bold),)
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}