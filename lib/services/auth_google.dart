import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
      
    );

    try {
      
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      String message = 'Falha de autenticação';
      if (e.code == 'account-exists-with-different-credential') {
        message = 'Conta cadastrada';
      } else if (e.code == 'invalid-credential') {
        message = 'Conta inválida';
      }
      message = 'Falha de autentication';
    } catch (e) {
      //  Messag = 'Falha de autentication';
      print('erro da aplicação');
    }

    notifyListeners();
  }
}
