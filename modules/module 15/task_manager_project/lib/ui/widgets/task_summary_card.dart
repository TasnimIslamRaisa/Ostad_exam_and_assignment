import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskSummaryCard extends StatelessWidget {
  const TaskSummaryCard({super.key, required this.number, required this.taskName});
  final String number;
  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text(
                number,
                style:Theme.of(context).textTheme.titleLarge),
            Text(taskName,style:Theme.of(context).textTheme.labelMedium)
          ],
        ),
      ),
    );
  }
}
