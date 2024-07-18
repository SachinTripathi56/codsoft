import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class option extends StatefulWidget {
 
  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<option> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(249, 255, 28, 28),
      ),
    );
  }
}
