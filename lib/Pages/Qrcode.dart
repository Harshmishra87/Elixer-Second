import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Qrcode extends StatefulWidget {
  const Qrcode({super.key});

  @override
  State<Qrcode> createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
  // String _scanresult = "";

  // //scan function
  // Future<void> scanCode() async{
  //   String qrcodescanres;
  //   try{
  //   qrcodescanres= await FlutterBarcodeScanner.scanBarcode(
  //     "#ff6666", "Cancel", true, ScanMode.QR);

  //   }on PlatformException{
  //     qrcodescanres = "failed to scan";
  //   }

  //   setState(() {
  //     _scanresult=qrcodescanres;
  //   });
  // }
  final GlobalKey qrkey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String scannedcode = '';

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      body: Column(
        children:<Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key:qrkey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex:1,
            child: Text(
              'Scanned Code: $scannedcode',
              style: const TextStyle(fontSize: 18),
            )
            )
        ]
      ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller){
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedcode= 
                    scanData.code!;
      });
     });
  }
}