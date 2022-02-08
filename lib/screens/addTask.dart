// import 'package:aula_flutter/theme/images.dart';
// import 'dart:html';

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mytasks/screens/finishTask.dart';
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
   final data = TextEditingController();
   final description = TextEditingController();
   final hour = TextEditingController();
   final firebase = FirebaseFirestore.instance;


showAlertDialog1(BuildContext context) 
{ 
    // configura o button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { 
      Navigator.of(context).pop();
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Por favor"),
    content: Text("Preencha todos os campos para salvar a terefa"),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}


   addTasks() async{
     try{
    await firebase.collection('tasks').doc().set(
      {
        "description": description.text,
        "data": data.text,
        "hour": hour.text
      }
    );

   }catch (e){
     print(e);
   }
}

   @override
  void dispose() {
    description.dispose();
    data.dispose();
    hour.dispose();
    super.dispose();
  }

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
        onPressed: (){
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ListTasks()));
          
        },
          ),
       ),
  
      body: SafeArea(
        child: Column(
  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:40),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                    child:  TextFormField(
                      controller: description, 
                      maxLines: null,                    
                      decoration: InputDecoration(                  
                        border: OutlineInputBorder(),
                        hintText: 'Descrição ',
                        labelText: 'Descrição da tarefa',
                        // contentPadding: EdgeInsets.fromLTRB(10, 50, 20, 20),

                      ),
                    ),
                    ),
                   
                    const SizedBox(height: 30),
                    Container(
                    child:  TextFormField(
                      controller: data,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        
                        hintText: 'Data',
                        labelText: 'Data',
                      ),
                    ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                    child:  TextFormField(
                      controller: hour,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Hora',
                        hintText: 'Hora'
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
                          if(description.text.isEmpty || data.text.isEmpty|| hour.text.isEmpty){
                            showAlertDialog1(context);
 
                          }else{

                            addTasks();
                          description.clear();
                          data.clear();
                          hour.clear();
                         Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FinishTask()));



                          }

                          
                         
                        
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
