import 'package:firebase_student/controller/home_provider.dart';
import 'package:firebase_student/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditScreen extends StatefulWidget {
  StudentModel student;
  String id;
  EditScreen({super.key, required this.id, required this.student});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController classsController = TextEditingController();

  @override
  void initState() {
    super.initState();

    ageController.text = widget.student.age ?? '';
    classsController.text = widget.student.classs ?? '';
    nameController.text = widget.student.name ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                child: IconButton(
                    onPressed: () {
                      _showImageOptions(context);
                    },
                    icon: const Icon(Icons.camera)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(
                      hintText: "Age",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: classsController,
                  decoration: InputDecoration(
                      hintText: "class",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                  onPressed: () {
                    editStudent(context);
                  },
                  child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }

  editStudent(
    BuildContext context,
  ) async {
    final pro = Provider.of<Homeprovider>(context, listen: false);

    try {
      final editedname = nameController.text;
      final editedage = ageController.text;
      final editclass = classsController.text;

      // Update image URL in Firestore

      final updatedstudent = StudentModel(
        name: editedname,
        age: editedage,
        classs: editclass,
      );

      // Update student information in Firestore
      pro.updateStudent(widget.id, updatedstudent);

      Navigator.pop(context);
    } catch (e) {
      // Handle exceptions appropriately (e.g., show an error message)
      print("Error updating student: $e");
    }
  }

  Future<void> _showImageOptions(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choose an option"),
          actions: [
            TextButton(
              onPressed: () async {},
              child: const Text("Camera"),
            ),
            TextButton(
              onPressed: () async {},
              child: const Text("Gallery"),
            ),
          ],
        );
      },
    );
  }
}
