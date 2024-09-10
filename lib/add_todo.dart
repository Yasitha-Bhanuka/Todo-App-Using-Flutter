import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  final void Function({required String todoText}) changeText;

  const AddTodo({super.key, required this.changeText});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController todoText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Add Todo'),
        TextField(
          controller: todoText,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(5),
              labelText: "username",
              hintText: 'Write your todo here...'),
        ),
        ElevatedButton(
            onPressed: () {
              widget.changeText(todoText: todoText.text);
              todoText.text = "";
            },
            child: const Text('Add Todo'))
      ],
    );
  }
}
