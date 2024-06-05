import 'package:flutter/material.dart';

void main() => runApp(const ContactApp());

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ContactHomePage(),
    );
  }
}

class ContactHomePage extends StatefulWidget {
  const ContactHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContactHomePageState createState() => _ContactHomePageState();
}

class _ContactHomePageState extends State<ContactHomePage> {
  final List<Map<String, String>> _contacts = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _addContact(String name, String number) {
    setState(() {
      _contacts.add({'name': name, 'number': number});
    });
    _nameController.clear();
    _numberController.clear();
  }

  void _removeContact(int index) {
    setState(() {
      _contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please select a name";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number',
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please select a Name";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _addContact(_nameController.text, _numberController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Contact Number Added To The List')),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueGrey),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white), // Set your desired color here
                  fixedSize: MaterialStateProperty.all<Size>(
                      Size(450, 50)), // Set width and height as desired
                  shape: MaterialStateProperty.all<BeveledRectangleBorder>(
                    BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          2.0), // Set the desired radius here
                    ),
                  ),
                ),
                child: const Text('Add'),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Confirm Deletion'),
                          content:
                              const Text('Do you want to delete this contact?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(Icons.cancel),
                            ),
                            TextButton(
                              onPressed: () {
                                _removeContact(index);
                                Navigator.of(context).pop();
                              },
                              child: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(_contacts[index]['name']!),
                        subtitle: Text(_contacts[index]['number']!),
                        trailing: const Icon(Icons.phone),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
