import 'dart:ffi';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytasks/entity/task.dart';
import 'package:mytasks/screens/addTask.dart';
import 'package:mytasks/screens/updateTask.dart';
import 'package:mytasks/services/authentication.dart';
import 'package:mytasks/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTasks extends StatefulWidget {
  const ListTasks({Key? key}) : super(key: key);

  @override
  _ListTasksScreenState createState() => _ListTasksScreenState();
}

class _ListTasksScreenState extends State<ListTasks> {
  final firebase = FirebaseFirestore.instance;
  var tasks = [];
  var codigo = [];
  final Stream<QuerySnapshot> _tasksStream =
      FirebaseFirestore.instance.collection('tasks').snapshots();

  final CollectionReference _productss =
      FirebaseFirestore.instance.collection('tasks');

  showAlertDialog2(BuildContext context, String cod) {
    Widget cancelaButton = FlatButton(
      child: const Text("Cancelar"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continuaButton = FlatButton(
      child: const Text("Sim"),
      onPressed: () {
        deleteTasks(cod);
        Scaffold.of(context).showSnackBar(const SnackBar(
          content: const Text("Tarefa excluída"),
        ));
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Atenção"),
      content: const Text("Deseja mesmo deletar esta tarefa ?"),
      actions: [
        cancelaButton,
        continuaButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  deleteTasks(id) async {
    try {
      var collection = FirebaseFirestore.instance.collection('tasks');
      await collection.doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Widget appBarTitle =
      const Text('Minhas Tarefas', style: const TextStyle(color: Colors.black));
  Icon iconAction = new Icon(Icons.search, color: Colors.black);

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
                  if (this.iconAction.icon == Icons.search) {
                    this.iconAction =
                        new Icon(Icons.close, color: Colors.black);
                    this.appBarTitle = new TextField(
                      style: new TextStyle(color: Colors.white),
                      decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.black),
                        hintText: " Pesquisar ...",
                        hintStyle: new TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    this.iconAction =
                        new Icon(Icons.search, color: Colors.black);
                    this.appBarTitle = new Text('Minhas tarefas',
                        style: const TextStyle(color: Colors.black));
                  }
                });
              },
              icon: iconAction),
        ],
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.black,
          ),
          onPressed: () async {
            await authService.signOut();
          },
        ),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _productss.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (
                              _,
                            ) =>
                                UpdateTask(docId: documentSnapshot),
                          )),
                      leading: const Text('foto'),
                      title: Text(documentSnapshot['description'], maxLines: 1),
                      subtitle: Text(documentSnapshot['data'].toString() +
                          ' às ' +
                          documentSnapshot['hour']),
                      trailing: IconButton(
                        onPressed: () {
                          showAlertDialog2(context, documentSnapshot.id);
                        },
                        icon: const Icon(Icons.delete, color: Colors.black),
                      ),
                      contentPadding: const EdgeInsets.all(8),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const AddTask()));
            },
            child: const Icon(Icons.add),
            backgroundColor: AppColors.yellowButton,
          ),
        ),
      ),
    );
  }
}
