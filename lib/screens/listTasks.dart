// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytasks/screens/addTask.dart';
import 'package:mytasks/screens/updateTask.dart';
import 'package:mytasks/services/authentication.dart';
import 'package:mytasks/themes/colors.dart';
// import 'package:aula_flutter/util/authentication.dart';
// import 'package:aula_flutter/widgets/google_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTasks extends StatefulWidget {
  const ListTasks({Key? key}) : super(key: key);

  @override
  _ListTasksScreenState createState() => _ListTasksScreenState();
}

class _ListTasksScreenState extends State<ListTasks> {
  var tasks = [];
  final Stream<QuerySnapshot> _tasksStream = FirebaseFirestore.instance.collection('tasks').snapshots();
  final firebase = FirebaseFirestore.instance;

showAlertDialog2(BuildContext context, String cod) {
   Widget cancelaButton = FlatButton(
    child: Text("Cancelar"),
    onPressed:  () {
    
      Navigator.of(context).pop();
          
    },
  );
  Widget continuaButton = FlatButton(
    child: Text("Sim"),
    onPressed:  () {
      deleteTasks(cod);
       Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Tarefa excluída"),
        ));
      Navigator.of(context).pop();
      
    },
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Atenção"),
    content: Text("Deseja mesmo deletar esta tarefa ?"),
    actions: [
      cancelaButton,
      continuaButton,
    ],
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

deleteTasks(id)async{
  try {
    var collection = FirebaseFirestore.instance.collection('tasks');
    await collection.doc(id).delete();

  } catch (e) {
    print(e);
  }
}

Widget loadTasks(){
    return StreamBuilder<QuerySnapshot>(
      stream: _tasksStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return  const Text('Erro na busca');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        return ListView(
         
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              onTap:  () =>  Navigator.push(context, 
              MaterialPageRoute(builder: (_,)=> UpdateTask(docId: snapshot.data!.docs[1]),)),
              leading: Text('foto'),
              title: Text(data['description']),
              subtitle: Text(data['data'] + '  '+'às ' + data['hour']),
              trailing: IconButton(onPressed: () {
                String cod = document.id;
                showAlertDialog2(context, cod);
                  },
                  //  body: ListView.separated(
    // itemBuilder: (BuildContext context, int task){
    //   return ListTile(
    //     onTap: ()=>  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UpdateTask())),
    //     leading: Text(tabletask[task].image),
    //     title: Text(tabletask[task].description),
                  icon: Icon(Icons.delete,color: Colors.black),
      ),
      contentPadding: EdgeInsets.all(8),
      );
      
          }).toList(),
          
        );
        
      },
    );
  }

Widget appBarTitle = Text('Minhas Tarefas',style: TextStyle(color:Colors.black));
Icon iconAction = new Icon(Icons.search,color: Colors.black);


  @override
  Widget build(BuildContext context) { 
        final authService = Provider.of<AuthService>(context);
        final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
       appBar: AppBar(
        toolbarHeight: 70,
        title: appBarTitle,
        centerTitle: true,        
        backgroundColor: AppColors.blue2,
        elevation: 5,
        actions: <Widget>[
         new IconButton(
           
            onPressed: () { 
              setState(() {
                if(this.iconAction.icon == Icons.search){
                this.iconAction = new Icon(Icons.close, color: Colors.black);
                this.appBarTitle = new TextField(
                  style: new TextStyle(
                    color: Colors.white
                  ),
                
                decoration: new InputDecoration(
                  prefixIcon: new Icon(Icons.search, color: Colors.black),
                  hintText: " Pesquisar ...",
                  hintStyle: new TextStyle(color: Colors.white),

                ),
              );
              }else{
                this.iconAction = new Icon(Icons.search, color: Colors.black);
                this.appBarTitle = new Text('Minhas tarefas',style: TextStyle(color:Colors.black));
              }

              });
             },
           icon : iconAction
          
          ),
        ],
        automaticallyImplyLeading: true,
        leading: IconButton(icon: Icon(Icons.exit_to_app,color: Colors.black,),
        onPressed: () async {
          await authService.signOut();
        },
          ),
       ),

       body: Center(child: loadTasks()),
    
       floatingActionButtonLocation:   FloatingActionButtonLocation.endFloat,
            floatingActionButton: SizedBox(
                
                height: 70.0,
                width: 70.0,
                child: FittedBox(                  
                child: FloatingActionButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddTask()));
                  },
                child: Icon(Icons.add),
                backgroundColor: AppColors.yellowButton,
              ),
            ),
          ),
    );
    
  

  }
}

