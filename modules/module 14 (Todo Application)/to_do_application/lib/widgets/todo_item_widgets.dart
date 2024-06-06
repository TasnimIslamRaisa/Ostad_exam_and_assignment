import 'package:flutter/material.dart';
import 'package:to_do_application/entities/entity.dart';

class ListTileDesign extends StatelessWidget {
  const ListTileDesign({
    super.key,
    required this.todo,
    required this.onIconButtonPressed,
  });

  final Todo todo;
  final VoidCallback onIconButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(16),
      surfaceTintColor: getCardTintColor(todo.isDone),
      color: getBGColor(todo.isDone),
      child: ListTile(
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: getTextDecoration(todo.isDone),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo.description),
            Text(todo.time.toString()),
          ],
        ),
        trailing: SizedBox(
          width: 50,
          child: _buildRoundedIconButton(todo.isDone),
        ),
      ),
    );
  }

  Widget _buildRoundedIconButton(bool isDone) {
    return GestureDetector(
      onTap: onIconButtonPressed,
      child: CircleAvatar(
        child: Icon(getIconData(todo.isDone)),
      ),
    );
  }

  IconData getIconData(bool isDone) {
    return isDone ? Icons.check_box : Icons.check_box_outline_blank;
  }

  TextDecoration? getTextDecoration(bool isDone) {
    return isDone ? TextDecoration.lineThrough : null;
  }

  Color? getCardTintColor(bool isDone) {
    return isDone ? Colors.amber : null;
  }

  Color? getBGColor(bool isDone) {
    return isDone ? Colors.amber[50] : null;
  }
}
