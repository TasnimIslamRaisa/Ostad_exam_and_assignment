import 'package:flutter/material.dart';
import 'package:to_do_application/entities/entity.dart';
import 'package:to_do_application/widgets/todo_item_widgets.dart';

class AllToDoListTab extends StatelessWidget {
  const AllToDoListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (_) {
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
            todo: Todo('Title', 'Description', DateTime.now()),
            onIconButtonPressed: () {},
          ),
        );
      },
    );
  }
}
