import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/add_todo.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List<String> todoList = [];

  void addTodo({required String todoText}) {
    if (todoList.contains(todoText)) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Already Exists"),
              content: const Text('This todo already exists!'),
              actions: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Close"))
              ],
            );
          });
      return;
    }

    setState(() {
      todoList.insert(0, todoText);
    });
    updateLocalData();
    Navigator.pop(context);
  }

  void updateLocalData() async {
    // obtain shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Save an list of strings to 'items' key.
    prefs.setStringList('todoList', todoList);
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      todoList = (prefs.getStringList('todoList') ?? []).toList();
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
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
                          child: AddTodo(addTodo: addTodo),
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
        body: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  todoList.removeAt(index);
                                });
                                updateLocalData();
                                Navigator.pop(context);
                              },
                              child: const Text("Mark as done!")),
                        );
                      });
                },
                title: Text(todoList[index]),
              );
            }));
  }
}
