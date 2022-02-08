import 'dart:ui';

import 'package:mytasks/screens/listTasks.dart';
import 'package:mytasks/themes/colors.dart';
// import 'package:aula_flutter/util/authentication.dart';
// import 'package:aula_flutter/widgets/google_sign_in_button.dart';
import 'package:flutter/material.dart';

class FinishTask extends StatefulWidget {
  const FinishTask({Key? key}) : super(key: key);

  @override
  _FinishTaskScreenState createState() => _FinishTaskScreenState();
}

class _FinishTaskScreenState extends State<FinishTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text('Adicionado',
        style: TextStyle(color:Colors.black),
        ),
        centerTitle: true,
        
        backgroundColor: AppColors.blue2,
        elevation: 5,
        
        automaticallyImplyLeading: true,
        leading: IconButton(icon:Image.asset('assets/images/Union.png',),
        onPressed: (){
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ListTasks()));
        },
          ),
       ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [            
             Padding(
              padding: const EdgeInsets.fromLTRB(45, 20, 0, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/Rectangle.png',height: 150,),
                  const SizedBox(height: 15),
                    Text('Tarefa Adicionada !', style: TextStyle(fontSize:25),),
                  const SizedBox(height: 150),
                    SizedBox(
                      width: 300,
                      height: 55,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: AppColors.green,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ListTasks()));
                          
                        },
                        child: const Text("SAIR", style: TextStyle(fontSize:20),),
                      ),
                    ),
                       ],
                  ),
            ),
                      ],
        ),
      ),

       );
  }
}