import 'dart:developer';
import 'dart:io';
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
  TextEditingController subjectController = TextEditingController();

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
              const SizedBox(
                height: 70,
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
              TextFormField(
                  controller: subjectController,
                  decoration: InputDecoration(
                      hintText: "Subject",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                  onPressed: () {},
                  child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }

  editStudent(BuildContext context, String imageurl) async {
    final pro = Provider.of<Homeprovider>(context, listen: false);

    try {
      final editedname = nameController.text;
      final editedage = ageController.text;
      final editclass = classsController.text;
      final editsubject = subjectController.text;

      final updatedstudent = StudentModel(
          name: editedname,
          age: editedage,
          classs: editclass,
          subject: editsubject);

      pro.updateStudent(widget.id, updatedstudent);

      Navigator.pop(context);
    } catch (e) {
      log("Error updating student: $e");
    }
  }
}
