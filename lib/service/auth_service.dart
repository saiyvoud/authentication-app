// ignore_for_file: avoid_print

import 'package:authentication/pages/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print("=====>Login Succesful");
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  Future<void> register({
    required String fullname,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      var user = {
        "fullname": fullname,
        "email": email,
        "password": password,
      };
      await firestore
          .collection("user")
          .doc(value.user!.uid)
          .set(user)
          .then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HomePage()));
      });
    }).catchError((err) {
      print("register error ${err}");
    });
  }
}
