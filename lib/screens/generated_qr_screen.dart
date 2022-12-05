import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratedQR extends StatefulWidget {
  const GeneratedQR({Key? key, required this.qr}) : super(key: key);
  final qr;

  @override
  State<GeneratedQR> createState() => _GeneratedQRState();
}

class _GeneratedQRState extends State<GeneratedQR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: QrImage(
        data: widget.qr,
        version: QrVersions.auto,
        size: 250,
        gapless: false,
      )),
    );
  }
}
