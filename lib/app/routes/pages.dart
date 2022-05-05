import 'package:get/get.dart';
import 'package:getx_todo_list/app/modules/login/view.dart';
import 'package:getx_todo_list/app/modules/signup/binding.dart';
import 'package:getx_todo_list/app/modules/signup/view.dart';
import 'package:getx_todo_list/app/modules/welcome/view.dart';
import 'package:getx_todo_list/app/routes/routes.dart';

List<GetPage> getPages() {
  return [
    GetPage(name: Routes.welcome, page: () => const WelcomePage()),
    GetPage(name: Routes.login, page: () => const LoginPage()),
    GetPage(
        name: Routes.signup,
        page: () => const SignUpPage(),
        binding: SignUpBinding()),
  ];
}
