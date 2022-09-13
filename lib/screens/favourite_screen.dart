import 'package:eventbookingmanagement/controllers/event_detail_controller.dart';
import 'package:eventbookingmanagement/controllers/favourite_controller.dart';
import 'package:eventbookingmanagement/controllers/get_event_controller.dart';
import 'package:eventbookingmanagement/screens/mail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool checkedValue = false;
    bool isSwitched = false;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: const Image(
          image: AssetImage('assets/images/appicon.png'),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MailScreen()));
              },
              child:
                  const Image(image: AssetImage('assets/images/chat_icon.png')))
        ],
        title: const Text(
          'My Favorite Events',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: GetBuilder<FavouriteController>(builder: (controller) {
            return ListView.builder(
                itemCount: controller.favourtList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(
                        Get.find<EventDetailController>().eventDetail(
                          Get.find<GetEventController>().listEvent[index].id,
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                controller.favourtList[index].coverImage
                                    .toString(),
                              ),
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          InkWell(
                            onTap: () => controller.addFavourt(
                              controller.favourtList[index],
                            ),
                            child: Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 5,
                            child: PopupMenuButton(
                                icon: const Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: CheckboxListTile(
                                          activeColor: const Color(0xff04a4a4),
                                          title: const Text(
                                            "Add Calender",
                                            style: TextStyle(
                                                color: Color(0xff04a4a4),
                                                fontSize: 15),
                                          ),
                                          value: checkedValue,
                                          onChanged: (newValue) {
                                            // setState(() {
                                            //   checkedValue = newValue!;
                                            // });
                                          },
                                          controlAffinity: ListTileControlAffinity
                                              .leading, //  <-- leading Checkbox
                                        ),
                                      ),
                                      PopupMenuItem(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: Row(
                                            children: [
                                              // Switch(
                                              //   value: isSwitched,
                                              //   onChanged: (value) {
                                              //     setState(() {
                                              //       isSwitched = value;
                                              //       print(isSwitched);
                                              //     });
                                              //   },
                                              //   activeTrackColor: Colors.grey,
                                              //   activeColor:
                                              //       const Color(0xff04a4a4),
                                              // ),
                                              const Text(
                                                'Reminder',
                                                style: TextStyle(
                                                    color: Color(0xff04a4a4)),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ]),
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 8, right: 8),
                          child: Text(
                            controller.favourtList[index].eventName.toString(),
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey[600]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Image(
                                          image: AssetImage(
                                              'assets/images/location_icon.png')),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width: 159,
                                        child: Text(
                                          controller
                                              .favourtList[index].eventAddress
                                              .toString(),
                                          // 'Gore Du Mudi',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 13,
                                              color: Colors.grey[600]),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Image(
                                          image: AssetImage(
                                              'assets/images/time_icon.png')),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        controller.favourtList[index].startDate
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 13,
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.grey[600]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Image(
                                          image: AssetImage(
                                              'assets/images/time_icon.png')),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        controller.favourtList[index].endDate
                                            .toString(),
                                        // '10 AM to 04 PM',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey[600]),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Image(
                                          image: AssetImage(
                                              'assets/images/tag.png')),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '\$${controller.favourtList[index].price}',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey[600]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Divider(
                            height: 2,
                            thickness: 2,
                          ),
                        )
                      ],
                    ),
                  );
                });
          })),
    );
  }
}
