import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_code/screens/qr_generator_screen.dart';

import 'package:slide_to_confirm/slide_to_confirm.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(),
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/QR.jpg'),
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            radius: 180,
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: ConfirmationSlider(
                text: "Slide to start",
                onConfirmation: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QRGenerator()));
                }),
          )
        ],
      ),
    ));
  }
}
