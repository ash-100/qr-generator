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
  int _index = 0;
  List<bool> _selections = [false, true];

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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Encryption',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ToggleButtons(
                children: [Text('Yes'), Text('No')],
                isSelected: _selections,
                color: Colors.black,
                selectedColor: Colors.black,
                fillColor: Colors.lightBlue,
                onPressed: (index) {
                  for (int i = 0; i < _selections.length; i++) {
                    _selections[i] = i == index;
                  }
                  setState(() {
                    _index = index;
                  });
                },
              ),
            ],
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
                  if (_index == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GeneratedQR(
                                qr: encryption
                                    .encryptMsg(textController.text)
                                    .base16)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                GeneratedQR(qr: textController.text)));
                  }
                }
              },
              child: Text('Generate OR'))
        ],
      )),
    );
  }
}
