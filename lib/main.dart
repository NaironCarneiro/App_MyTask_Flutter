import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' ; 
// import 'package:mytasks/screens/listTasks.dart';
import 'package:mytasks/screens/login.dart';
import 'package:mytasks/screens/register.dart';
import 'package:mytasks/services/authentication.dart';
import 'package:mytasks/wrapper.dart';
import 'package:provider/provider.dart';
// import 'package:mytasks/screens/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        Provider<AuthService>(create: (_) => AuthService(),),
      ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Wrapper(),
        '/login':(context) => Login(),
        '/register':(context) => Register(),
      },
      // home: const Login(),
    ),
    );
  }
}