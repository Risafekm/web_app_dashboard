// ignore_for_file: unused_local_variable, avoid_print, body_might_complete_normally_nullable, use_build_context_synchronously

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

// firebase signIn

Future<User?> signIn(BuildContext context,
    {required String email, required String password}) async {
  try {
    User? user = (await auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
  } catch (e) {
    log('error $e');
    return null;
  }
}

// firebase SignOut

Future signOut() async {
  try {
    await auth.signOut();
  } catch (e) {
    log('error $e');
  }
}
