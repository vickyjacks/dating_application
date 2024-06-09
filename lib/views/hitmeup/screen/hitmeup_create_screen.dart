import 'package:datingapp/common/toast.dart';
import 'package:datingapp/views/hitmeup/provider/hitmeup_provider.dart';
import 'package:datingapp/views/location/provider/location_provider.dart';
import 'package:datingapp/views/location/screen/placeholder_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:datingapp/common/button.dart';
import 'package:provider/provider.dart';

class CreateHitMeUpScreen extends StatefulWidget {
  const CreateHitMeUpScreen({super.key});

  @override
  State<CreateHitMeUpScreen> createState() => CreateHitMeUpScreenState();
}

class CreateHitMeUpScreenState extends State<CreateHitMeUpScreen> {
  TextEditingController fromController = TextEditingController();
  bool showSourcefield = false;
  DateTime _currentdate = DateTime.now();
  Future<void> _datechange(BuildContext context) async {
    final DateTime? _datechange = await showDatePicker(
        context: context,
        initialDate: _currentdate,
        // firstDate: DateTime(2001),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025));
    if (_datechange != null) {
      setState(() {
        _currentdate = _datechange;
      });
    }
  }

  TimeOfDay _time = const TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  String dropDownValue = '5';
  var locationRangeList = [
    '5',
    '10',
    '15',
    '20',
  ];

  @override
  Widget build(BuildContext context) {
    String formatDate = DateFormat.yMMMd().format(_currentdate);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(_currentdate);
    var time = _time.format(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer2<HitMeUpProvider, LocationProvider>(
      builder: (context, hitMeUpProvider, locationProvider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.10,
                child: Row(
                  children: [
                    Ink(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Colors.white30,
                              width: 1,
                            )),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: const Color.fromRGBO(233, 64, 87, 1),
                        iconSize: 15,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(233, 64, 87, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Hit me up for a  ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: hitMeUpProvider.hitMeUpCategoryName,
                            style: const TextStyle(
                              color: Color(0xFFE94057),
                              fontSize: 24,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "This section contains basic details",
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: SizedBox(
                  height: height * 0.58,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Title",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: hitMeUpProvider.titleController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText:
                                      "Hit me up for a ${hitMeUpProvider.hitMeUpCategoryName}",
                                  border: InputBorder.none,
                                  hintStyle: const TextStyle(
                                      color: Color(0xffCFCFCF))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Date",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    width: width / 2 - 25,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.white30,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10),
                                      child: InkWell(
                                        onTap: () {
                                          _datechange(context);
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              formatDate,
                                              style: const TextStyle(
                                                  color: Color(0xffCFCFCF),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16),
                                            ),
                                            const Spacer(),
                                            const Icon(Icons.date_range,
                                                size: 20, color: Colors.white),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Time",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    width: width / 2 - 25,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.white30,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: InkWell(
                                        onTap: () {
                                          _selectTime();
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              ' ${_time.format(context)}',
                                              style: const TextStyle(
                                                  color: Color(0xffCFCFCF),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16),
                                            ),
                                            const Spacer(),
                                            const Icon(
                                                Icons.watch_later_outlined,
                                                size: 20,
                                                color: Colors.white),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Location",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 0, right: 10),
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 20),
                            child: searchLocationContainer(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const SearchLocationScreen()));
                            },
                                locationProvider.searchAddress.isEmpty
                                    ? 'From Your Location'
                                    : locationProvider.searchAddress),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: const Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Location Range",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: width - 30,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 0),
                            child: DropdownButton(
                              dropdownColor: Colors.grey,
                              underline: Container(color: Colors.red),
                              isExpanded: true,
                              // Initial Value
                              value: dropDownValue,
                              style: const TextStyle(color: Color(0xffCFCFCF)),
                              // Down Arrow Icon

                              icon: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 2),
                                    child: Icon(
                                      Icons.arrow_drop_up,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  )
                                ],
                              ),

                              // Array list of items
                              items: locationRangeList.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                  ),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? Value) {
                                setState(() {
                                  dropDownValue = Value!;
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20, bottom: 5),
                          child: Row(
                            children: [
                              Text(
                                "${hitMeUpProvider.hitMeUpCategoryName} Details",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          //margin: EdgeInsets.only(top: 5),
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: hitMeUpProvider.detailsController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText:
                                      "Please write here ${hitMeUpProvider.hitMeUpCategoryName} details",
                                  border: InputBorder.none,
                                  hintStyle: const TextStyle(
                                      color: Color(0xffCFCFCF))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //  color: Colors.grey,
                ),
              ),
            ],
          ),
          bottomNavigationBar: NewCustomButton(
              isLoading: hitMeUpProvider.createHitMeUpLoading,
              onPressed: () async {
                if (hitMeUpProvider.titleController.text == '') {
                  CommonToast.toastErrorMessage(
                      "Please enter ${hitMeUpProvider.hitMeUpCategoryName} title");
                } else if (locationProvider.searchAddress == '') {
                  CommonToast.toastErrorMessage(
                      "Please enter ${hitMeUpProvider.hitMeUpCategoryName} location");
                } else if (hitMeUpProvider.detailsController.text == '') {
                  CommonToast.toastErrorMessage(
                      "Please enter ${hitMeUpProvider.hitMeUpCategoryName} details");
                } else {
                  final response = await hitMeUpProvider.createHitMeUpApi(
                      formatted,
                      time,
                      dropDownValue,
                      locationProvider.searchAddress);

                  if (response["status"] == true) {
                    CommonToast.toastSuccessMessage(response["message"]);
                    if (context.mounted) Navigator.of(context).pop();
                  }
                }
              },
              title: "Create",
              height: 45,
              width: 220),

          // bottomNavigationBar:  Padding(
          //     padding: const EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 10),
          //     child: Container(
          //       height: 60,
          //       child: Consumer<HitMeUpProvider>(builder: (context,hitMeUpProvider,child){
          //         return hitMeUpProvider.isLoading ? const Center(child: CircularProgressIndicator()): Center(
          //           child: NormalButton(onPressed: (){
          //             if(hitMeUpProvider.titleController.text==''){
          //               Utils.toastErrorMessage("Please enter ${hitMeUpProvider.hitMeUpCategory} title");
          //             }
          //             else if(locationProvider.searchAddress==''){
          //               Utils.toastErrorMessage("Please enter ${hitMeUpProvider.hitMeUpCategory} location");
          //             }
          //             else if(hitMeUpProvider.detailsController.text==''){
          //               Utils.toastErrorMessage("Please enter ${hitMeUpProvider.hitMeUpCategory} details");
          //             }
          //             else{
          //               hitMeUpProvider.createHitMeUpProvider(context,formatted, time, dropDownValue);
          //             }
          //           }, title: "CREATE", height: 45.5, width: width),
          //         );
          //       },),
          // )  ),
        );
      },
    );
  }

  Widget searchLocationContainer(Function() onTap, String buttonText) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 5, bottom: 4),
        child: Row(children: [
          const Icon(
            Icons.location_on_rounded,
            color: Color(0xFFE94057),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              buttonText,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.white),
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 1,
            ),
          )
        ]),
      ),
    );
  }
}
