import 'dart:ui';

import 'package:mytasks/screens/addTask.dart';
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
        leading: IconButton(icon: Icon(Icons.exit_to_app,color: Colors.black,),
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
    body: SafeArea(
      child: Container(
        height: 100,
     child : Card(
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
        color: AppColors.blue1,
        shadowColor: Colors.black,
        elevation: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              // borderRadius: BorderRadius.circular(10),
              // child: SizedBox(
                // height: 170,
                // child: CachedNetworkImage(
                //   fit: BoxFit.cover,
                //   imageUrl: product.img,
                //   placeholder: (context, url) => const Center(
                //       child:
                //           CircularProgressIndicator(color: AppColors.primary)),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
              // ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(
                'descriptions',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                      'task 01',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.green,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // context.read<AppState>().addProduct(product);
                    // Message.showMessage(
                    //     context, 'Produto adicionado na cesta.');
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
      ),
    ),
              floatingActionButton: Container(
                height: 80.0,
                width: 80.0,
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