import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/HomeScreen.dart';
import 'package:flutter_application_1/Pages/menu.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:upi_india/upi_india.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int _selectedIndex = 1;
  double balance = 100;
  double topup = 0;
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  
  List<UpiApp>? apps;
UpiIndia _upiIndia = UpiIndia();
  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }
Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "harsh.mishra872005@okicici",
      receiverName: 'Harsh Mishra',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: topup,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      appBar: AppBar(
        toolbarHeight: 100,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Wallet'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 400,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 40, 40, 40),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.account_balance_wallet_rounded,
                        color: Colors.white,
                        size: 60,
                      ),
                      Center(
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 20, 20, 20),
                          ),
                          child: Center(
                            child: Text(
                              '₹ $balance',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _controller,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  topup = double.tryParse(value) ?? 0;
                  print(topup);
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter amount: $topup',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      topup += 100;
                      print(topup);
                      _controller.text = topup.toString();
                    });
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(100, 50),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  child: const Text('100+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      topup += 200;
                      _controller.text = topup.toString();
                      print(topup);
                    });
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(100, 50),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  child: const Text('200+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      topup += 500;
                      _controller.text = topup.toString();
                      print(topup);
                    });
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(100, 50),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  child: const Text('500+'),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  balance += topup;
                  _controller2.text = balance.toString();
                  initiateTransaction(apps!.first);
                });
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size(380, 60),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 40, 40, 40),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: const Text('Add to wallet'),
            ),
          ],
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
    );
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          PageTransition(
            child: const HomeScreen(),
            type: PageTransitionType.fade,
          ),
        );
        break;
      case 1:
        break;
      case 2:
        Navigator.push(
          context,
          PageTransition(
            child: const MenuPage(),
            type: PageTransitionType.fade,
          ),
        );
        break;
      default:
        break;
    }
  }
}
