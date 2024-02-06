import 'package:flutter/material.dart';

class AddEditProvider extends ChangeNotifier {
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController classsController = TextEditingController();

  TextEditingController subjectController = TextEditingController();

  void clearTextFields() {
    nameController.clear();
    ageController.clear();
    classsController.clear();
    subjectController.clear();
  }
}
