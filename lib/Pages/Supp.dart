import 'package:flutter/material.dart';

class Supp extends StatefulWidget {
  const Supp({super.key});

  @override
  State<Supp> createState() => _SuppState();
}

class _SuppState extends State<Supp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
         appBar: AppBar(
           leading: BackButton(
            color: Colors.black,
            onPressed: ()=>
            Navigator.of(context).pop(),
          ),
           toolbarHeight: 100,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Support'),
        backgroundColor: Colors.teal,
        ),
      ),
    );
  }
}