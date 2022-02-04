import 'package:flutter/material.dart';
import 'package:mytasks/screens/listTasks.dart';
import 'package:mytasks/screens/login.dart';
import 'package:mytasks/services/authentication.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';

class Wrapper extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          final User? user = snapshot.data;
          return user == null ? Login() : ListTasks();
        }else{
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      });
  }
}