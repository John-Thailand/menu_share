import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FirebaseAuthService extends GetxService {
  // late GetStorage _box;
  // Future<StorageService> init() async {
  //   _box = GetStorage();
  //   await _box.writeIfNull(taskKey, []);
  //   // await _box.write(taskKey, []);
  //   return this;
  // }

  // T read<T>(String key) {
  //   return _box.read(key);
  // }

  // void write(String key, dynamic value) async {
  //   await _box.write(key, value);
  // }

  Future<UserCredential?> createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // https://pub.dev/documentation/firebase_auth/latest/firebase_auth/User/linkWithCredential.html
      // //debugPrint('FirebaseAuthException ${e.code} ${e.message}');
      switch (e.code) {
        case 'email-already-in-use':
          await EasyLoading.showError(
              'The email address is already registered');
          break;
        case 'invalid-email':
          await EasyLoading.showError('Invalid email address');
          break;
        case 'operation-not-allowed':
          await EasyLoading.showError('Operation not allowed');
          break;
        case 'weak-password':
          await EasyLoading.showError('The password is not strong enough');
          break;
        default:
          await EasyLoading.showError(
              'An internal error has occurred\nPlease register an account after a while');
          break;
      }
    } catch (e) {
      await EasyLoading.showError(
          'An internal error has occurred\nPlease register an account after a while');
    }
    return userCredential;
  }
}
