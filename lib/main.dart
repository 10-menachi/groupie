import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groupie/helper/helper.dart';
import 'package:groupie/pages/home_page.dart';
import 'package:groupie/shared/constants.dart';
import 'firebase_options.dart';
import 'pages/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _signedIn = false;
  @override
  void initState() {
    getUserLoggedInStatus();
    super.initState();
  }

  getUserLoggedInStatus() async {
    await Helper.getLoginStatus().then((value) => {
          if (value != null) {_signedIn = value}
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Constants.primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: _signedIn ? const Home() : const SignIn(),
    );
  }
}
