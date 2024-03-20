import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
        title: Text('Payment Method'),
        backgroundColor: Colors.teal,
        ),
      ),
    );
  }
}