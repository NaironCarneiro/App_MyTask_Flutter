// import 'package:aula_flutter/theme/images.dart';
// import 'dart:html';

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mytasks/screens/addTask.dart';
import 'package:mytasks/screens/listTasks.dart';
import 'package:mytasks/themes/colors.dart';
// import 'package:aula_flutter/util/authentication.dart';
// import 'package:aula_flutter/widgets/google_sign_in_button.dart';
import 'package:flutter/material.dart';

class UpdateTask extends StatefulWidget {
  // const UpdateTask({Key? key}) : super(key: key);
  DocumentSnapshot docId;
  UpdateTask({required this.docId});

  @override
  _UpdateTaskScreenState createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTask> {
   TextEditingController dataEdit = TextEditingController();
   TextEditingController descriptionEdit = TextEditingController();
   TextEditingController hourEdit = TextEditingController();

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

  @override
  void initState(){
    descriptionEdit = TextEditingController(text: widget.docId.get('description'));
    dataEdit = TextEditingController(text: widget.docId.get('data'));
    hourEdit = TextEditingController(text: widget.docId.get('hour'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text('Atualizar Tarefa',
        style: TextStyle(color:Colors.black),
        ),
        centerTitle: true,
        
        backgroundColor: AppColors.blue2,
        elevation: 5,
        automaticallyImplyLeading: true,
        leading: IconButton(icon:Image.asset('assets/images/Union.png',),
        onPressed: (){
          Navigator.pop(context);
        },
          ),
       ),
  
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:40),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                    child: TextFormField(
                      controller: descriptionEdit,
                      maxLines: null,
                      decoration: InputDecoration(                  
                        border: OutlineInputBorder(),
                        hintText: 'Descrição ',
                        labelText: 'Descrição da tarefa',
                        // contentPadding: EdgeInsets.fromLTRB(10, 70, 0, 30),

                      ),
                    ),
                    ),
                   
                    const SizedBox(height: 30),
                    Container(
                    child: TextFormField(
                      controller: dataEdit,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Data',
                        labelText: 'Data',
                      ),
                    ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                    child: TextFormField(
                      controller: hourEdit,
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
                           if(descriptionEdit.text.isEmpty || dataEdit.text.isEmpty|| hourEdit.text.isEmpty){
                            
                            showAlertDialog1(context);
 
                          }else{
                          widget.docId.reference.update({
                            'description':descriptionEdit.text,
                            'data': dataEdit.text,
                            'hour': hourEdit.text,
                          }).whenComplete((){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ListTasks()));
                          });
                          Navigator.pop(context);
                          }
                        },
                        child: const Text("ATUALIZAR TAREFA"),
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
