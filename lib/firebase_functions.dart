import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/task_model.dart';

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

  static Future<void> addTask(TaskModel task) {
    var collection = getCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime date) {
    var collection = getCollection();
    return collection
        .where('date',
            isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
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
}
