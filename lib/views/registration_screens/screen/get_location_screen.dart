import 'package:datingapp/common/loader.dart';
import 'package:datingapp/common/toast.dart';
import 'package:datingapp/config/routes/route_name.dart';
import 'package:datingapp/views/registration_screens/provider/auth_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class GetLocationScreen extends StatefulWidget {
  const GetLocationScreen({super.key});

  @override
  State<GetLocationScreen> createState() => GetLocationScreenState();
}

class GetLocationScreenState extends State<GetLocationScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.25,
            child: Center(
              child: Image.asset(
                "assets/png_img/location_img.png",
                height: 200,
                width: 200,
              ),
            ),
          ),
          const SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0, top: 30),
                  child: Text(
                    "Get Location",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400)
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 0, right: 30),
                  child: Text(
                    "You'll need to enable your location in order to use this app .",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400)
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
          // Container(
          //   height: height * 0.15,
          // ),
          // SizedBox(
          //   height: height * 0.20,
          //   child: Consumer<AuthProvider>(
          //     builder: (context,provider,child){
          //       return Center(
          //         child: Container(
          //           padding: const EdgeInsets.only(left: 15, right: 15),
          //           width: MediaQuery.of(context).size.width/2,
          //           height: 45,
          //           decoration: BoxDecoration(
          //             gradient: const LinearGradient(colors: [
          //               Color.fromRGBO(161, 55, 139, 1),
          //               Color.fromRGBO(218, 74, 64, 1),
          //               Color.fromRGBO(229, 67, 97, 1),
          //             ]),
          //             borderRadius: BorderRadius.circular(30),
          //
          //           ),
          //           child: InkWell(
          //             borderRadius: BorderRadius.circular(30),
          //             onTap: () async {
          //               setState(() {
          //                 _isLoading = true;
          //               });
          //               await provider.requestLocationPermission().then((granted) {
          //                 if (granted) {
          //                   provider.getCurrentLocation().then((position) {
          //                     if (position != null) {
          //                       provider.getCurrentAddress().then((address) async {
          //                         if (address != null) {
          //                           CommonToast.toastSuccessMessage("fetch location");
          //                           provider.setAddress(address.toString());
          //                           provider.setCurrentLocationLatLng(
          //                               position.latitude, position.longitude);
          //                           await provider.postUserLatLngPostApi();
          //                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const DistanceRangeScreen(),),);
          //                         } else {
          //                           debugPrint("Failed to fetch address");
          //                         }
          //                       });
          //                     }
          //                   });
          //                 } else {
          //                   if (kDebugMode) {
          //                     print("failed");
          //                   }
          //                 }
          //               }).whenComplete(() {
          //                 setState(() {
          //                   _isLoading = false;
          //                 });
          //               });
          //             },
          //             child: provider.isLocationLoading ?CommonLoader.animLoader() : Center(
          //               child: Text(
          //                 'Get Location',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 16,
          //                   fontFamily: 'Outfit',
          //                   fontWeight: FontWeight.w600,
          //                 )
          //               ),
          //             ),
          //           )
          //         ),
          //       );
          //     },
          //   )
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
                        setState(() {
                        });
                        await provider.requestLocationPermission().then((granted) {
                          if (granted) {
                            provider.getCurrentLocation().then((position) {
                              if (position != null) {
                                provider.getCurrentAddress().then((address) async {
                                  if (address != null) {
                                    CommonToast.toastSuccessMessage("fetch location");
                                    provider.setAddress(address.toString());
                                    provider.setCurrentLocationLatLng(
                                        position.latitude, position.longitude);
                                    var response = await provider.postUserLatLngPostApi();
                                    if(response["status"]==true){
                                        if(context.mounted) Navigator.pushReplacementNamed(context, RoutesName.distanceRangeScreen);
                                    }else{
                                      CommonToast.toastErrorMessage(response["message"]);
                                    }
                                     } else {
                                    debugPrint("Failed to fetch address");
                                  }
                                });
                              }
                            });
                          } else {
                            if (kDebugMode) {
                              print("failed");
                            }
                          }
                        }).whenComplete(() {
                          setState(() {
                          });
                        });
                      },
                      child: Center(
                        child: provider.isLocationLoading ?CommonLoader.animLoader() :  const Text("Continue",
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
        )
    );
  }

}
