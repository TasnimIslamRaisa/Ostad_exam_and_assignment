import 'package:flutter/material.dart';
import 'package:task_manager_project/style/appColors.dart';
import 'package:task_manager_project/ui/screens/add_new_task_screen.dart';
import '../widgets/task_item_card.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(top: 8,left: 8,right: 8),
        child: Column(
          children: [
            buildSummarySelection(),
            const SizedBox(height: 10,),
            Expanded(
                child: ListView.builder(
                  itemCount: 15,
                    itemBuilder: (context,index){
                      return const TaskItemCard();
                    }),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.themeColor,
        foregroundColor: AppColors.white,
        onPressed: onTabAddButton,
        child:const Icon(Icons.add),
      ),
    );
  }

  void onTabAddButton(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>const AddNewTaskScreen(),),);
  }
  Widget buildSummarySelection(){
    return const SingleChildScrollView(
      scrollDirection:Axis.vertical,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child: TaskSummaryCard(number: '12', taskName: 'New Task',)) ,
          Expanded(child: TaskSummaryCard(number: '10', taskName: 'Completed',)) ,
          Expanded(child: TaskSummaryCard(number: '15', taskName: 'In Progress',)) ,
          Expanded(child: TaskSummaryCard(number: '05', taskName: 'Cancel Cancel',)) ,
        ],
      ),
    );
  }
}


