// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/ListPage.dart';
import 'package:flutter_application_1/Pages/Qrcode.dart';
import 'package:flutter_application_1/Pages/Wallet.dart';
import 'package:flutter_application_1/Pages/menu.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late final Duration themeAnimationDuration;
  
  get markers => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeAnimationDuration: const Duration(milliseconds: 5),      
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Qrcode()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.qr_code_scanner_rounded,size:30,),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(115), // Set the height here
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0, // Remove shadow
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0), // Hide the existing bottom
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
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(130, 60)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    const Color.fromARGB(255, 20, 20, 20)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: const Text('Maps'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(child: const ListPage(), type: PageTransitionType.fade)
                              // MaterialPageRoute(builder: (context) => const ListPage(),),
                            );
                          },
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(130, 60)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.teal),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: const Text('List'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      
        

        bottomNavigationBar: GNav(
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
            _navigateToPage(index);
          },
          tabBackgroundColor: const Color.fromARGB(250, 20, 20, 20),
          tabBorderRadius: 20,
          tabMargin: const EdgeInsets.all(10),
          backgroundColor: Colors.teal,
          activeColor: Colors.white,
          color: Colors.white,
          gap: 5,
          tabs: const [
            GButton(
              icon: Icons.home,
              iconSize: 25,
              text: 'Home',
            ),
            GButton(
              icon: Icons.wallet,
              iconSize: 25,
              text: 'Wallet',
            ),
            GButton(
              icon: Icons.menu,
              iconSize: 25,
              text: 'Menu',
            ),
          ],
        ),
      ),
    );
  }
  

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        // Navigate to Home page
        // If Home page is another widget, replace MaterialPageRoute with your desired route.
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const HomeScreen()),
        // );
        break;
      case 1:
        // Navigate to WalletPage
        Navigator.push(
          context,
          PageTransition(child: const WalletPage(), type: PageTransitionType.fade)
          // MaterialPageRoute(builder: (context) => const WalletPage()),
        );
        break;
      case 2:
      Navigator.push(
          context,
          PageTransition(child: const MenuPage(), type: PageTransitionType.fade)
          // MaterialPageRoute(builder: (context) => const MenuPage()),
        );
        // Navigate to Menu page
        // Add navigation for MenuPage here
        break;
      default:
        break;
    }
  }
}
