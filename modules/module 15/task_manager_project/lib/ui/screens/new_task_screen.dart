import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          buildSummarySelection(),
          Expanded(
              child: ListView.builder(
                itemCount: 15,
                  itemBuilder: (context,index){
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
                              children: [
                                Chip(
                                  label: Text("New",style: TextStyle(color: AppColors.white),),shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),

                                ),
                                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                                  backgroundColor: AppColors.themeColor,
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),),
        ],
      ),
    );
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
          Expanded(child: TaskSummaryCard(number: '05', taskName: 'Cancel',)) ,
        ],
      ),
    );
  }
}
