import 'package:flutter/material.dart';
import 'package:to_do_application/entities/entity.dart';
import 'package:to_do_application/style/style.dart';

class NewToDoAddScreen extends StatefulWidget {
  const NewToDoAddScreen({
    super.key,
    required this.onAdd,
  });

  final Function(Todo) onAdd;

  @override
  State<NewToDoAddScreen> createState() => _NewToDoAddScreenState();
}

class _NewToDoAddScreenState extends State<NewToDoAddScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New To-Do List"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: addInputDecoration("Title"),
                  maxLength: 25,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter a title";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: addInputDecoration("Description"),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  //maxLines: 25,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter a Description";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Todo todo = Todo(titleController.text.trim(),
                          descriptionController.text.trim(), DateTime.now());
                      widget.onAdd(todo);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'To-Do item added',
                            style: TextStyle(color: Colors.black),
                          ),
                          backgroundColor: Colors.amber,
                        ),
                      );
                    }
                  },
                  child: const Text("Add"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
