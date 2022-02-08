// import 'package:aula_flutter/theme/images.dart';
// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:mytasks/screens/listTasks.dart';
import 'package:mytasks/screens/register.dart';
import 'package:mytasks/services/auth_google.dart';
import 'package:mytasks/services/authentication.dart';
import 'package:mytasks/services/authentication.dart';
import 'package:mytasks/themes/colors.dart';
// import 'package:aula_flutter/util/authentication.dart';
// import 'package:aula_flutter/widgets/google_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/authentication.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<Login> {

  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }


  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  return await FirebaseAuth.instance.signInWithCredential(credential);
}


    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding( 
              padding: EdgeInsets.only(left: 20),
               child:Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 36,
                ),
              ),
            ),
            SizedBox(height:50),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Padding(padding: padding)
                    // padding: EdgeInsets.only(left: 20),
                    
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: 400,
                      height: 55,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: AppColors.green,
                        ),
                        onPressed: () {
                          authService.signInWithEmailAndPassword(emailController.text, passwordController.text);
                          
                        },
                        child: const Text("ACESSAR"),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 400,
                      height: 55,
                      child: OutlinedButton(
                        onPressed: () {
                           
                        //   final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                        //  print("????????????????????????passou daqui de nvovo");
                        //   provider.googleLogin();
                        signInWithGoogle();
                          
                        },
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Image.asset('assets/images/goog.png'),
                            Image.asset(
                              'assets/images/goog.png',
                              height: 30,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'GOOGLE',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                    TextButton(
                        onPressed: () {}, child: Text('Esqueci minha senha')),
                    SizedBox(height: 10),
                    Text('Ainda não possui cadastro ?'),
                    TextButton(onPressed: () {
                     
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Register()));
                    }, child: Text('Cadastre-se')),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
