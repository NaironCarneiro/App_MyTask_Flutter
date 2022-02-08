import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mytasks/services/authentication.dart';
import 'package:mytasks/services/db_firestore.dart';

class DatabaseTask extends ChangeNotifier{
  late FirebaseFirestore db;
  late AuthService auth;


  DatabaseTask({required this.auth}){
    _starTask();
  }

  _starTask() async{
    await _startFirestore();
    // await _readTasks();
  }

  _startFirestore(){
    db = DBFirestore.get();
  }

  // addtask()async{
  //    await db.collection('user/${auth.user!.uid}/tasks').doc().set(
  //      'description': des
  //    );
  // }

}