import 'package:firebase_student/model/student_model.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final StudentModel student;

  const Detail({required this.student, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text(
                "Name",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                student.name ?? '',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text(
                "Age",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                student.age ?? '',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text(
                "Class",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                student.classs ?? '',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
                title: const Text(
                  "Subject",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  student.subject ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
