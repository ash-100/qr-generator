import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_code/AES.dart';
import 'package:qr_code/screens/generated_qr_screen.dart';

class QRGenerator extends StatefulWidget {
  @override
  State<QRGenerator> createState() => _QRGeneratorState();
}

class _QRGeneratorState extends State<QRGenerator> {
  AESEncryption encryption = new AESEncryption();
  TextEditingController textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Generator'),
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: textController,
              decoration: InputDecoration(labelText: 'Enter text'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (textController.text.toString().trim().isEmpty) {
                  const snackBar = SnackBar(
                    content: Text('Enter text'),
                    backgroundColor: Colors.blue,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GeneratedQR(
                              qr: encryption
                                  .encryptMsg(textController.text)
                                  .base16)));
                }
              },
              child: Text('Generate OR'))
        ],
      )),
    );
  }
}
