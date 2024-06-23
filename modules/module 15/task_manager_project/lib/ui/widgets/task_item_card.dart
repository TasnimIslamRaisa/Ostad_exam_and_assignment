import 'package:flutter/material.dart';
import '../../style/appColors.dart';

class TaskItemCard extends StatelessWidget {
  const TaskItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: AppColors.white,
      child: ListTile(
        title: Text("Title will be here"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Description will be here"),
            const Text("Date : 12/12/24",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text("New",style: TextStyle(color: AppColors.white),),shape: RoundedRectangleBorder(
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