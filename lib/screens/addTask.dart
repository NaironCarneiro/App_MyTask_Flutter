// import 'package:aula_flutter/theme/images.dart';
// import 'dart:html';

import 'dart:ui';

import 'package:mytasks/screens/listTasks.dart';
import 'package:mytasks/themes/colors.dart';
// import 'package:aula_flutter/util/authentication.dart';
// import 'package:aula_flutter/widgets/google_sign_in_button.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text('Nova Tarefa',
        style: TextStyle(color:Colors.black),
        ),
        centerTitle: true,
        
        backgroundColor: AppColors.blue2,
        elevation: 5,
        
        automaticallyImplyLeading: true,
        leading: IconButton(icon:Image.asset('assets/images/Union.png',),
        onPressed: (){},
          ),
       ),
  
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:50),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                    child:  const TextField(
                      decoration: InputDecoration(                  
                        border: OutlineInputBorder(),
                        hintMaxLines: 3,
                        hintText: 'Descrição ',
                        labelText: 'Descrição da tarefa',
                        contentPadding: EdgeInsets.fromLTRB(10, 70, 0, 30),

                      ),
                    ),
                    ),
                   
                    const SizedBox(height: 30),
                    Container(
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Data',
                        labelText: 'Data',
                      ),
                    ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                        hintText: 'Senha'
                      ),
                    ),
                    ),

                    SizedBox(height: 20),
                    Row(   
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,    
                      children:[             
                    SizedBox(
                      width: 150,
                      height: 35,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: AppColors.blue2,
                        ),
                        onPressed: () {
                          // Respond to button press
                        },
                        child: const Text("Adicionar imagem"),
                      ),
                    ),         
                    Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Opacity(opacity: 1.0),                            
                            Icon((Icons.add_alert_rounded)),
                            
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                'Definir lembrete',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                    
                      ],
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
                         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ListTasks()));
                        },
                        child: const Text("ADICIONAR TAREFA"),
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
