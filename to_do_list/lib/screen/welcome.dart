//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/screen/homescreen.dart';

import 'homescreen.dart';

class welcome extends StatefulWidget {
  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  late TextEditingController txt;
  @override
  void initState() {
    super.initState();
    txt = TextEditingController();
  }

  void Dispose() {
    txt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
             width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
            color: Color.fromARGB(255, 78, 211, 220),
            child: Column(
              children: [
                SizedBox(
                  height: 240,
                ),
                Center(
                    child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22.0),
                    child: Text(
                      'Welcome to TO DO List !',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 8, 36, 164)),
                    ),
                  ),
                )),
                SizedBox(
                  height: 200,
                ),
                TextField(
                    controller: txt,
                    decoration: InputDecoration(
                        labelText: 'Enter Your name',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (txt.text.isEmpty) {
                      return;
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homescreen(txt.text),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 238, 26, 69),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
