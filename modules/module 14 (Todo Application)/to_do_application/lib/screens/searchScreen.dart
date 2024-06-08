import 'package:flutter/material.dart';
import 'package:to_do_application/entities/entity.dart';

class SearchScreen extends StatefulWidget {
  final List<Todo> todoList;

  SearchScreen({super.key, required this.todoList, required List<Todo> todo});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  List<Todo> foundList = [];

  @override
  void initState() {
    super.initState();
    foundList =
        widget.todoList; // Initialize foundList with the complete todoList
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                    ),
                    onChanged: (value) {
                      runFilter(value);
                    },
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {
                    runFilter(searchController.text);
                  },
                  icon: const Icon(Icons.search),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: foundList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(foundList[index].description ?? ''),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void runFilter(String enteredKey) {
    List<Todo> result = [];
    if (enteredKey.isEmpty) {
      result = widget.todoList;
    } else {
      result = widget.todoList
          .where((item) => item.description!
              .toLowerCase()
              .contains(enteredKey.toLowerCase()))
          .toList();
    }
    setState(() {
      foundList = result;
    });
  }
}
