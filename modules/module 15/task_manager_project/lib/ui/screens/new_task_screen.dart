import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../style/appColors.dart';
import '../../utility/profile_app_bar.dart';
import '../widgets/network_cached_image.dart';
import '../widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(),
      body: const Column(
        children: [
          SingleChildScrollView(
            scrollDirection:Axis.vertical,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: TaskSummaryCard(number: '12', taskName: 'New Task',)) ,
                Expanded(child: TaskSummaryCard(number: '10', taskName: 'Completed',)) ,
                Expanded(child: TaskSummaryCard(number: '15', taskName: 'In Progress',)) ,
                Expanded(child: TaskSummaryCard(number: '05', taskName: 'Cancel',)) ,

              ],
            ),
          ),
        ],
      ),
    );
  }

}
