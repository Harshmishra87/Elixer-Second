import 'package:flutter/material.dart';

class JoinUs extends StatefulWidget {
  const JoinUs({super.key});

  @override
  State<JoinUs> createState() => _JoinUsState();
}

class _JoinUsState extends State<JoinUs> {
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
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Join Us'),
        backgroundColor: Colors.teal,
        ),
      ),
    );
  }
}