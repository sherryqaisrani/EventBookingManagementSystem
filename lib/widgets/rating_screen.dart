import 'package:eventbookingmanagement/widgets/custom_Button.dart';
import 'package:flutter/material.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        title: const Text(
          "Les Mise'rables",
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ListView(
          children: [
            ListTile(
              leading: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle),
              ),
              title: const Text(
                'Ahsan Iqbal',
                style: TextStyle(fontSize: 17),
              ),
              subtitle: const Text('Posting Publicity'),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.star,
                  size: 40,
                  color: Colors.orange,
                ),
                Icon(
                  Icons.star,
                  size: 40,
                  color: Colors.orange,
                ),
                Icon(
                  Icons.star,
                  size: 40,
                  color: Colors.orange,
                ),
                Icon(
                  Icons.star,
                  size: 40,
                  color: Colors.orange,
                ),
                Icon(
                  Icons.star,
                  size: 40,
                  color: Colors.orange,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Describe your experience (optional)",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                  minLines: 6,
                  // any number you need (It works as the rows for the textarea)
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CustomButton(
                    textColor: Colors.white,
                    buttonTitle: 'Post',
                    borderColor: const Color(0xff04a4a4),
                    bgColor: const Color(0xff04a4a4),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
