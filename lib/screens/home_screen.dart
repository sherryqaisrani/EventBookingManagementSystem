import 'package:eventbookingmanagement/controllers/event_detail_controller.dart';
import 'package:eventbookingmanagement/controllers/favourite_controller.dart';
import 'package:eventbookingmanagement/controllers/get_event_controller.dart';
import 'package:eventbookingmanagement/controllers/search_controller.dart';
import 'package:eventbookingmanagement/screens/custome_mark.dart';
import 'package:eventbookingmanagement/screens/login_Screen.dart';
import 'package:eventbookingmanagement/screens/mail_screen.dart';
import 'package:eventbookingmanagement/screens/map_screen.dart';
import 'package:eventbookingmanagement/utils/app_files.dart';
import 'package:eventbookingmanagement/widgets/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController textInputForSearch = TextEditingController();

  Future<void> loadinData() async {
    String response = await Get.find<SearchController>().searchEvent(
      eventName: textInputForSearch.text,
    );
    if (response == 'success') {
      Get.snackbar(
        "",
        "Searching.......",
        dismissDirection: DismissDirection.horizontal,
        isDismissible: true,
        backgroundColor: const Color(0xff04a4a4),
        duration: const Duration(seconds: 1),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SearchController(apiServices: Get.find()));
    Get.put(EventDetailController(apiServices: Get.find()));
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: Image(
          image: AssetImage(
            AppFiles.app_icoon,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MailScreen(),
                ),
              );
            },
            child: Image(
              image: AssetImage(
                AppFiles.chat_icon,
              ),
            ),
          ),
          InkWell(
              onTap: () async {
                SharedPreferences sharedP =
                    await SharedPreferences.getInstance();

                String? userToken = sharedP.getString('userToken');
                if (userToken == null) {
                  Get.snackbar('Alter', 'Please Login before create event');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                } else {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => CreateEvent()));
                }
              },
              child:
                  const Image(image: AssetImage('assets/images/add_icon.png')))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      onChanged: (value) {},

                      keyboardType: TextInputType.emailAddress,
                      controller: textInputForSearch,
                      // textInputAction: TextInputAction.next,
                      cursorColor: Color(0xff04a4a4),
                      decoration: InputDecoration(
                        hintText: 'Search.....',
                        suffixIcon: InkWell(
                          onTap: () {
                            loadinData();
                          },
                          child: Icon(
                            Icons.search,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xff04a4a4),
                        ),
                        border: InputBorder.none,
                        labelStyle: const TextStyle(
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // setState(() {
                      //   selected_index = index;
                      //   print(index);
                      // });
                      // print('selected index $selected_index');
                    },
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          color:
                              // selected_index == index
                              Color(0xff04a4a4),
                          //  Color(0xffcdebeb),
                          border: Border.all(color: Color(0xff04a4a4)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      margin: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.video_call,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Now',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(height: 10),

          //here statring an other field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'events around you',
              style: TextStyle(fontSize: 25, color: Colors.grey[700]),
            ),
          ),

          // Now Starting Map function
          Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 230,
                    child: CustomeMarker(),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 60,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapScreen()));
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff04a4a4),
                        ),
                        child: const Icon(
                          Icons.pin_drop,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),

          GetBuilder<SearchController>(builder: (value) {
            return Expanded(
              child: value.serach
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: Get.find<SearchController>().searchList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: GetBuilder<SearchController>(
                              builder: (controller) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Stack(children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.network(
                                            controller
                                                .searchList[index].coverImage,
                                          ),
                                          // Image.network(

                                          //   eventList
                                          //       .data[index].coverImage,
                                          //   fit: BoxFit.cover,
                                          //   height: 190,
                                          // )
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, top: 10),
                                            child: Container(
                                              padding: const EdgeInsets.all(3),
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: const Icon(
                                                Icons.favorite,
                                              ),
                                            ))
                                      ]),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .searchList[index].eventName,
                                          // eventList.data[index].eventName
                                          //     .capitalizeFirstofEach,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.pin_drop,
                                              color: Color(0xff04a4a4),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1 /
                                                  2,
                                              child: Text(
                                                controller.searchList[index]
                                                    .eventAddress,
                                                // eventList
                                                //     .data[index]
                                                //     .eventAddress
                                                //     .capitalizeFirstofEach,
                                                // style: TextStyle(fontSize: 17),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.calendar_today,
                                              color: Color(0xff04a4a4),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              getDate(
                                                controller.searchList[index]
                                                    .startDate,
                                              ),
                                              // getDate(eventList
                                              //       .data[index].startDate)
                                              // eventList.data[index].startDate
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.lock_clock,
                                              color: Color(0xff04a4a4),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(getTime(
                                              controller
                                                  .searchList[index].startTime,
                                            )
                                                // getTime(eventList
                                                //     .data[index].startTime),
                                                // eventList.data[index].startTime,
                                                )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              Get.to(Get.find<
                                                      EventDetailController>()
                                                  .eventDetail(controller
                                                      .searchList[index].id));
                                            },
                                            child: CustomButton(
                                              textColor: Colors.black,
                                              bgColor: Color(0xffeccc0c),
                                              borderColor: Color(0xffeccc0c),
                                              buttonTitle: 'Details',
                                            ))
                                        // ListTile(
                                        //   leading: Icon(
                                        //     Icons.pin_drop, color: Color(0xff04a4a4),
                                        //
                                        //   ),
                                        //   title: Text('Center De Congres Bellevue'),
                                        // )
                                      ],
                                    ))
                              ],
                            );
                          }),
                        );
                      })
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          Get.find<GetEventController>().listEvent.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: GetBuilder<GetEventController>(
                              builder: (controller) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Stack(children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.network(
                                            controller
                                                .listEvent[index].coverImage,
                                          ),
                                          // Image.network(

                                          //   eventList
                                          //       .data[index].coverImage,
                                          //   fit: BoxFit.cover,
                                          //   height: 190,
                                          // )
                                        ),
                                        GetBuilder<FavouriteController>(
                                            builder: (favouriteController) {
                                          return InkWell(
                                            onTap: () =>
                                                favouriteController.addFavourt(
                                              controller.listEvent[index],
                                            ),
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, top: 10),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(3),
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white,
                                                  ),
                                                  child: Icon(
                                                    Icons.favorite,
                                                    color: favouriteController
                                                            .favourtList
                                                            .contains(controller
                                                                    .listEvent[
                                                                index])
                                                        ? Colors.red
                                                        : Colors.black,
                                                  ),
                                                )),
                                          );
                                        })
                                      ]),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.listEvent[index].eventName,
                                          // eventList.data[index].eventName
                                          //     .capitalizeFirstofEach,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.pin_drop,
                                              color: Color(0xff04a4a4),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1 /
                                                  2,
                                              child: Text(
                                                controller.listEvent[index]
                                                    .eventAddress,
                                                style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                // eventList
                                                //     .data[index]
                                                //     .eventAddress
                                                //     .capitalizeFirstofEach,
                                                // style: TextStyle(fontSize: 17),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.calendar_today,
                                              color: Color(0xff04a4a4),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              getDate(
                                                controller
                                                    .listEvent[index].startDate,
                                              ),
                                              // getDate(eventList
                                              //       .data[index].startDate)
                                              // eventList.data[index].startDate
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.lock_clock,
                                              color: Color(0xff04a4a4),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(getTime(
                                              controller
                                                  .listEvent[index].startTime,
                                            )
                                                // getTime(eventList
                                                //     .data[index].startTime),
                                                // eventList.data[index].startTime,
                                                )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              Get.to(Get.find<
                                                      EventDetailController>()
                                                  .eventDetail(controller
                                                      .listEvent[index].id));
                                            },
                                            child: CustomButton(
                                              textColor: Colors.black,
                                              bgColor: Color(0xffeccc0c),
                                              borderColor: Color(0xffeccc0c),
                                              buttonTitle: 'Details',
                                            ))
                                        // ListTile(
                                        //   leading: Icon(
                                        //     Icons.pin_drop, color: Color(0xff04a4a4),
                                        //
                                        //   ),
                                        //   title: Text('Center De Congres Bellevue'),
                                        // )
                                      ],
                                    ))
                              ],
                            );
                          }),
                        );
                      }),
            );
          }),
        ],
      ),
    );
  }

  String getDate(String date) {
    if (date.length == 10) {
      date = date + " 18:00:00";
    }
    var now = DateTime.parse(date);
    var formatter = DateFormat('yyyy-MM-dd hh-mm-ss');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  String getTime(String time) {
    var now = DateTime.parse(time);
    var formatter = DateFormat('hh:mm:ss a ');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }
}
