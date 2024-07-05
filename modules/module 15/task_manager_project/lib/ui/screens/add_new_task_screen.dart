import 'package:flutter/material.dart';
import 'package:task_manager_project/data/models/network_response.dart';
import 'package:task_manager_project/data/restAPI/network_caller.dart';
import 'package:task_manager_project/data/urls.dart';

import '../../utility/profile_app_bar.dart';
import '../widgets/bg_widget.dart';
import '../widgets/centered_progress_indicator.dart';
import '../widgets/snackBar_msg.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController titleController =TextEditingController();
  final TextEditingController descriptionController =TextEditingController();
  final GlobalKey<FormState> _formkey= GlobalKey<FormState>();
  bool addNettaskInProgress=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: BgWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: "Title",
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty?? true){
                        return "Enter Title";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      hintText: "Description",
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty?? true){
                        return "Enter Description";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Visibility(
                    visible: addNettaskInProgress==false,
                    replacement: const CircularProgressIndicator(),
                    child: ElevatedButton(onPressed: () async{
                      if(_formkey.currentState!.validate()){
                        await addNewTask();
                      }
                    }, child: const Text("Add"),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> addNewTask() async{
    addNettaskInProgress=true;
    if(mounted){
      setState(() {});
    }
    Map<String,dynamic> requestdata={
      "title":titleController.text.trim(),
      "description":descriptionController.text.trim(),
      "status":"New"
    };
    NetworkResponse response=await NetworkCaller.postRequest(
      Urls.createTask,
      body: requestdata,
    );
    addNettaskInProgress=false;
    if(mounted){
      setState(() {});
    }
    if(response.isSuccess){
      clearTextField();
      if(mounted){
        showSnackBarMsg(
            context,'New Task Added!');
      } else {
        if(mounted){
          showSnackBarMsg(
              context, 'Try To Add New Task Again!', true);
        }
      }
    }
  }
  void clearTextField(){
    titleController.clear();
    descriptionController.clear();
  }
  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
