import 'package:eventbookingmanagement/screens/id_verification_screen.dart';
import 'package:eventbookingmanagement/widgets/custom_Button.dart';
import 'package:flutter/material.dart';

class BecomeVerifiedScreen extends StatelessWidget {
  const BecomeVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff04a4a4),
          ),
        ),
        actions: [Image(image: AssetImage('assets/images/appicon.png'))],
        title: Text(
          'Identity Verification',
          style: TextStyle(color: Colors.grey[600]),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please Add Your ID',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'amit minim mollit non deserunt ullamco est site aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                  style: TextStyle(color: Colors.grey[600]),
                )
              ],
            ),
            Align(
                alignment: Alignment.center,
                child: Image(
                  image:
                      AssetImage('assets/images/account_verification_img.png'),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Image(image: AssetImage('assets/images/Lock.png')),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 300,
                          child: Text(
                            'We take steps to help ensure this info stays private',
                            style: TextStyle(fontSize: 13),
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Divider(),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => IdVerificationScreen())));
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: CustomButton(
                        buttonTitle: "Add on ID",
                        textColor: Colors.white,
                        bgColor: Colors.black54,
                        borderColor: Colors.black54,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
