import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';

import 'home_page.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name="";
  String email="";
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
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Enter E-Mail",
                            labelText: "E-Mail",
                          ),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "E-Mail cannot be empty.";
                            }
                            return null;
                          },
                          onChanged: (value){
                            email = value;
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
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
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