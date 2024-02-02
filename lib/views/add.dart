import 'package:firebase_student/controller/home_provider.dart';
import 'package:firebase_student/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Addscreen extends StatelessWidget {
  Addscreen({super.key});
  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController classsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 70),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(
                      hintText: "age",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: classsController,
                  decoration: InputDecoration(
                      hintText: "class",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    addstudent(context);
                    Navigator.pop(context);
                  },
                  child: Text("save"))
            ],
          ),
        ),
      ),
    );
  }

  void addstudent(BuildContext context) async {
    final pro = Provider.of<Homeprovider>(context, listen: false);
    final name = nameController.text;
    final age = ageController.text;
    final classs = classsController.text;

    final student = StudentModel(
      name: name,
      age: age,
      classs: classs,
    );
    pro.addStudent(student);
  }
}
