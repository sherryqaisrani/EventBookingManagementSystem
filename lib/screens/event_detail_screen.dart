import 'package:eventbookingmanagement/controllers/event_detail_controller.dart';
import 'package:eventbookingmanagement/screens/mail_screen.dart';
import 'package:eventbookingmanagement/widgets/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(() => EventDetailController(apiServices: Get.find()));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(20),
        //   ),
        // ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff04a4a4),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<EventDetailController>(builder: (controller) {
        return ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 240,
                  child: Image.network(
                    controller.listOfEventDetail[0].coverImage.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              ),
                              Text(
                                controller.listOfEventDetail[0].noOfAttendres
                                    .toString(),
                                // '45 people attend',
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Upcoming',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                    right: 10,
                    top: 50,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      width: 40,
                      height: 40,
                      child: const Icon(Icons.favorite_border),
                    )),
                Positioned(
                    left: 10,
                    bottom: 10,
                    child: Text(
                      controller.listOfEventDetail[0].eventName.toString(),
                      // myEvent.eventName,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ))
              ],
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.pin_drop,
                            color: Color(0xff04a4a4),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              controller.listOfEventDetail[0].eventName
                                  .toString(),
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Color(0xff04a4a4),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            getToday(),
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.lock_clock,
                            color: Color(0xff04a4a4),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            getTime(),
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.local_offer_outlined,
                            color: Color(0xff04a4a4),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              controller.listOfEventDetail[0].eventAddress
                                  .toString(),
                              // myEvent.eventAddress,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const PaymentScreen()));
                },
                child: CustomButton(
                  buttonTitle: 'Get Ticket',
                  borderColor: const Color(0xffeccc0c),
                  bgColor: const Color(0xffeccc0c),
                  textColor: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MailScreen()));
                },
                child: CustomButton(
                  buttonTitle: 'Contact',
                  borderColor: Colors.black,
                  bgColor: Colors.white,
                  textColor: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'Organizer',
                style: TextStyle(fontSize: 25, color: Colors.grey[600]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => OrganiserScreen()));
                    },
                    child: const Image(
                        image: AssetImage('assets/images/tech1_img.png'))),
                const SizedBox(
                  width: 10,
                ),
                const Image(image: AssetImage('assets/images/teck2_img.png')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                color: Colors.grey[200],
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Details',
                      style: TextStyle(fontSize: 25, color: Colors.grey[600]),
                    ),
                    Text(
                      controller.listOfEventDetail[0].description.toString(),
                      // myEvent.description.capitalizeFirstofEach,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 10),
              child: Text(
                'people events may you like',
                style: TextStyle(color: Colors.grey[600], fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Stack(children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: const Image(
                                  fit: BoxFit.cover,
                                  height: 190,
                                  width: 150,
                                  image: AssetImage('assets/images/tech.jpg'))),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: const Icon(
                                Icons.favorite,
                              ),
                            )),
                        Positioned(
                            bottom: 10,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.7),
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: 150,
                                child: Text('beach rugoy festivel',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 17))))
                      ]);
                    }),
              ),
            )
          ],
        );
      }),
    );
  }

  String getToday() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  String getTime() {
    var now = new DateTime.now();
    var formatter = new DateFormat('hh:mm:ss a ');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }
}
