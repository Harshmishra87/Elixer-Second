import 'package:flutter/material.dart';

class Models extends StatefulWidget {
  const Models({super.key});

  @override
  State<Models> createState() => _ModelsState();
}

class _ModelsState extends State<Models> {
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
        title: const Text('EV Models'),
        backgroundColor: Colors.teal,
        ),
      ),
    );
  }
}