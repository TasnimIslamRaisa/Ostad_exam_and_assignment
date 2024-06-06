import 'package:flutter/material.dart';
import 'package:to_do_application/entities/entity.dart';
import 'package:to_do_application/widgets/todo_item_widgets.dart';

class Undonelist extends StatelessWidget {
  const Undonelist(
      {super.key,
      required this.todoList,
      required this.onDelete,
      required this.onStatusChanged});

  final List<Todo> todoList;
  final Function(int) onDelete;
  final Function(int) onStatusChanged;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (_) {
            onDelete(index);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Delete Successfully',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.amber,
              ),
            );
          },
          child: ListTileDesign(
            todo: todoList[index],
            onIconButtonPressed: () {
              onStatusChanged(index);
            },
          ),
        );
      },
    );
  }
}
