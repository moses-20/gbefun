import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  final FirebaseFirestore firestore;
  final String fullName;
  final String company;
  final int age;

  const AddUser({
    Key? key,
    required this.firestore,
    required this.fullName,
    required this.company,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = firestore.collection('users');

    Future<void> addUser() {
      return users
          .add({'full_name': fullName, 'company': company, 'age': age})
          .then(
            (value) => debugPrint('User Added'),
          )
          .catchError(
            (error) => debugPrint('Failed to add user: $error'),
          );
    }

    return TextButton(
      key: const Key('add user button'),
      onPressed: addUser,
      child: const Text("Add User"),
    );
  }
}
