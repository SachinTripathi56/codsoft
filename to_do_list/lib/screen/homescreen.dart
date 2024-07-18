import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/Widget/addtask.dart';

import '../Widget/option.dart';

// ignore: must_be_immutable
class Homescreen extends StatefulWidget {
  String txtt = "";
  Homescreen(this.txtt);

  //Homescreen({super.key});

  @override
  homescreenState createState() => homescreenState();
}

class homescreenState extends State<Homescreen> {
  
  late TextEditingController txt;
  late TextEditingController txt1;
  late TextEditingController txt2;
  List tasks = [];
  List tasks1 = [];
  List tasks2 = [];
  int c_index = 0;
  int c_index1 = 0;
  @override
  void initState() {
    txt = new TextEditingController();
    txt1 = new TextEditingController();
    txt2 = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    txt.dispose();
    txt1.dispose();
    txt2.dispose();
  }

  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 242, 242, 242),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.profile_circled,
                          size: 55,
                        )),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Hello,\n",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 104, 103, 103))),
                          TextSpan(
                            text: '${widget.txtt}',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                    ),
                    Icon(
                      Icons.notifications,
                      color: Color.fromARGB(255, 32, 183, 209),
                    ),
                    //Text('Hello\n', style: TextStyle(fontSize: 17)),
                  ],
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "My Task:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 140,
                  width: 300,
                  child: ListView.builder(
                    itemCount: tasks.length < 5 ? tasks.length : 4,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 230,
                        height: 145,
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Color.fromARGB(255, 5, 230, 238),
                        ),
                        child: Center(
                            child: Text(
                          "${tasks[index]}",
                          style: TextStyle(fontSize: 20),
                        )),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Pending:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "see all",
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                ),
                SizedBox(height: 10),
                Container(
                    height: MediaQuery.of(context).size.height / 1.45,
                    width: MediaQuery.of(context).size.width,
                    // decoration: BoxDecoration(color: Color.fromRGBO(245, 0, 163, 1)),
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: InkWell(
                                  onTap: () {
                                    if (index == 0) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => option(),
                                          ));
                                      // setState(() {
                                      //   _checked = true;
                                      // });
                                    } else if (index == 1) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => addtask(),
                                          ));
                                    }
                                  },
                                  child: Container(
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        border: Border.all(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                    child: ListTile(
                                      leading: SizedBox(width: 5),
                                      title: Text(
                                        " ${tasks[index]}",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      subtitle: Text("${tasks1[index]}"),
                                      trailing: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 38.0, top: 20),
                                        child: Text(
                                          "${tasks2[index]}",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 330, top: 25),
                                child: CheckboxListTile(
                                    value: _checked,
                                    // bool tt = false;

                                    onChanged: (bool? value) {
                                      setState(() {
                                        _checked = value!;
                                        // true;
                                      });
                                    }),
                              ),
                              Positioned(
                                top: 32,
                                left: 340,
                                child: IconButton(
                                    onPressed: () => showdialog2(index),
                                    icon:
                                        Icon(CupertinoIcons.ellipsis_vertical)),
                              )
                            ],
                          );
                        })),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 700.0, left: 290),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                  color: Color.fromARGB(255, 153, 228, 163),
                ),
                child: IconButton(
                    onPressed: () async {
                      final name = await showdialog();
                      if (name == null || name.isEmpty)
                        return;
                      else {
                        tasks.add(name);
                        setState(() {
                          c_index += 1;
                        });
                      }
                    },
                    icon: Icon(CupertinoIcons.add_circled_solid)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> showdialog() =>
      // flutter defined function
      showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("ENTER TASK"),
            content: Container(
              height: 200,
              width: 300,
              child: Column(
                children: [
                  TextField(
                    controller: txt,
                    decoration: InputDecoration(
                      hintText: 'Task Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: txt1,
                    decoration: InputDecoration(
                      hintText: 'description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: txt2,
                    decoration: InputDecoration(
                      hintText: 'Time',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            //Text("Task"),
            actions: [
              ElevatedButton(
                child: new Text("Add"),
                onPressed: () {
                  setState(() {
                    tasks1.add(txt1.text);
                    tasks2.add(txt2.text);
                    c_index1 += 1;
                  });

                  Navigator.of(context).pop(txt.text);

                  txt.clear();
                  txt1.clear();
                  txt2.clear();
                },
              ),
            ],
          );
        },
      );
  Future<String?> editbox(int index) =>
      // flutter defined function

      showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          //txt = tasks[index];
          // return object of type Dialog
          return AlertDialog(
            title: Text("ENTER TASK"),
            content: Container(
              height: 200,
              width: 300,
              child: Column(
                children: [
                  TextField(
                    controller: txt,
                    decoration: InputDecoration(
                      hintText: '${tasks[index]}',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: txt1,
                    decoration: InputDecoration(
                      hintText: '${tasks1[index]}',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: txt2,
                    decoration: InputDecoration(
                      hintText: '${tasks2[index]}',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),

            //Text("Task"),
            actions: [
              ElevatedButton(
                child: new Text("Add"),
                onPressed: () {
                  setState(() {
                    tasks1[index] = txt1.text;
                    tasks2[index] = txt2.text;
                  });
                  Navigator.of(context).pop(txt.text);

                  txt.clear();
                  txt1.clear();
                  txt2.clear();
                },
              ),
            ],
          );
        },
      );

  void showdialog2(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 230.0, top: 100),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                height: 110,
                width: 60 + 32,
                // color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () async {
                        final newName = await editbox(index);
                        if (newName == null || newName.isEmpty)
                          return;
                        else {
                          tasks[index] = newName;
                          setState(() {
                            //txt = tasks[index - 1];
                          });
                          Navigator.of(context).pop();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                            height: 35,
                            width: 80,
                            color: Colors.white,
                            child: Row(
                              children: [
                                Icon(Icons.edit),
                                Text(
                                  "Edit",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: TextButton(
                        onPressed: () {
                          tasks.removeAt(index);
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            height: 35,
                            width: 80,
                            color: Colors.white,
                            child: Row(
                              children: [
                                Icon(Icons.delete),
                                Text(
                                  "Delete",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
