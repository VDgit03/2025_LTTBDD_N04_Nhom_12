import 'package:flutter/material.dart';
import 'package:mobile_ck/dashboard.dart';
import 'package:mobile_ck/homepage.dart';

import 'auth/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To do list',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Homepage(),
    );
  }
}
