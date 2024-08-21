import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/firebase_functions.dart';
import 'package:to_do_app/models/user_model.dart';

class CacheCurrentUserProvider extends ChangeNotifier {
  User? currentUser;
  UserModel? userModel;

  getuser() {
    currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      getUserModel();
    }
  }

  getUserModel() async {
    userModel = await FirebaseFunctions.getUser();
    notifyListeners();
  }
}
