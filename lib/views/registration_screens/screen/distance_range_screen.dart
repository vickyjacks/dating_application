import 'package:datingapp/config/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../common/loader.dart';
import '../../../common/toast.dart';
import '../provider/auth_provider.dart';

class DistanceRangeScreen extends StatefulWidget {
  const DistanceRangeScreen({super.key});
  @override
  State<DistanceRangeScreen> createState() => _DistanceRangeScreenState();
}

class _DistanceRangeScreenState extends State<DistanceRangeScreen> {
  int distance = 10;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // title: Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(left: 0, top: 0),
          //       child: Ink(
          //         decoration: ShapeDecoration(
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10),
          //               side: const BorderSide(
          //                 color: Colors.white30,
          //                 width: 1,
          //               )),
          //         ),
          //         child: IconButton(
          //           icon: const Icon(Icons.arrow_back_ios),
          //           color: const Color.fromRGBO(233, 64, 87, 1),
          //           iconSize: 15,
          //           onPressed: () => Navigator.pop(context),
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 15, top: 0),
          //       child: Text(
          //           "",
          //           style: GoogleFonts.outfit(
          //             textStyle:  const TextStyle(
          //               fontSize: 22,
          //               color: Colors.white,
          //             ),
          //           )
          //       ),
          //     ),
          //   ],
          // ),
          backgroundColor: Colors.black,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 30),
                    child: Text("Your Distance \nPreference?", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text("Use the slider to set the maximum distance you would like potential matched to be located.", style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.10,
            ),
            SizedBox(
              height: height * 0.15,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Row(
                      children: [
                        const Text(
                          "Distance Preference",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18.0,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "${distance.toString()} Km",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Slider(
                      inactiveColor: Colors.white,
                      thumbColor: const Color.fromRGBO(229, 67, 97, 1),
                      activeColor: const Color.fromRGBO(218, 74, 64, 1),
                      label: "Select Distance Range",
                      value: distance.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          distance = value.toInt();
                        });
                      },
                      min: 5,
                      max: 100,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: height * 0.15,
            // ),
            // SizedBox(
            //   height: height * 0.20,
            //   child: Center(
            //     child: Consumer<AuthenticationProvider>(
            //         builder: (context, authProvider, child) {
            //       return authProvider.isLoading
            //           ? const Center(
            //               child: CircularProgressIndicator(
            //               color: Color.fromRGBO(218, 74, 64, 1),
            //               strokeWidth: 5,
            //             ))
            //           : NormalButton(
            //               onPressed: () async {
            //                 await authProvider.userDistanceRangeProvider(
            //                     context,  distance);
            //                 if (authProvider.userDistanceRangeData['status'] == true) {
            //                    materialPageRoute(context, MainScreen());
            //                  // materialPageRoute(context, const MainScreen());
            //                 }
            //               },
            //               title: "Continue",
            //               height: 50.0,
            //               width: MediaQuery.of(context).size.width / 2);
            //     }),
            //   ),
            // ),
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
                    final response = await provider.distanceRangePostApi(distance);
                    if (response['status'] == true) {
                     if(context.mounted) Navigator.pushReplacementNamed(context, RoutesName.mainScreen);
                    } else {
                      CommonToast.toastErrorMessage(response['message']);
                    }
                  },
                  child: Center(
                    child: provider.distanceRangeLoading
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
