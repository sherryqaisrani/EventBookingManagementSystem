import 'package:get/get.dart';

import '../services/api_services.dart';

class RegisterController extends GetxController {
  final ApiServices apiServices;

  RegisterController({required this.apiServices});

  Future<String> registerUser(
      {required final name,
      required final email,
      required final password}) async {
    String message = 'success';
    final response = await apiServices.register({
      'name': name,
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      return message;
    } else {
      return message = 'Not working';
      print('So SAd Errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    }
  }
}
