import 'package:firebase_student/controller/add_provider.dart';
import 'package:firebase_student/controller/home_provider.dart';
import 'package:firebase_student/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Add details",
          style: GoogleFonts.aboreto(
              fontWeight: FontWeight.w200, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
          child: Consumer<AddEditProvider>(
            builder: (context, value, child) => Column(
              key: value.formkey,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: value.nameController,
                  decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: value.ageController,
                  decoration: InputDecoration(
                      hintText: "Age",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an age';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: value.classsController,
                  decoration: InputDecoration(
                      hintText: "Class",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a class';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: value.subjectController,
                  decoration: InputDecoration(
                      hintText: "Subject",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a subject';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: Colors.black,
                  onPressed: () {
                    if (value.formkey.currentState != null &&
                        value.formkey.currentState!.validate()) {
                      addStudent(context);
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text(
                                "Please fill in all fields before adding."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addStudent(BuildContext context) {
    final prov = Provider.of<HomeProvider>(context, listen: false);
    final pro = Provider.of<AddEditProvider>(context, listen: false);
    final name = pro.nameController.text;
    final age = pro.ageController.text;
    final classs = pro.classsController.text;
    final subject = pro.subjectController.text;
    final student =
        StudentModel(name: name, age: age, classs: classs, subject: subject);
    prov.addStudent(student);
    Navigator.pop(context);
  }
}
