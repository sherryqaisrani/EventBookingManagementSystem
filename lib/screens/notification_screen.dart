import 'package:eventbookingmanagement/widgets/rating_screen.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Notification',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListView.builder(itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: const Color(0xffd1e6f5),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text('Today'),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0xffeff5fa),
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xfff9f9f9),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const Image(
                                  width: 90,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/tech.jpg')),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Les Mise'rables",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                            Row(
                              children: const [
                                Image(
                                    image: AssetImage(
                                        'assets/images/calender_icon.png')),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '28 May 2022',
                                  style: TextStyle(color: Colors.black38),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Image(
                                    image: AssetImage(
                                        'assets/images/location_icon.png')),
                                SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    "Anglet-ChambreD'Amour",
                                    style: TextStyle(color: Colors.black38),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RatingScreen()));
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0xffeff5fa),
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xfff9f9f9),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      ),
                      title: const Text(
                          'We release new version of our app, Update this app and enjoy new functionality'),
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0xffeff5fa),
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xfff9f9f9),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const Image(
                                  width: 90,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/tech.jpg')),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Les Mise'rables",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                            Row(
                              children: const [
                                Image(
                                    image: AssetImage(
                                        'assets/images/calender_icon.png')),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '28 May 2022',
                                  style: TextStyle(color: Colors.black38),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Image(
                                    image: AssetImage(
                                        'assets/images/location_icon.png')),
                                SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    "Anglet-ChambreD'Amour",
                                    style: TextStyle(color: Colors.black38),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          );
        }),
      ),
    );
  }
}
