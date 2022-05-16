

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'cubit/loginCubit.dart';
import 'cubit/loginState.dart';
import 'ticket.dart';
class ScanScreen extends StatefulWidget {

  final String? phone ;
  const ScanScreen({Key? key , this.phone}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
     controller!.resumeCamera();
  }


  @override
  Widget build(BuildContext context) {
   print('23 ${widget.phone}');
   
    return BlocConsumer< LoginCubit , LoginState>(
      listener: (context, state) => {},
      builder: (context, state) {
        return  Scaffold(
        appBar: AppBar(),
     body: Column(
    children: <Widget>[
    Expanded(flex: 4, child: _buildQrView(context)),
    /*   Expanded(
                flex: 1,
                child:
                FittedBox(
                  fit: BoxFit.contain,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        if (result != null)
                          Center(
                            child:
                            Text(' ${describeEnum(result!.format)} \n  Data: ${result!.code }',
                              style: TextStyle(fontSize: 13),),

                          )

                        else
                          Text('Scan a code' , style: TextStyle(fontSize: 10), ),

                      ]),


                )) ,*/


    ],
    ),
    );
      } ,
    );
  }

  Widget _buildQrView(BuildContext context) {

    // control width
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        // ? 200.0
        // : 350.0;
        ? 300.0
        : 400.0;

    return QRView(
      key: qrKey,
      onQRViewCreated:_onQRViewCreated ,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {

    setState(() {
      this.controller = controller;
    });

    // 0521463987

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        print('++++ ${scanData.code}');

        if(scanData.code?.split('tel:')[1] == '${widget.phone}')
        {
           print(scanData.code?.split('tel:')[1]);
           Navigator.push(context, MaterialPageRoute(builder: (context)=> TicketScreen()));
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {

    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }



}







