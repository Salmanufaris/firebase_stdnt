import 'package:firebase_student/controller/add_provider.dart';

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
  @override
  void initState() {
    final pro = Provider.of<AddEditProvider>(context, listen: false);
    super.initState();

    pro.ageController.text = widget.student.age ?? '';
    pro.classsController.text = widget.student.classs ?? '';
    pro.nameController.text = widget.student.name ?? "";
    pro.subjectController.text = widget.student.subject ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
          child: Consumer<AddEditProvider>(
            builder: (context, value, child) => Column(
              key: value.formkey,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                TextFormField(
                    controller: value.nameController,
                    decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: value.ageController,
                    decoration: InputDecoration(
                        hintText: "Age",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: value.classsController,
                    decoration: InputDecoration(
                        hintText: "class",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: value.subjectController,
                    decoration: InputDecoration(
                        hintText: "Subject",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                    onPressed: () {
                      editStudent(context);
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  editStudent(BuildContext context) async {
    final prov = Provider.of<HomeProvider>(context, listen: false);
    final pro = Provider.of<AddEditProvider>(context, listen: false);
    final editedname = pro.nameController.text;
    final editedage = pro.ageController.text;
    final editclass = pro.classsController.text;
    final editsubject = pro.subjectController.text;

    final updatedstudent = StudentModel(
        name: editedname,
        age: editedage,
        classs: editclass,
        subject: editsubject);

    prov.updateStudent(widget.id, updatedstudent);

    Navigator.pop(context);
  }
}
