import 'package:eventbookingmanagement/controllers/create_event_controller.dart';
import 'package:eventbookingmanagement/controllers/image_upload_controller.dart';
import 'package:eventbookingmanagement/screens/custom_Bottom_tabbar.dart';
import 'package:eventbookingmanagement/widgets/custom_Textfield.dart';
import 'package:eventbookingmanagement/widgets/custom_button.dart';
import 'package:eventbookingmanagement/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

enum EventType { public, private }

class CreateEvent extends StatefulWidget {
  CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  TextEditingController textControllerForEventName = TextEditingController();

  TextEditingController textControllerForAddress = TextEditingController();

  TextEditingController textControllerForNumberOfAttendance =
      TextEditingController();

  TextEditingController textControllerForPrice = TextEditingController();

  TextEditingController textControllerForStartDate = TextEditingController();

  TextEditingController textControllerForEndDate = TextEditingController();

  TextEditingController textControllerForDescription = TextEditingController();

  TextEditingController textControllerForStartTime = TextEditingController();

  TextEditingController textControllerForEndTime = TextEditingController();

  String dropdownvalue = 'Sports';

  // List of items in our dropdown menu
  var items = [
    'Sports',
    'Music',
    'Festivals',
  ];
  late EventType _verifyType = EventType.public;

  // bool checkedValue = false;
  bool isSwitched = false;
  final _formKey = GlobalKey<FormState>();
  String? path;
  String? pathBack;

  Uint8List? _imageURL;

  selectedImage() async {
    Uint8List imageURL = await pickImage(
      ImageSource.camera,
    );
    setState(() {
      _imageURL = imageURL;
    });
  }

