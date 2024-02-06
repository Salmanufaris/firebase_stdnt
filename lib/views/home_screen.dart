import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_student/controller/add_provider.dart';
import 'package:firebase_student/controller/home_provider.dart';
import 'package:firebase_student/model/student_model.dart';
import 'package:firebase_student/views/add_screen.dart';
import 'package:firebase_student/views/detail_screen.dart';
import 'package:firebase_student/views/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<AddEditProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Students List",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Consumer<HomeProvider>(builder: (context, donorValue, child) {
        return StreamBuilder<QuerySnapshot<StudentModel>>(
          stream: donorValue.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              log("${snapshot.error}");
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            List<QueryDocumentSnapshot<StudentModel>> donatorDocs =
                snapshot.data?.docs ?? [];
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: donatorDocs.length,
              itemBuilder: (context, index) {
                StudentModel donor = donatorDocs[index].data();
                final id = donatorDocs[index].id;
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Detail(student: donor)));
                  },
                  child: Card(
                    color: Colors.grey,
                    child: ListTile(
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  shodeletebox(context, id);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditScreen(
                                                id: id,
                                                student: donor,
                                              )));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                        title: Text(
                          donor.name ?? ''.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        subtitle: Text(
                          donor.age ?? '',
                          style: const TextStyle(color: Colors.white),
                        )),
                  ),
                );
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.grey,
          onPressed: () {
            pro.clearTextFields();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddScreen()));
          },
          label: const Text(
            "Add",
            style: TextStyle(),
          )),
    );
  }

  Future<void> shodeletebox(BuildContext context, id) async {
    final pro = Provider.of<HomeProvider>(context, listen: false);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choose an option"),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                pro.deleteStudent(id);
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
