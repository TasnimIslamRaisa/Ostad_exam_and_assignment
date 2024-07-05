import 'package:flutter/material.dart';
import 'package:task_manager_project/data/models/task_model.dart';
import '../../style/appColors.dart';

class TaskItemCard extends StatelessWidget {
  const TaskItemCard({
    super.key, required this.taskModel,
  });
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: AppColors.white,
      child: ListTile(
        title: Text(taskModel.title?? '' ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(taskModel.description ??''),
             Text("Date : ${taskModel.createdDate}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(taskModel.status??'',style: TextStyle(color: AppColors.white),),shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),

                ),
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                  backgroundColor: AppColors.themeColor,
                ),
                ButtonBar(
                  children: [
                    IconButton(onPressed: (){}, icon:const Icon(Icons.delete)),
                    IconButton(onPressed: (){}, icon:const Icon(Icons.edit)),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}