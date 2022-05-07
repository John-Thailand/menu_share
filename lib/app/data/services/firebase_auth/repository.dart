import 'package:getx_todo_list/app/data/models/user.dart';
import 'package:getx_todo_list/app/data/providers/firebase_auth/provider.dart';

class FirebaseAuthRepository {
  FirebaseAuthProvider firebaseAuthProvider;
  FirebaseAuthRepository({required this.firebaseAuthProvider});

  Future<User?> createUserWithEmailAndPassword(
          {required String email, required String password}) async =>
      await firebaseAuthProvider.createUserWithEmailAndPassword(
          email, password);
}
