import 'dart:ui';
import 'package:mytasks/screens/listTasks.dart';
import 'package:mytasks/screens/login.dart';
import 'package:mytasks/services/authentication.dart';
import 'package:mytasks/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}
final _formKey = GlobalKey<FormState>();
class _RegisterScreenState extends State<Register> {
  @override
  Widget build(BuildContext context) {
     key: _formKey;
     final emailControllerCad = TextEditingController();
    final passwordControllerCad = TextEditingController();
    final authService = Provider.of<AuthService>(context);
    bool _validate = false;

    @override
  void dispose() {
    emailControllerCad.dispose();
    passwordControllerCad.dispose();
    super.dispose();
  }

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
                    TextFormField(

                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome completo',
                      ),
                    ),
                    const SizedBox(height: 30),
                     TextFormField(
   
                      controller: emailControllerCad,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 30),
                     TextFormField(
                   
                      controller: passwordControllerCad,
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
                        onPressed: () async {
                           await authService.createUserWithEmailAndPassword(emailControllerCad.text, 
                           passwordControllerCad.text);
                           Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ListTasks()));
                           
                        },
                        child: const Text("FINALIZAR CADASTRO"),
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
