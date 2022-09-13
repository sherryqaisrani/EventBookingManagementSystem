import 'package:eventbookingmanagement/controllers/suggestion_animation_controller.dart';
import 'package:eventbookingmanagement/widgets/animation_progress_bar.dart';
import 'package:eventbookingmanagement/widgets/tages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuggesstionScreen extends StatelessWidget {
  const SuggesstionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQD = MediaQuery.of(context);
    var maxWidth = mediaQD.size.width;
    return GetBuilder<SuggestionAnimationController>(builder: (controller) {
      return Scaffold(
        body: Stack(children: [
          PageView(
            onPageChanged: (i) {
              //index i starts from 0!
              controller.progressAnimcontroller.reset();
              //   _progressAnimcontroller.reset(); //reset the animation first
              controller.setProgressAnim(maxWidth, i + 1);
              //   _setProgressAnim(maxWidth, i + 1);
            },
            children: [
              Stack(children: [
                Image(
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/event1.jpeg')),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 50, right: 20),
                  child: Row(
                    children: [
                      AnimatedProgressBar(
                        animation: controller.progressAnimation,
                      ),
                      Expanded(
                        child: Container(
                          height: 4.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: Colors.cyanAccent),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Les Mise'rables",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.pin_drop,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '3 Km away',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '70 tickets sold',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Wrap(
                              // space between chips
                              spacing: 5,
                              // list of chips
                              children: [
                                Tags(
                                  textLable: 'Theater',
                                  bgCol: Color(0xff04a4a4),
                                ),
                                Tags(
                                  bgCol: Colors.white,
                                  textLable: 'Spactacle',
                                ),
                                Tags(
                                  textLable: 'Intertainment',
                                  bgCol: Colors.white,
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                child: Icon(
                                  Icons.cancel_outlined,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.all(25),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff04a4a4)),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/ticket_icon.png'),
                                  )),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
              Stack(children: [
                Image(
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/event1.jpeg')),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 50, right: 20),
                  child: Row(
                    children: [
                      AnimatedProgressBar(
                        animation: controller.progressAnimation,
                      ),
                      Expanded(
                        child: Container(
                          height: 4.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: Colors.cyanAccent),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Les Mise'rables",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.pin_drop,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '3 Km away',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '70 tickets sold',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Wrap(
                              // space between chips
                              spacing: 5,
                              // list of chips
                              children: [
                                Tags(
                                  textLable: 'Theater',
                                  bgCol: Color(0xff04a4a4),
                                ),
                                Tags(
                                  bgCol: Colors.white,
                                  textLable: 'Spactacle',
                                ),
                                Tags(
                                  textLable: 'Intertainment',
                                  bgCol: Colors.white,
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                child: Icon(
                                  Icons.cancel_outlined,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.all(25),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff04a4a4)),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/ticket_icon.png'),
                                  )),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
              Stack(children: [
                Image(
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/event1.jpeg')),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 50, right: 20),
                  child: Row(
                    children: [
                      AnimatedProgressBar(
                        animation: controller.progressAnimation,
                      ),
                      Expanded(
                        child: Container(
                          height: 4.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: Colors.cyanAccent),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Les Mise'rables",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.pin_drop,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '3 Km away',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '70 tickets sold',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Wrap(
                              // space between chips
                              spacing: 5,
                              // list of chips
                              children: [
                                Tags(
                                  textLable: 'Theater',
                                  bgCol: Color(0xff04a4a4),
                                ),
                                Tags(
                                  bgCol: Colors.white,
                                  textLable: 'Spactacle',
                                ),
                                Tags(
                                  textLable: 'Intertainment',
                                  bgCol: Colors.white,
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                child: Icon(
                                  Icons.cancel_outlined,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.all(25),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff04a4a4)),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/ticket_icon.png'),
                                  )),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
              Stack(children: [
                Image(
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/event1.jpeg')),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 50, right: 20),
                  child: Row(
                    children: [
                      AnimatedProgressBar(
                        animation: controller.progressAnimation,
                      ),
                      Expanded(
                        child: Container(
                          height: 4.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: Colors.cyanAccent),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Les Mise'rables",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.pin_drop,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '3 Km away',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '70 tickets sold',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Wrap(
                              // space between chips
                              spacing: 5,
                              // list of chips
                              children: [
                                Tags(
                                  textLable: 'Theater',
                                  bgCol: Color(0xff04a4a4),
                                ),
                                Tags(
                                  bgCol: Colors.white,
                                  textLable: 'Spactacle',
                                ),
                                Tags(
                                  textLable: 'Intertainment',
                                  bgCol: Colors.white,
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                child: Icon(
                                  Icons.cancel_outlined,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.all(25),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff04a4a4)),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/ticket_icon.png'),
                                  )),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
              Stack(children: [
                Image(
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/event1.jpeg')),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 50, right: 20),
                  child: Row(
                    children: [
                      AnimatedProgressBar(
                        animation: controller.progressAnimation,
                      ),
                      Expanded(
                        child: Container(
                          height: 4.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: Colors.cyanAccent),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Les Mise'rables",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.pin_drop,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '3 Km away',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '70 tickets sold',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Wrap(
                              // space between chips
                              spacing: 5,
                              // list of chips
                              children: [
                                Tags(
                                  textLable: 'Theater',
                                  bgCol: Color(0xff04a4a4),
                                ),
                                Tags(
                                  bgCol: Colors.white,
                                  textLable: 'Spactacle',
                                ),
                                Tags(
                                  textLable: 'Intertainment',
                                  bgCol: Colors.white,
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                child: Icon(
                                  Icons.cancel_outlined,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.all(25),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff04a4a4)),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/ticket_icon.png'),
                                  )),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ],
          ),
        ]),
      );
    });
  }
}
