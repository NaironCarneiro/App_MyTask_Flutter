// import 'package:aula_flutter/theme/images.dart';
// import 'dart:html';

import 'dart:ui';

import 'package:mytasks/themes/colors.dart';
// import 'package:aula_flutter/util/authentication.dart';
// import 'package:aula_flutter/widgets/google_sign_in_button.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding( 
              padding: EdgeInsets.only(left: 20),
               child:Text(
                'Cadastro',
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
                    
                    const TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome completo',
                      ),
                    ),
                    const SizedBox(height: 30),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 30),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                    ),
                    const SizedBox(height: 45),
                    SizedBox(
                      width: 400,
                      height: 55,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: AppColors.green,
                        ),
                        onPressed: () {
                          // Respond to button press
                        },
                        child: const Text("ACESSAR"),
                      ),
                    ),
                    
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
