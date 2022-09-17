import 'package:eventbookingmanagement/screens/custom_Bottom_tabbar.dart';
import 'package:eventbookingmanagement/screens/home_screen.dart';
import 'package:eventbookingmanagement/screens/signup.dart';
import 'package:eventbookingmanagement/utils/app_files.dart';
import 'package:eventbookingmanagement/widgets/custom_Textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../widgets/custom_Button.dart';
import '../widgets/social_custom_button.dart';
import 'disclaimer_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> loginUser() async {
    String response = await Get.find<LoginController>().loginUser(
        email: emailController.text, password: passwordController.text);

    if (response == 'success') {
      Get.snackbar('Message', 'You Have Successfully Login');
      Get.offAll(Disclaimer());
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff04a4a4),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(250))),
        child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
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
                    'Login',
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
                            'Email Address',
                            style: TextStyle(color: Color(0xff04a4a4)),
                          ),
                          CusTomTextFormField(
                              hintTxt: 'Enter Email',
                              obscure: false,
                              controller: emailController,
                              suffixIcon: Icons.email),
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
                          // CheckboxListTile(
                          //   activeColor: const Color(0xff04a4a4),
                          //   title: const Text(
                          //     "Remember my password",
                          //     style: TextStyle(
                          //         color: Color(0xff04a4a4), fontSize: 15),
                          //   ),
                          //   value: checkedValue,
                          //   onChanged: (newValue) {
                          //     setState(() {
                          //       checkedValue = newValue!;
                          //     }
                          //     );
                          //   },
                          //   controlAffinity: ListTileControlAffinity
                          //       .leading, //  <-- leading Checkbox
                          // ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: InkWell(
                                onTap: () {
                                  //print('axsa');
                                  loginUser();
                                },
                                child: CustomButton(
                                  textColor: Colors.white,
                                  bgColor: const Color(0xff04a4a4),
                                  borderColor: const Color(0xff04a4a4),
                                  buttonTitle: 'Login',
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: null,
                                child: SocialCustomButton(
                                  borderColor: Colors.blue,
                                  bgColor: Colors.white,
                                  textColor: Colors.blue,
                                  imgIcon: AppFiles.fb_icon,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: null,
                                child: SocialCustomButton(
                                  borderColor: Colors.red,
                                  bgColor: Colors.white,
                                  textColor: Colors.red,
                                  imgIcon: AppFiles.google_icon,
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
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  child: Center(
                      child: RichText(
                    text: const TextSpan(
                        text: "Don't have an account ? ",
                        style:
                            TextStyle(color: Color(0xff04a4a4), fontSize: 13),
                        children: [
                          TextSpan(
                              text: "Register first",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black))
                        ]),
                  )),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomBottomTabbar(),
                      ),
                    );
                  },
                  child: Center(
                      child: RichText(
                    text: const TextSpan(
                        text: "Use As A Guest ",
                        style:
                            TextStyle(color: Color(0xff04a4a4), fontSize: 13),
                        children: [
                          TextSpan(
                              text: "Guest Mode",
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
