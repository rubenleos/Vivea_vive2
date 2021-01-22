import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

//sacado de la autentificacion
  Future<void> facebook() async {
    //final AccessToken result = await FacebookAuth.instance.login();
    try {
      final AccessToken result = await FacebookAuth.instance.login();
      print(result.toJson());
    } catch (e, s) {
      print(s);
      if (e is FacebookAuthException) {
        //final userData = FacebookAuth.instance.getUserData(); //retorna un
        //print(userData);
        switch (e.errorCode) {
          case (FacebookAuthErrorCode.OPERATION_IN_PROGRESS):
            print('object');
            break;
          case FacebookAuthErrorCode.CANCELLED:
            Get.snackbar('falllo', 'fue cancelado ',
                snackPosition: SnackPosition.BOTTOM);
            break;

          case FacebookAuthErrorCode.FAILED:
            print('cFacebookAuthErrorCode.FAILED');
            break;
        }
      }
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      UserCredential userCredendtial;
      final User user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;
      Get.snackbar('hola', 'su ingreso exitoso');
      print("ingreso bien");

      Future.delayed(Duration(seconds: 2), () {
        Get.toNamed("/foodpage");
      });
    } catch (e) {
      Get.snackbar('fallo', 'no puedo inresar revise ');
    }
  }

  void _signOut() async {
    final User user = await _auth.currentUser;
    await _auth.signOut();
    _signOut();
    final String uid = user.uid;
    Get.snackbar('out', uid + 'has succesfully signesout',
        snackPosition: SnackPosition.BOTTOM);
    Get.toNamed('/home');

    // Scaffold.of(context).showSnackBar(SnackBar(
    // content: Text(uid + ' has successfully signed out.'),
    //));
  }

  void signInWithGoogle() async {
    try {
      UserCredential userCredential;

      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      // userCredential = await _auth.signInWithPopup(googleProvider);

      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn(); //
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication; //
      final GoogleAuthCredential googleAuthCredential =
          GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      userCredential = await _auth.signInWithCredential(googleAuthCredential);
      final user = userCredential.user;

      Get.snackbar('', 'Sign in ${user.uid} with google');
      print('todo bien ');

      Future.delayed(
        Duration(seconds: 2),
        () {
          Get.toNamed('/PrincipalPage');
        },
      );
    } catch (e) {
      print(e);
      Get.snackbar('falllo', '"Failed to sign in with Google: ${e}"',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
