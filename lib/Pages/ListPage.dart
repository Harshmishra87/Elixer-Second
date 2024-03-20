// ignore_for_file: prefer_const_constructors

import "dart:convert";

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/Pages/HomeScreen.dart";
import "package:flutter_application_1/Pages/Login.dart";
import "package:flutter_application_1/Pages/Reuseable.dart";
import 'package:http/http.dart' as http;
import "package:page_transition/page_transition.dart";
import "package:shared_preferences/shared_preferences.dart";

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(115), // Set the height here
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // Remove shadow
    // title: Text('Your Title'),
          centerTitle: true,
          bottom: PreferredSize(
      preferredSize: Size.fromHeight(0), // Hide the existing bottom
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
             width: 300,
              height: 70,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,                      
              ),
                            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(child: const HomeScreen(), type: PageTransitionType.fade)
                      // MaterialPageRoute(builder: (context) => const HomeScreen()), 
                      );

                  },style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(const Size(130, 60)), 
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder( borderRadius: BorderRadius.circular(20))
                    )
                  ), child:const Text('Maps'),),

                  ElevatedButton(onPressed: () { fetchuser();},style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(const Size(130, 60)),
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 20, 20, 20)), // Set the background color
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder( borderRadius: BorderRadius.circular(20))
                    )
                  ), child:const Text('List'),),

                ],
              ),
// Example color, replace with your desired color
          ),
        ],
      ),
    ),
  ),
),

        
      body: ListView(
        
        children: [
                  
          Center(
            
            child: firebaseUIButton(context, 'Logout', () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove('userId');

                // Sign out from Firebase Authentication
                await FirebaseAuth.instance.signOut();

                // Navigate to the login screen and remove all previous routes
                // ignore: use_build_context_synchronously
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                  (Route<dynamic> route) => false,
                );

            }),
          ),

          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 170,
                    margin: EdgeInsets.all(10),
              
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    height: 170,
                    margin: EdgeInsets.all(10),
              
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    height: 170,
                    margin: EdgeInsets.all(10),
              
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    height: 170,
                    margin: EdgeInsets.all(10),
              
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    height: 170,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                      
                    ),
                  ),
                  Container(
                    height: 170,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                      
                    ),
                  ),
                ],
              ),
            ),            
          ),
        ],
      )
      
      ),
    );
  }

  void fetchuser() async{
  print('Fetchuser called');
  const url= 'https://randomuser.me/api/?results=5';
  final uri=Uri.parse(url);
  final response = await http.get(uri);
  final body= response.body;
  final json = jsonDecode(body);
  setState(() {
  users = json['results']; 
    
  });
  print("fetching compl");
  }
}