import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:todoapp/add_todo.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  String text = "Simple Text";

  void changeText({required String todoText}) {
    setState(() {
      text = todoText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: Text("Drawer Data")),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todo App'),
        actions: [
          InkWell(
            splashColor: Colors.green,
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: 300,
                        child: AddTodo(changeText: changeText),
                      ),
                    );
                  });
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              // GestureDetector is used to detect the tap on the Icon
              // child: GestureDetector(
              //   onTap: () {
              //     print('Plus Icon Clicked!');
              //   },
              //   child: Icon(
              //     FeatherIcons.plus,
              //   ),
              // ),

              // InkWell is used to detect the tap on the Icon. It is similar to GestureDetector. Its provide visual feedback when the user interacts with the widget.

              child: Icon(
                FeatherIcons.plus,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Text(text),
      ),
    );
  }
}
