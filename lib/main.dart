import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mytasks/screens/listTasks.dart';
import 'package:mytasks/screens/login.dart';
import 'package:mytasks/screens/register.dart';
import 'package:mytasks/services/auth_google.dart';
import 'package:mytasks/services/authentication.dart';
import 'package:mytasks/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:mytasks/screens/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: MaterialApp(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/login': (context) => Login(),
          '/register': (context) => Register(),
          '/listTasks': (context) => ListTasks(),
        },
      ),
    );
  }
}
