import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
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
                    return Container(
                      height: 250,
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
      body: const Center(child: Text('Hello Todo App')),
    );
  }
}
