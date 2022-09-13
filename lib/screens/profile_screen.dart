import 'package:eventbookingmanagement/controllers/image_picker_controller.dart';
import 'package:eventbookingmanagement/controllers/logout_controller.dart';
import 'package:eventbookingmanagement/screens/become_verified_screen.dart';
import 'package:eventbookingmanagement/screens/booking_screen.dart';
import 'package:eventbookingmanagement/widgets/custom_Button.dart';
import 'package:eventbookingmanagement/widgets/tages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<ImagePickerController>(builder: (controller) {
              return Container(
                height: 130,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/bg_profile.png'))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(children: [
                        controller.imageURL != null
                            ? Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image(
                                    image: MemoryImage(controller.imageURL!),
                                  ),
                                ))
                            : Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: const Icon(
                                  Icons.person,
                                  size: 90,
                                  color: Color(0xff04a4a4),
                                ),
                              ),
                        Positioned(
                          bottom: 3,
                          right: 3,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Wrap(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.imagePicker(
                                                ImageSource.gallery);
                                          },
                                          child: const ListTile(
                                            leading: Icon(Icons.camera),
                                            title: Text('Camera'),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.imagePicker(
                                                ImageSource.gallery);
                                          },
                                          child: const ListTile(
                                            leading: Icon(Icons.image),
                                            title: Text('Gallery'),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 17,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        )
                      ])
                    ],
                  ),
                ),
              );
            }),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15.0, top: 30, bottom: 15),
                child: Image(
                  height: 50,
                  image: AssetImage('assets/images/verified_img.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Show others you're really you with the identity verification badge",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BecomeVerifiedScreen()));
                },
                child: CustomButton(
                  bgColor: Colors.white,
                  borderColor: Colors.black,
                  buttonTitle: 'Become Verified',
                  textColor: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookingScreen()));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const ListTile(
                      leading: Image(
                        image: AssetImage('assets/images/booking_icon.png'),
                      ),
                      title: Text("My Booking"),
                    )),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExpansionTile(
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  title: const Text('Personal Information'),
                  leading: const Image(
                    image: AssetImage('assets/images/personal_info_img.png'),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: ListTile(
                            title: Text(
                              'Name',
                              style: TextStyle(color: Colors.grey),
                            ),
                            subtitle: Text(
                              'Charlotte Ave',
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: Icon(
                              Icons.person,
                              color: Color(0xff04a4a4),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: ListTile(
                            title: Text(
                              'Email',
                              style: TextStyle(color: Colors.grey),
                            ),
                            subtitle: Text(
                              'charlotte.ave@gmail.com',
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: Icon(
                              Icons.email_outlined,
                              color: Color(0xff04a4a4),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: ListTile(
                            title: Text(
                              'Phone',
                              style: TextStyle(color: Colors.grey),
                            ),
                            subtitle: Text(
                              '012345667',
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: Icon(
                              Icons.phone,
                              color: Color(0xff04a4a4),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: ListTile(
                            title: Text(
                              'Date of birth',
                              style: TextStyle(color: Colors.grey),
                            ),
                            subtitle: Text(
                              '29/08/1998',
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: Icon(
                              Icons.calendar_today,
                              color: Color(0xff04a4a4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExpansionTile(
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  title: const Text('Interest'),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 10),
                          child: Wrap(
                              // space between chips
                              spacing: 5,
                              // list of chips
                              children: [
                                Tags(
                                  textLable: 'Popular',
                                  bgCol: const Color(0xff04a4a4),
                                ),
                                Tags(
                                  bgCol: Colors.white,
                                  textLable: 'Culture',
                                ),
                                Tags(
                                  textLable: 'Sports',
                                  bgCol: Colors.white,
                                ),
                                Tags(
                                    textLable: "Food & Drink",
                                    bgCol: const Color(0xff04a4a4)),
                                Tags(textLable: 'Music', bgCol: Colors.white),
                                Tags(
                                    textLable: 'FAmily',
                                    bgCol: const Color(0xff04a4a4))
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExpansionTile(
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  title: const Text('Settings'),
                  children: [
                    const Divider(
                      height: 2,
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Image(
                                              image: AssetImage(
                                                  'assets/images/language_icon.png')),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text('Language'),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [const Text('English')],
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 30.0, right: 8, bottom: 10),
                              child: Divider(
                                thickness: 2,
                                height: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Image(
                                              image: AssetImage(
                                                  'assets/images/currency_icon.png')),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text('Currency'),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [const Text('Euros')],
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 30.0, right: 8, bottom: 10),
                              child: Divider(
                                thickness: 2,
                                height: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Image(
                                              image: AssetImage(
                                                  'assets/images/notification_icon.png')),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text('Notification'),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 30.0, right: 8, bottom: 10),
                              child: Divider(
                                thickness: 2,
                                height: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExpansionTile(
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  title: const Text('Information'),
                  children: [
                    const Divider(
                      height: 2,
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Image(
                                              image: AssetImage(
                                                  'assets/images/help_icon.png')),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text('Help Center'),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 30.0, right: 8, bottom: 10),
                              child: Divider(
                                thickness: 2,
                                height: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(left: 30.0),
                                            child: Text('About us'),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 30.0, right: 8, bottom: 10),
                              child: Divider(
                                thickness: 2,
                                height: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Get.find<LogoutController>().logout();
                },
                child: CustomButton(
                    textColor: Colors.white,
                    bgColor: const Color(0xff04a4a4),
                    borderColor: const Color(0xff04a4a4),
                    buttonTitle: 'Log Out'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
