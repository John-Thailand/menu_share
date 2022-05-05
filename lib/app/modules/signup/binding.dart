import 'package:get/get.dart';
import 'package:getx_todo_list/app/modules/signup/controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SignUpController(),
    );
  }
}
