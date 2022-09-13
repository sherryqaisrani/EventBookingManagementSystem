import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../controllers/register_controller.dart';
import '../widgets/custom_Button.dart';
import '../widgets/custom_Textfield.dart';
import '../widgets/social_custom_button.dart';
import 'login_Screen.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  googleLogin() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var result = await _googleSignIn.signIn();
      print(result!.displayName);
      print(result.email);
      print(result.photoUrl);
    } catch (error) {
      print(error);
    }
  }

  facebookLogin() async {
    print("FaceBook");
    try {
      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        print(userData);
      }
    } catch (error) {
      print(error);
    }
  }

  registerHere() async {
    String response = await Get.find<RegisterController>().registerUser(
        name: nameController.text,
        email: emailController.text.trim(),
        password: passwordController.text);

    if (response == "success") {
      Get.snackbar('Message', 'Register Successfully Please Login');
      Get.offAll(Login());
    } else {
      Get.snackbar('Message', 'Please try again later');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff04a4a4),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(250))),
        child: Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: ListView(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Center(
                  child: Text(
                    'WAZAA',
                    // 'WAZAA',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff04a4a4)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Color(0xff04a4a4), fontSize: 30),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'User Name',
                            style: TextStyle(color: Color(0xff04a4a4)),
                          ),

                          CusTomTextFormField(
                              hintTxt: 'Enter Name',
                              obscure: false,
                              controller: nameController,
                              suffixIcon: Icons.person),

                          const SizedBox(
                            height: 20,
                          ),

                          const Text(
                            'Email Address',
                            style: TextStyle(color: Color(0xff04a4a4)),
                          ),

                          CusTomTextFormField(
                              hintTxt: 'Enter Email Address',
                              obscure: false,
                              controller: emailController,
                              suffixIcon: Icons.email_outlined),

                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(color: Color(0xff04a4a4)),
                          ),
                          CusTomTextFormField(
                              hintTxt: 'Enter Password',
                              obscure: true,
                              controller: passwordController,
                              suffixIcon: null),
                          // CusTomTextFormField(
                          //     hintTxt: 'Enter Password',
                          //     passwordTxt: true,
                          //     suffixIcon: Icons.remove_red_eye_outlined),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Re-Enter Password',
                            style: TextStyle(color: Color(0xff04a4a4)),
                          ),
                          CusTomTextFormField(
                              hintTxt: 'Enter Password',
                              obscure: true,
                              controller: confirmPassword,
                              suffixIcon: null),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: InkWell(
                                onTap: () => registerHere(),
                                child: CustomButton(
                                  textColor: Colors.white,
                                  bgColor: Color(0xff04a4a4),
                                  borderColor: Color(0xff04a4a4),
                                  buttonTitle: 'Sign Up',
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: facebookLogin,
                                child: SocialCustomButton(
                                  borderColor: Colors.blue,
                                  bgColor: Colors.white,
                                  textColor: Colors.blue,
                                  imgIcon: 'assets/images/fb_icon.png',
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: googleLogin,
                                child: SocialCustomButton(
                                  borderColor: Colors.red,
                                  bgColor: Colors.white,
                                  textColor: Colors.red,
                                  imgIcon: 'assets/images/google_icon.png',
                                ),
                              )
                            ],
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Center(
                      child: RichText(
                    text: const TextSpan(
                        text: "Already have an account ? ",
                        style:
                            TextStyle(color: Color(0xff04a4a4), fontSize: 13),
                        children: [
                          TextSpan(
                              text: "Please Sign In",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black))
                        ]),
                  )),
                )
              ],
            )),
      ),
    );
  }
}
