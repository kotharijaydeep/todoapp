import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/core/colorconstant.dart';
import 'package:todoapp/views/signuppage/signup.dart';

import '../../core/stringconstant.dart';
import 'auth/authentication.dart';
import 'bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 90),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/loginpage/Logo.png",
                          width: 120,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey.shade300)),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                textInputAction: TextInputAction.next,
                                validator: (val) {
                                  if (val!.isEmpty) return "Enter Email";
                                  String pattern =
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

                                  RegExp regExp = RegExp(pattern);
                                  if (!regExp.hasMatch(val)) {
                                    return "Enter Valid Email!";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontFamily: "Roboto"),
                                  prefixIcon: const Icon(
                                    Icons.email_outlined,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Divider(),
                              ),
                              TextFormField(
                                obscureText: true,
                                textInputAction: TextInputAction.done,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Please enter your Password';
                                  } else if (val.length < 6) {
                                    return 'Please enter password with atleast 6 chars';
                                  }
                                  return null;
                                },
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontFamily: "Roboto"),
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: InputBorder.none,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(320, 50),
                        maximumSize: const Size(320, 50),
                      ),
                      onPressed: ()async{
                        if (_formkey.currentState!.validate()) {


                          context.read<AuthBloc>().add(SigningEvent(email: _emailController.text,password: _passwordController.text, context: context));
                          print("Validated");

                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Text(StringConstant.dontHaveAccount,style: TextStyle(fontSize: 16,fontFamily: "Roboto"),),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SignUp()));
                          },
                            child:
                            const Text(StringConstant.signUp,style: TextStyle(fontSize: 16,color:  ColorConstant.mainColor,fontFamily: "Roboto"),),
                        ),
                      ],
                    ),
                    Text(
                        StringConstant.oR,
                      style: TextStyle(
                          fontSize: 20, color: Colors.grey.shade300),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        StringConstant.loginUsingSocialMedia,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontFamily: "Roboto"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon:
                                Image.asset("assets/loginpage/facebook.png"),
                            iconSize: 55,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset("assets/loginpage/twitter.png"),
                            iconSize: 55,
                            onPressed: () {
                              Auth().signInWithTwitter();
                            },
                          ),
                          IconButton(
                              icon:
                                  Image.asset("assets/loginpage/google.png"),
                              iconSize: 55,
                              onPressed: () {
                                Auth().signInWithGoogle();
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
