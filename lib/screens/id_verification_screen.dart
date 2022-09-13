import 'package:eventbookingmanagement/widgets/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class IdVerificationScreen extends StatelessWidget {
  IdVerificationScreen({super.key});

  final List<String> items = [
    'USA',
    'UK',
    'France',
    'Pakistan',
  ];

  String? selectedValue;

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
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Choose an ID Type',
                style: TextStyle(fontSize: 17),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Expanded(
                    child: Text(
                      'Country/Region',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    // setState(() {
                    //   selectedValue = value as String;
                    // });
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.black54,
                  ),
                  iconSize: 30,
                  iconEnabledColor: Colors.black,
                  iconDisabledColor: Colors.grey,
                  buttonHeight: 50,
                  buttonWidth: 160,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                    ),
                    color: Colors.white,
                  ),
                  // buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  // dropdownMaxHeight: 200,
                  // dropdownWidth: 200,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  // dropdownElevation: 8,
                  // scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  // offset: const Offset(20, 0),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Passport'),
                  // Radio(
                  //   fillColor: MaterialStateColor.resolveWith(
                  //       (states) => Color(0xff04a4a4)),
                  //   activeColor: Color(0xff04a4a4),
                  //   value: IdType.passport,
                  //   groupValue: _verifyType,
                  //   onChanged: (IdType? value) {
                  //     setState(() {
                  //       _verifyType = value!;
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Identity Card'),
                  // Radio(
                  //   fillColor: MaterialStateColor.resolveWith(
                  //           (states) => Color(0xff04a4a4)),
                  //   activeColor: Color(0xff04a4a4),
                  //   value: IdType.identityCard,
                  //   groupValue: _verifyType,
                  //   onChanged: (IdType? value) {
                  //     setState(() {
                  //       _verifyType = value!;
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My ID Type isn't installed"),
                  // Radio(
                  //   fillColor: MaterialStateColor.resolveWith(
                  //           (states) => Color(0xff04a4a4)),
                  //   activeColor: Color(0xff04a4a4),
                  //   value: IdType.myIdTypeIsNotInstalled,
                  //   groupValue: _verifyType,
                  //   onChanged: (IdType? value) {
                  //     setState(() {
                  //       _verifyType = value!;
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
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
                      // Navigator.push(context, MaterialPageRoute(builder: ((context) => DocumentUploadScreen())));
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: CustomButton(
                        buttonTitle: "Continue",
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
