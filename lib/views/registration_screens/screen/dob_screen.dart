import 'package:datingapp/views/registration_screens/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:provider/provider.dart';
import '../../../common/loader.dart';
import '../../../common/toast.dart';
import '../../../config/routes/route_name.dart';

class DOBScreen extends StatefulWidget {
  const DOBScreen({Key? key}) : super(key: key);

  @override
  State<DOBScreen> createState() => _DOBScreenState();
}

class _DOBScreenState extends State<DOBScreen> {
  DateTime? _selectedDate;
  int age = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            SizedBox(
              height: height * 0.10,
              child: const Padding(padding: EdgeInsets.only(left: 15.0)),
            ),
            SizedBox(
              height: height * 0.10,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "Date Of Birth",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.40,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: DatePickerWidget(
                    looping: false, // default is not looping
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                    initialDate: DateTime.now(), // DateTime(1994),
                    dateFormat: "dd/MMMM/yyyy",
                    onChange: (DateTime newDate, _) {
                      setState(() {
                        _selectedDate = newDate;
                        age = DateTime.now().year - _selectedDate!.year;
                      });
                    },
                    pickerTheme: const DateTimePickerTheme(
                      backgroundColor: Colors.transparent,
                      itemTextStyle: TextStyle(color: Colors.white, fontSize: 19),
                      dividerColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.15,
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 35),
                      child: Text(
                        _selectedDate == null ? '' : 'Age  $age',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0, top: 10),
                      child: Text(
                        "This age can't be changed later",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Consumer<AuthProvider>(
          builder: (context, provider, child) {
            return SizedBox(
              height: height * 0.15,
              child: Center(
                  child: Container(
                height: 45,
                width: 220,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(161, 55, 139, 1),
                    Color.fromRGBO(218, 74, 64, 1),
                    Color.fromRGBO(229, 67, 97, 1),
                  ]),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () async {
                    if (age >= 18) {
                      // Proceed only if the user is 18 or older
                      DateTime dateTime = DateTime.parse(_selectedDate.toString());
                      String formattedDOB = DateFormat('yyyy-MM-dd').format(dateTime);
                      final response = await provider.dobPostApi(formattedDOB, age);
                      if (response["status"] == true) {
                        if (context.mounted) Navigator.pushReplacementNamed(context, RoutesName.photosScreen);
                      }
                    } else {
                      // Show an alert or message indicating the user is not old enough
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Error"),
                            content: const Text("You must be at least 18 years old to continue."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Center(
                    child: provider.dobLoading
                        ? CommonLoader.animLoader()
                        : const Text("Continue",
                            style: TextStyle(
                              fontFamily: "Outfit",
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                  ),
                ),
              )),
            );
          },
        ));
  }
}
