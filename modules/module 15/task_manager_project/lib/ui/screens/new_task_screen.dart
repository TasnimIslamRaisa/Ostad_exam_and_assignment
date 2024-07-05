import 'package:flutter/material.dart';
import 'package:task_manager_project/data/models/network_response.dart';
import 'package:task_manager_project/data/restAPI/network_caller.dart';
import 'package:task_manager_project/data/urls.dart';
import 'package:task_manager_project/style/appColors.dart';
import 'package:task_manager_project/ui/screens/add_new_task_screen.dart';
import 'package:task_manager_project/ui/widgets/centered_progress_indicator.dart';
import 'package:task_manager_project/ui/widgets/snackBar_msg.dart';
import '../../data/models/newTaskWraperModel.dart';
import '../../data/models/task_model.dart';
import '../widgets/task_item_card.dart';
import '../widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool getNewTaskInProgress=false;
  List<TaskModel> newTaskList=[];
  @override
  void initState() {
    super.initState();
    getNewTask();
  }

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
                child: RefreshIndicator(
                  onRefresh: ()async{
                    getNewTask();
                },
                  child: Visibility(
                    visible: getNewTaskInProgress==false,
                    replacement: const CenteredProgressIndicator(),
                    child: ListView.builder(
                      itemCount: newTaskList.length,
                        itemBuilder: (context,index){
                          return TaskItemCard(taskModel: newTaskList[index],);
                        }),
                  ),
                ),),
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

  Future<void> getNewTask()async{
    getNewTaskInProgress=true;
    if(mounted){
      setState(() {});
    }
    NetworkResponse response=await NetworkCaller.getRequest(Urls.newTask);
    if(response.isSuccess){
      NewTaskWraperModel newTaskWraperModel=NewTaskWraperModel.fromJson(response.responseData);
      newTaskList = newTaskWraperModel.taskList ?? [];
    } else{
      if(mounted){
        showSnackBarMsg(context, response.errorMsg??"Get New Task failed");
      }
    }
    getNewTaskInProgress=false;
    if(mounted){
      setState(() {});
    }

  }
}


