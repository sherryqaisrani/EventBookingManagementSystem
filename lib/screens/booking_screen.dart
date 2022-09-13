import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          title: Text(
            'My Bookings',
            style: TextStyle(color: Colors.grey[600]),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Color(0xff04a4a4),
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: 'Upcoming',
              ),
              Tab(
                text: 'Previous',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Image(
                                    width: 90,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/images/tech.jpg'),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 2,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 160,
                                          child: Text(
                                            'Beach Ruby Festival',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                  'assets/images/calender_icon.png'),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              '28 Jul 2022',
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                  'assets/images/location_icon.png'),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Container(
                                              width: 160,
                                              child: Text(
                                                "Anglet-Chambre D'Amoure",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             EventDetailScreen(
                                              //               indexOfIndex: 0,
                                              //             )));
                                            },
                                            child: Icon(
                                                Icons.keyboard_arrow_right))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              );
            }),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/images/cuate.png')),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'No Record Found',
                  style: TextStyle(fontSize: 20, color: Colors.black45),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
