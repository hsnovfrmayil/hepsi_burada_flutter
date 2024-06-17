import 'package:flutter/material.dart';
import 'package:hepsi_burada/pages/fisrt.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'widgets/tab_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hepsi Burada",
      home: FirstPage(),
    );
  }
}
