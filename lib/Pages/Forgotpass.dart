import 'package:flutter/material.dart';

class Forgotpass extends StatefulWidget {
  const Forgotpass({super.key});

  @override
  State<Forgotpass> createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {
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
        title: Text('Forgot Password?'),
        backgroundColor: Colors.teal,
        ),
      ),
    );
  }
}