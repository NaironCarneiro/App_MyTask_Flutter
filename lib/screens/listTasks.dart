import 'dart:ui';

import 'package:mytasks/themes/colors.dart';
// import 'package:aula_flutter/util/authentication.dart';
// import 'package:aula_flutter/widgets/google_sign_in_button.dart';
import 'package:flutter/material.dart';

class ListTasks extends StatefulWidget {
  const ListTasks({Key? key}) : super(key: key);

  @override
  _ListTasksScreenState createState() => _ListTasksScreenState();
}

class _ListTasksScreenState extends State<ListTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        toolbarHeight: 70,
        title: const Text('Minhas Tarefas',
        style: TextStyle(color:Colors.black),
        ),
        centerTitle: true,
        
        backgroundColor: AppColors.blue2,
        elevation: 5,
        actions: [
          IconButton(
            onPressed: () {  },
           icon :             
             Image.asset('assets/images/lupa.png'),
          
          ),
        ],
        automaticallyImplyLeading: true,
        leading: IconButton(icon: Image.asset('assets/images/Union.png'),
        onPressed: (){},
          ),
       ),

      //  floatingActionButton:FloatingActionButton(
      //     backgroundColor: AppColors.yellowButton,
      //     foregroundColor: Colors.white,
      //     onPressed: () {
      //       // Respond to button press
      //     },
          
      //     child: const Icon(Icons.add),
      //  ),
              floatingActionButton: Container(
                height: 80.0,
                width: 80.0,
                child: FittedBox(                  
                child: FloatingActionButton(
                onPressed: (){},
                child: Icon(Icons.add),
                backgroundColor: AppColors.yellowButton,
              ),
            ),
          ),
         
    );
  }
}