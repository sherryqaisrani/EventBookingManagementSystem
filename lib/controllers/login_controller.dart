import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/loginUser_modal.dart';
import '../services/api_services.dart';

class LoginController extends GetxController {
  final ApiServices apiServices;

  var list = [];

  LoginController({required this.apiServices});

  Future<String> loginUser(
      {required final email, required final password}) async {
    String message = 'success';
    final response =
        await apiServices.login({'email': email, 'password': password});

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());
      list = [];
      SharedPreferences sharedP = await SharedPreferences.getInstance();

      // sharedP.remove('userToken');
      sharedP.setString('userToken', map['token']);

      print(sharedP.getString('userToken'));

      list.add(User.fromJson(map));
      return message;
    } else {
      return message = 'Not Working';
      print('Login Not Working................. So SAd');
    }
  }
}
