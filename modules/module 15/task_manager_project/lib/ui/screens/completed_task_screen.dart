import 'package:flutter/material.dart';
import 'package:task_manager_project/ui/widgets/centered_progress_indicator.dart';
import '../../data/models/network_response.dart';
import '../../data/models/newTaskWraperModel.dart';
import '../../data/models/task_model.dart';
import '../../data/restAPI/network_caller.dart';
import '../../data/urls.dart';
import '../widgets/snackBar_msg.dart';
import '../widgets/task_item_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  bool getCompletedTaskInProgress=false;
  List<TaskModel> completedTaskList=[];
  @override
  void initState() {
    super.initState();
    getCompletedTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: ()async{
          getCompletedTask();
        },
        child: Visibility(
          visible:getCompletedTaskInProgress==false,
          replacement: const CenteredProgressIndicator(),
          child: ListView.builder(
              itemCount: completedTaskList.length,
              itemBuilder: (context,index){
                return TaskItemCard(taskModel: completedTaskList[index],);
              }),
        ),
      ),
    );
  }

  Future<void> getCompletedTask()async{
    getCompletedTaskInProgress=true;
    if(mounted){
      setState(() {});
    }
    NetworkResponse response=await NetworkCaller.getRequest(Urls.completedTask);
    if(response.isSuccess){
      NewTaskWraperModel newTaskWraperModel=NewTaskWraperModel.fromJson(response.responseData);
      completedTaskList = newTaskWraperModel.taskList ?? [];
    } else{
      if(mounted){
        showSnackBarMsg(context, response.errorMsg??"Get Completed Task failed");
      }
    }
    getCompletedTaskInProgress=false;
    if(mounted){
      setState(() {});
    }

  }
}
