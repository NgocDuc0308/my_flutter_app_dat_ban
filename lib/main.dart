import 'package:flutter/material.dart';
// import 'package:app_dat_ban/lib/intro.dart';
// import 'package:app_dat_ban/lib/login.dart';
import 'package:app_dat_ban/lib/home.dart';
// import 'package:app_dat_ban/lib/intro.dart';
// import 'package:app_dat_ban/lib/account.dart';
// import 'package:app_dat_ban/lib/nearyou.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP Dat Ban',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
