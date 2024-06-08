import 'package:flutter/material.dart';
import 'package:to_do_application/entities/entity.dart';
import 'package:to_do_application/screens/new_to_do_add_screen.dart';
import 'package:to_do_application/screens/todoList/allToDoList.dart';
import 'package:to_do_application/screens/todoList/doneList.dart';
import 'package:to_do_application/screens/todoList/undoneList.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({
    super.key,
  });

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen>
    with SingleTickerProviderStateMixin {
  //late TabController _tabController=TabController(length: 3, vsync: this);
  final List<Todo> _todoList = [];
  void addNewToDo(Todo todo) {
    _todoList.add(todo);
    if (mounted) {
      setState(() {});
    }
  }

  void deleteToDo(int index) {
    _todoList.removeAt(index);
    if (mounted) {
      setState(() {});
    }
  }

  void toggleToDoStatus(int index) {
    _todoList[index].isDone = !_todoList[index].isDone;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("To-Do List"),
          centerTitle: true,
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
          bottom: buildTabBar(),
          /* actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchScreen(
                              todo: _todoList,
                              todoList: [],
                            )));
              },
            ),
          ], */
        ),
        body: TabBarView(
          children: [
            Alltodolist(
              onDelete: deleteToDo,
              onStatusChanged: toggleToDoStatus,
              todoList: _todoList,
            ),
            Donelist(
              onDelete: deleteToDo,
              onStatusChanged: toggleToDoStatus,
              todoList: _todoList.where((item) => item.isDone == true).toList(),
            ),
            Undonelist(
              onDelete: deleteToDo,
              onStatusChanged: toggleToDoStatus,
              todoList:
                  _todoList.where((item) => item.isDone == false).toList(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          tooltip: "Add Your Todo List",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewToDoAddScreen(
                  onAdd: addNewToDo,
                ),
              ),
            );
          },
          label: const Text("ADD"),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }

  TabBar buildTabBar() {
    return const TabBar(
      tabs: [
        Tab(
          text: "All",
        ),
        Tab(
          text: "Done",
        ),
        Tab(
          text: "Undone",
        ),
      ],
    );
  }
}
