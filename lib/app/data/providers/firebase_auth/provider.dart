import 'package:get/get.dart';
import 'package:getx_todo_list/app/data/models/user.dart';
import 'package:getx_todo_list/app/data/services/firebase_auth/services.dart';

class FirebaseAuthProvider {
  final FirebaseAuthService _firebaseAuthService =
      Get.find<FirebaseAuthService>();

  // List<Task> readTasks() {
  //   var tasks = <Task>[];
  //   jsonDecode(_storage.read(taskKey).toString())
  //       .forEach((e) => tasks.add(Task.fromJson(e)));
  //   return tasks;
  // }

  // void writeTasks(List<Task> tasks) {
  //   _storage.write(taskKey, jsonEncode(tasks));
  // }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    User? user;
    final userCredential = await _firebaseAuthService
        .createUserWithEmailAndPassword(email, password);
    if (userCredential != null) {
      user = User.fromUser(userCredential.user!);
    }
    return user;
  }
}
