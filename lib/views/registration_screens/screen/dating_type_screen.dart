
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../common/loader.dart';
import '../../../common/toast.dart';
import '../../../config/routes/route_name.dart';
import '../provider/auth_provider.dart';

class DatingTypeScreen extends StatefulWidget {
  const DatingTypeScreen({super.key});
  @override
  State<DatingTypeScreen> createState() => DatingTypeScreenState();
}

class DatingTypeScreenState extends State<DatingTypeScreen> {
  int dateValue = 0;
  int bffValue = 0;
  String date = '';
  String bff = '';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 0),
              child: Ink(
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 0),
              child: Text(
                  "",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
              ),
            ),
          ],
        ), //<Widget>[]
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 30),
              child: Row(
                children: [
                  Text(
                    "Looking for",
                    style:TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400)
                  ),
                  const SizedBox(width: 10,),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Icon(Icons.search_rounded,color: Colors.red,size: 40,),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: height * 0.07,
            // color: Colors.red,
          ),
          SizedBox(
            height: height * 0.45,
            child: Wrap(
              spacing: 8,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ChoiceChip(
                    checkmarkColor: Colors.white,
                    backgroundColor: dateValue == 1 ? Colors.red : Colors.black,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: dateValue == 1 ? Colors.red : Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    label: SizedBox(
                      height: 35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Date",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    selected: dateValue == 1,
                    selectedColor: const Color.fromRGBO(229, 67, 97, 1),
                    labelStyle: TextStyle(
                      color: dateValue == 1 ? Colors.white : Colors.black,
                    ),
                    onSelected: (isSelected) {
                      setState(() {
                        dateValue = isSelected ? 1 : 0;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ChoiceChip(
                    checkmarkColor: Colors.white,
                    backgroundColor: bffValue == 2 ? Colors.red : Colors.black,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: bffValue == 2 ? Colors.red : Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    label: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "BFF",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    selected: bffValue == 2,
                    selectedColor: const Color.fromRGBO(229, 67, 97, 1),
                    labelStyle: TextStyle(
                      color: bffValue == 2 ? Colors.white : Colors.black,
                    ),
                    onSelected: (isSelected) {
                      setState(() {
                        bffValue = isSelected ? 2 : 0;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),

          // Container(
          //   height: height * 0.05,
          //   // color: Colors.red,
          // ),
          // SizedBox(
          //     height: height * 0.20,
          //     // color: Colors.grey,
          //     child: Consumer<AuthenticationProvider>(
          //       builder: (context, authProvider, child) {
          //         return authProvider.isLoading
          //             ? const Center(
          //             child: CircularProgressIndicator(
          //               color: Color.fromRGBO(218, 74, 64, 1),
          //               strokeWidth: 5,
          //             ))
          //             : Center(
          //           child: CircleButton(
          //             onPressed: () async {
          //               if (bffValue == 2) {
          //                 bff = "Bff";
          //               } if (bffValue == 0) {
          //                 bff = "";
          //               } if(dateValue == 1){
          //                 date = "Date";
          //               } if(dateValue == 0){
          //                 date = "";
          //               }
          //               if(dateValue>0 || bffValue > 0){
          //                  await authProvider.userDatingTypeProvider(context, date, bff);
          //                 if (authProvider.userDatingTypeData['status'] == true) {
          //                   materialPageRoute(context, const AboutScreen());
          //                 }
          //             }else{
          //                 Utils.toastErrorMessage("please select your dating type");
          //               }
          //             },
          //             // loading: user_details_view_model.loading.value,
          //           ),
          //         );
          //       },
          //     )),
        ],
      ),
        bottomNavigationBar: Consumer<AuthProvider>(
          builder: (context,provider,child){
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
                      onTap: ()async{
                        if (bffValue == 2) {
                          bff = "Bff";
                        } if (bffValue == 0) {
                          bff = "";
                        } if(dateValue == 1){
                          date = "Date";
                        } if(dateValue == 0){
                          date = "";
                        }
                        if(dateValue>0 || bffValue > 0){
                       final response = await provider.datingTypePostApi(date, bff);
                          if(response["status"]==true){
                           if(context.mounted) Navigator.pushReplacementNamed(context, RoutesName.aboutScreen);
                          }else{
                            CommonToast.toastErrorMessage(response["message"]);
                          }
                        }else{
                          CommonToast.toastErrorMessage("please select your dating type");
                        }
                      },
                      child: Center(
                        child: provider.datingTypeLoading ? CommonLoader.animLoader() : const Text(
                            "Continue",
                            style: TextStyle(
                              fontFamily: "Outfit",
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )
                        ),
                      ),
                    ),
                  )
              ),
            );
          },
        )
    );
  }
}
