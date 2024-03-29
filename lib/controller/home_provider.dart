// ignore_for_file: prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_student/model/student_model.dart';
import 'package:firebase_student/service/firebase_service.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  FirebaseService _firebaseService = FirebaseService();
  String uniquename = DateTime.now().microsecondsSinceEpoch.toString();
  String downloadurl = '';

  Stream<QuerySnapshot<StudentModel>> getData() {
    return _firebaseService.studentref.snapshots();
  }

  addStudent(StudentModel student) async {
    await _firebaseService.studentref.add(student);
    notifyListeners();
  }

  updateStudent(id, StudentModel student) async {
    await _firebaseService.studentref.doc(id).update(student.toJson());
    notifyListeners();
  }

  deleteStudent(id) async {
    await _firebaseService.studentref.doc(id).delete();
    notifyListeners();
  }
}
