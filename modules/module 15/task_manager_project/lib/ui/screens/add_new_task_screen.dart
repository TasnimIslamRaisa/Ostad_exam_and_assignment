import 'package:flutter/material.dart';

import '../../utility/profile_app_bar.dart';
import '../widgets/bg_widget.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(),
      body: BgWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  //controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Title",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  //controller: passWordController,
                  maxLines: 6,
                  decoration: const InputDecoration(
                    hintText: "Description",
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(onPressed: (){}, child: const Text("Add"),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
