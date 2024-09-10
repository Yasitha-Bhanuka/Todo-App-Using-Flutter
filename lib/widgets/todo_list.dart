import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodolistBuilder extends StatefulWidget {
  List<String> todoList = [];

  void Function() updateLocalData;

  TodolistBuilder(
      {super.key, required this.todoList, required this.updateLocalData});

  @override
  State<TodolistBuilder> createState() => _TodolistBuilderState();
}

class _TodolistBuilderState extends State<TodolistBuilder> {
  // This function will be called when the user taps on a todo item
  void onItemClicked({required int index}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.todoList.removeAt(index);
                  });
                  widget.updateLocalData();
                  Navigator.pop(context);
                },
                child: const Text("Mark as done!")),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return (widget.todoList.isEmpty)
        ? const Center(
            child: Text(
              "No todos yet!",
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
          )
        : ListView.builder(
            itemCount: widget.todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  onItemClicked(index: index);
                },
                title: Text(widget.todoList[index]),
              );
            });
  }
}
