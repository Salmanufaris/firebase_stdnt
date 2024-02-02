import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_student/model/student_model.dart';
import 'package:firebase_student/service/firebase_service.dart';
import 'package:flutter/material.dart';

class Homeprovider extends ChangeNotifier {
  FirebaseService _firebaseService = FirebaseService();

  Stream<QuerySnapshot<StudentModel>> getData() {
    return _firebaseService.studentref.snapshots();
  }

  addStudent(StudentModel student) async {
    await _firebaseService.studentref.add(student);
    notifyListeners();
  }
}
