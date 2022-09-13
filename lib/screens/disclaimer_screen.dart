import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import 'custom_Bottom_tabbar.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 20),
        child: Column(
          children: [
            Center(
                child: Image(
              image: AssetImage('assets/images/disclaimer.png'),
            )),
            SizedBox(
              height: 20,
            ),
            Text(
              'Disclaimer',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff04a4a4),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("you are experiencing a brand New App concept \n"
                  "This is a beta version that we keep on improving before bringing you the official WAZAA version \n"
                  "We need you to offer the most successful application possible. therefore, do not hesitate to send us your feedback via the section profile/help center \n"
                  "Whether positive or negative, it will help us improve and propose you a great final version. \n"
                  "Thank you for testing WAZAA & we hope you will enjoy!"),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomBottomTabbar()));
                  },
                  child: CustomButton(
                    textColor: Colors.white,
                    bgColor: Color(0xff04a4a4),
                    borderColor: Color(0xff04a4a4),
                    buttonTitle: 'Agree',
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
