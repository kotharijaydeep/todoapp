import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/views/loginpage/bloc/auth_bloc.dart';

import '../../core/colorconstant.dart';
import '../../core/stringconstant.dart';
import '../loginpage/auth/authentication.dart';
import '../loginpage/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmpassController = TextEditingController();

  //Adduser firestore

  final String name = " ";
  final String email = " ";

  void addUser(String uid) async {
    var user = FirebaseFirestore.instance.collection('user').doc(uid).set({
      'name': name,
      'email': email,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 100),
        child: Column(
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
              height: 80,
            ),
            Column(
              children: [
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
                            controller: _nameController,
                            textInputAction: TextInputAction.next,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter Name";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontFamily: "Roboto"),
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                size: 30,
                                color: Colors.black,
                              ),
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(),
                          ),
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
                            textInputAction: TextInputAction.next,
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
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(),
                          ),
                          TextFormField(
                            obscureText: true,
                            controller: _confirmpassController,
                            textInputAction: TextInputAction.done,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Re-Enter Password";
                              } else if (val != _confirmpassController.text) {
                                return "Password Not Match";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "ConfirmPassword",
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
                          ),
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
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      context.read<AuthBloc>().add(SignUpEvent(
                          confirmpassword: _confirmpassController.text,
                          password: _passwordController.text,
                          email: _emailController.text,
                          name: _nameController.text, context: context));
                      print("Validated");
                    }
                    _formkey.currentState!.save();
                  },
                  child: const Text(
                    StringConstant.sSignUp,
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
                  children: [
                    const Text(
                      StringConstant.sYouHaveAccount,
                      style: TextStyle(fontSize: 16, fontFamily: "Roboto"),
                    ),
                    const SizedBox(width: 3),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                        },
                        child: const Text(
                          StringConstant.sLogin,
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorConstant.mainColor,
                              fontFamily: "Roboto"),
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
