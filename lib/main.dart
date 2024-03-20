// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/HomeScreen.dart';
// import 'package:flutter_application_1/Pages/ListPage.dart';
import 'package:flutter_application_1/Pages/Login.dart';
import 'package:flutter_application_1/Pages/Supp.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
  ? await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDXwUQDkuvf8EAs4xACf7P6jIFFselPXNI",
      appId: "1:168844035351:android:9901d72cfc6a6d49386352",
      messagingSenderId: "168844035351",
      projectId: "elixer-auth",
    ),
  )
  : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // User? user;
  // @override
  // void initState() {
  //   super.initState();
  //   user= FirebaseAuth.instance.currentUser;
  // }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
       );

  }
}