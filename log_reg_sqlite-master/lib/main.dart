import 'package:flutter/material.dart';
import 'package:log_reg_sqlite/listar.dart';
import 'package:sqflite/sqflite.dart';
import 'package:log_reg_sqlite/registrar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Topicos sqlite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MiApp(),
    );
  }
}

class MiApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/",
        routes: {
          "/" : (context) => Listar(),
          "/registrar": (context) => Registrar()
        }
    );
  }
}