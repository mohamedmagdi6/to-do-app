import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/task_model.dart';

class FirebaseFunctions {
  CollectionReference<TaskModel> getCollection() {
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

  Future<void> addTask(TaskModel task) {
    var collection = getCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }
}
