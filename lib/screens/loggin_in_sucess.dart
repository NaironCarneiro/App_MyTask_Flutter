import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytasks/screens/addTask.dart';
import 'package:mytasks/services/authentication.dart';
import 'package:mytasks/themes/colors.dart';
// import 'package:aula_flutter/util/authentication.dart';
// import 'package:aula_flutter/widgets/google_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'listTasks.dart';
import 'login.dart';

class Loggin_sucess extends StatefulWidget {
  const Loggin_sucess({Key? key}) : super(key: key);

  @override
  _Loggin_sucessScreenState createState() => _Loggin_sucessScreenState();
}

class _Loggin_sucessScreenState extends State<Loggin_sucess> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
          }else if(snapshot.hasData) {
            return ListTasks();
          }else if(snapshot.hasError){
            return Center(child: Text("algo deu errado"));
          }else{
            return Login();
          }
      }
      ),

   ); 


}