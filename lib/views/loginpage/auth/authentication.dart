import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/views/homepage/landing_screen.dart';
import 'package:todoapp/views/loginpage/login.dart';
import 'package:twitter_login/twitter_login.dart';

class Auth {
  //googlesign auth********************************************************************

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> logout() async {
    await _googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

  //twitterlogin auth****************************************************************

  Future<UserCredential> signInWithTwitter() async {
    // Create a TwitterLogin instance
    final twitterLogin = TwitterLogin(
        apiKey: 'B8ps5v6sczSKzlGMqsf68bF0x',
        apiSecretKey: ' 9mjNJH2Aj0ORiqES0wv3EasWAMIbrjTFqpwI5CdKFQRuEosL9N',
        redirectURI: 'flutter-twitter-login://');

    // Trigger the sign-in flow
    final authResult = await twitterLogin.login();

    // Create a credential from the access token
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(twitterAuthCredential);
  }

  //email-password************************************************************************

  final FirebaseAuth auth = FirebaseAuth.instance;

//SIGN UP METHOD

  Future<String?> signUp(
      {required String email,
      required String password,
      required name,
      required BuildContext context}) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      var result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final snackBar = SnackBar(
        content: const Text('SignUp Successful'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pushNamed("/loginpage");
      await prefs.setString('uid', result.user!.uid);

      await FirebaseFirestore.instance
          .collection('user')
          .doc(result.user!.uid.toString())
          .set({'name': name, 'email': email});
    } catch (e) {
      print(e.toString());
    }
  }

  //SIGN IN METHOD

  Future<String?> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      var result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      final snackBar = SnackBar(
        content: const Text('Login Successful'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      );
      await prefs.setString('uid', result.user!.uid);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pushNamed("/landingScreen");
    } catch (e) {
      final snackBar = SnackBar(
        content: Text(
          'Please Do First Of Signup $e',
        ),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  // signIn({required String email, required String password, required BuildContext context}) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   UserCredential userCredential = await auth.createUserWithEmailAndPassword(
  //       email: email, password: password);
  //   await prefs.setString('uid', userCredential.user!.uid);
  //   print("login successfully");
  //   print("Email: ${userCredential.user!.email}");
  //   print("UID: ${userCredential.user!.uid}");
  //   final snackBar = SnackBar(
  //     content: const Text('Login Successful'),
  //     action: SnackBarAction(
  //       label: 'Undo',
  //       onPressed: () {
  //       },
  //     ),
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  //SIGN OUT METHOD
  signOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('uid');
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
