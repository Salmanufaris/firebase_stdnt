import 'package:firebase_student/controller/home_provider.dart';
import 'package:firebase_student/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: Text(
          "Add details",
          style: GoogleFonts.aboreto(fontWeight: FontWeight.w200),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              CircleAvatar(
                radius: 70,
                child: IconButton(
                    onPressed: () {
                      _showImageOptions(context);
                    },
                    icon: const Icon(Icons.camera)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(
                      hintText: "age",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: classsController,
                  decoration: InputDecoration(
                      hintText: "class",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                  color: Colors.amber,
                  onPressed: () {
                    addstudent(context);
                    Navigator.pop(context);
                  },
                  child: const Text("save"))
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