  uploadData() async {
    String response = await Get.find<CreateEventController>().uploadEvent(
      eventName: textControllerForEventName.text,
      eventAddress: textControllerForAddress.text,
      numberOfAttendres: textControllerForNumberOfAttendance.text,
      price: textControllerForPrice.text,
      startDate: textControllerForStartDate.text,
      endDate: textControllerForEndDate.toString(),
      description: textControllerForDescription.text,
      image: Get.find<UploadImageController>().listImage[0].imageUrl,
    );
    if (response == 'success') {
      Get.snackbar(
        "Wait...",
        "Creating Your Event",
        dismissDirection: DismissDirection.horizontal,
        isDismissible: true,
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 1),
      );
      Get.offAll(() => CustomBottomTabbar());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'create events',
          style: const TextStyle(fontSize: 18, color: Colors.black87),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xff04a4a4),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Form(
                  child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,

                        // Initial Value
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CusTomTextFormField(
                    obscure: false,
                    controller: textControllerForEventName,
                    hintTxt: 'Name Of Event',
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  CusTomTextFormField(
                    obscure: false,
                    controller: textControllerForAddress,
                    hintTxt: 'Address',
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  CusTomTextFormField(
                    obscure: false,
                    controller: textControllerForNumberOfAttendance,
                    hintTxt: 'Maximum Number Of Attendres',
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  CusTomTextFormField(
                    obscure: false,
                    controller: textControllerForPrice,
                    hintTxt: 'Price',
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  CusTomTextFormField(
                    obscure: false,
                    controller: textControllerForStartDate,
                    hintTxt: 'Start Date',
                    pressed: () => callCalender(textControllerForStartDate),
                    suffixIcon: Icons.calendar_month,
                  ),
                  // StreamBuilder<String>(
                  //     stream: manager.allDayTime$,
                  //     builder: (context, snapshot) {
                  //       return CustomTextField(
                  //         controller: textControllerForStartDate,
                  //         onChanged1: (value) {
                  //           manager.inAllDayTime.add(value);
                  //         },
                  //         iconData: Icons.calendar_month,
                  //         onPressed: () =>
                  //             callCalender(textControllerForStartDate),
                  //         passwordTxt: false,
                  //         hintTxt: 'Start Date',
                  //       );
                  //     }),
                  const SizedBox(
                    height: 10,
                  ),
                  CusTomTextFormField(
                    obscure: false,
                    controller: textControllerForEndDate,
                    hintTxt: 'End Date',
                    pressed: () => callCalender(textControllerForEndDate),
                    suffixIcon: Icons.calendar_month,
                  ),
                  // StreamBuilder<String>(
                  //     stream: manager.allDayTime$,
                  //     builder: (context, snapshot) {
                  //       return CustomTextField(
                  //         controller: textControllerForEndDate,
                  //         onChanged1: (value) {
                  //           manager.inAllDayTime.add(value);
                  //         },
                  //         iconData: Icons.calendar_month,
                  //         onPressed: () =>
                  //             callCalender(textControllerForEndDate),
                  //         passwordTxt: false,
                  //         hintTxt: 'End Date',
                  //       );
                  //     }),
                  const SizedBox(
                    height: 10,
                  ),
                  CusTomTextFormField(
                    obscure: false,
                    controller: textControllerForDescription,
                    hintTxt: 'Description',
                  ),
                  // StreamBuilder<String>(
                  //     stream: manager.allDayTime$,
                  //     builder: (context, snapshot) {
                  //       return CustomTextField(
                  //         controller: textControllerForDescription,
                  //         onChanged1: (value) {
                  //           manager.inAllDayTime.add(value);
                  //         },
                  //         passwordTxt: false,
                  //         hintTxt: 'Description',
                  //       );
                  //     }),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () => selectedImage(),
                    child: _imageURL != null
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image: MemoryImage(_imageURL!),
                                  )),
                            ),
                          )
                        : uploadEventImageContainer(
                            discriptionText: 'Take Picture'),
                  ),
                  InkWell(
                    onTap: () async {
                      Get.find<UploadImageController>()
                          .uploadImage(image: _imageURL!);
                      // List<Media>? res = await ImagesPicker.openCamera(
                      //   // pickType: PickType.video,
                      //   pickType: PickType.image,
                      //   quality: 0.8,
                      //   maxSize: 800,
                      //   // cropOpt: CropOption(
                      //   //   aspectRatio: CropAspectRatio.wh16x9,
                      //   // ),
                      //   maxTime: 15,
                      // );
                      // print(res);
                      // if (res != null) {
                      //   print(res[0].path);
                      //   setState(() {
                      //     path = res[0].thumbPath;
                      //   });
                      // }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: CustomButton(
                          buttonTitle: 'Upload Image',
                          bgColor: Colors.black54,
                          borderColor: Colors.black54,
                          textColor: Colors.white),
                    ),
                  ),
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: InkWell(
                onTap: () => uploadData(),
                child: CustomButton(
                    buttonTitle: 'Publish Event',
                    bgColor: const Color(0xffFDC500),
                    borderColor: const Color(0xffFDC500),
                    textColor: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }

  callTime(TextEditingController controller) async {
    TimeOfDay? pickedTime = await showTimePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                background: Colors.black,
                primary: Colors.amberAccent, // <-- SEE HERE
                onPrimary: Colors.black, // <-- SEE HERE
                onSurface: Colors.blue,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.black, // button text color
                ),
              )),
          child: child!,
        );
      },
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      String formattedTime = "${pickedTime.hour}:${pickedTime.minute}";
      setState(() {
        controller.text = formattedTime;
      });
    } else {}
  }

  callCalender(TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.amberAccent, // <-- SEE HERE
                  onPrimary: Colors.black, // <-- SEE HERE
                  onSurface: Colors.blueAccent,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: Colors.black, // button text color
                  ),
                )),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      String formattedDate =
          DateFormat('yyyy-MM-dd hh:mm:ss').format(pickedDate);

      setState(() {
        controller.text = formattedDate;
      });
    } else {}
  }

  Widget uploadEventImageContainer({required String discriptionText}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: const BoxDecoration(
                color: Color(0xffe5eaea),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Image(
                    image: AssetImage('assets/images/Upload_light.png'),
                  ),
                  Text(discriptionText),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
