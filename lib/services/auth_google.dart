
// import 'package:mytasks//messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
   
   GoogleSignInAccount? _user;

   GoogleSignInAccount get user => _user!;

   Future googleLogin() async {
     final googleUser = await googleSignIn.signIn();
     if(googleUser == null) return;
     _user = googleUser;
     final googleAuth = await googleUser.authentication;
     print("33333333333");
     final credential = GoogleAuthProvider.credential(
       
       accessToken: googleAuth.accessToken,
       
       idToken: googleAuth.accessToken,
       
     );
     print("111111111111111222222222233333333333");
  try {
    
     await FirebaseAuth.instance.signInWithCredential(credential);
     
    

  } on FirebaseAuthException catch (e) {
    String message = 'Falha de autenticação';
    if (e.code == 'account-exists-with-different-credential') {
      message = 'Conta cadastrada';
    }else if(e.code == 'invalid-credential'){
      message ='Conta inválida';
    }
    message = 'Falha de autentication';
  }catch(e){
    //  Messag = 'Falha de autentication';
    print('erro da aplicação');
  }
    

     notifyListeners();
   }
  
}