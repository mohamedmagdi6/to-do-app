import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/models/user_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (task, _) {
        return task.toJson();
      },
    );
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection('Users')
        .withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (user, options) {
        return user.toJson();
      },
    );
  }

  static Future<void> addUsers(UserModel userModel) {
    var userCollection = getUserCollection();
    var doc = userCollection.doc(userModel.id);
    return doc.set(userModel);
  }

  static Future<void> addTask(TaskModel task) {
    var collection = getCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime date) {
    var collection = getCollection();
    return collection
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('date',
            isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<UserModel?> getUser() async {
    DocumentSnapshot<UserModel> docRef = await getUserCollection()
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    return docRef.data();
  }

  static Future<void> delete(String task) {
    var collection = getCollection();

    return collection.doc(task).delete();
  }

  static Future<void> isDone(TaskModel task) {
    var collection = getCollection();
    return collection.doc(task.id).update({'isDone': task.isDone});
  }

  static Future<void> edit(TaskModel task) {
    var collection = getCollection();
    return collection.doc(task.id).update(
        {'title': task.title, 'subTitle': task.subTitle, 'date': task.date});
  }

  static createAccount(
      {required String emailAddress,
      required String password,
      required String userName,
      required String phone,
      required Function onSucsses,
      required Function onError}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      var id = FirebaseAuth.instance.currentUser!.uid;
      UserModel userModel = UserModel(phone: phone, userName: userName, id: id);
      addUsers(userModel);

      onSucsses();
    } on FirebaseAuthException catch (e) {
      onError(e);
    } catch (e) {
      onError(e.toString());
    }
  }

  static login(String emailAddress, String password,
      {required Function onSucsses, required Function onError}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      onSucsses();
    } on FirebaseAuthException catch (e) {
      onError(e);
    }
  }
}
