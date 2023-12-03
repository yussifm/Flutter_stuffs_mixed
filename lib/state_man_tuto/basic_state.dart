import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maths_tuto_flutter/state_man_tuto/basic_state.dart';
import 'package:uuid/v4.dart';

class BasicStateManage extends StatelessWidget {
  const BasicStateManage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("contacts"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
          valueListenable: ContactBook(),
          builder: (context, value, child) {
            final contacts = value;
            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: ((context, index) {
                final contact = contacts[index];

                return Dismissible(
                  onDismissed: (direction) {
                    ContactBook().remove(contact: contact);
                  },
                  key: ValueKey(contact.id),
                  child: Material(
                    color: Colors.white,
                    elevation: 6,
                    child: ListTile(
                      title: Text(contact.name),
                    ),
                  ),
                );
              }),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewContactView(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Contact {
  final String name;
  final String id;

  Contact({required this.name}) : id = const UuidV4().generate();
}

class ContactBook extends ValueNotifier<List<Contact>> {
  ContactBook._sharedInstance() : super([]);

// Singleton
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;

  final List<Contact> _contacts = [];

  int get length => value.length;

  void add({required Contact contact}) {
    final contacts = value;
    contacts.add(contact);
    notifyListeners();
  }

  void remove({required Contact contact}) {
    final contacts = value;
    if (contacts.contains(contact)) {
      contacts.remove(contact);
      notifyListeners();
    }
  }

  Contact? contact({required int atIndex}) {
    return value.length > atIndex ? value[atIndex] : null;
  }
}

class NewContactView extends StatefulWidget {
  const NewContactView({super.key});

  @override
  State<NewContactView> createState() => _NewContactViewState();
}

class _NewContactViewState extends State<NewContactView> {
  var controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add a new Contact"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Enter a new contact name here ....",
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    final contact = Contact(name: controller.text);

                    ContactBook().add(contact: contact);
                    Navigator.pop(context);
                  },
                  child: const Text('Add Contact'))
            ],
          ),
        ));
  }
}
