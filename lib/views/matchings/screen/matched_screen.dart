import 'package:datingapp/views/matchings/provider/matching_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../const/color.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  LikesPageState createState() => LikesPageState();
}

class LikesPageState extends State<MatchesScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<MatchingProvider>(context, listen: false).fetchMatchingSwipeUserListApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String imgUrlPath = "https://dostanaa.in/public/upload/";
    return Consumer<MatchingProvider>(builder: (context, provider, child) {
      return provider.fetchMatchingSwipeLoading
          ? Scaffold(
              backgroundColor: Colors.black,
              body: Shimmer.fromColors(
                  baseColor: Colors.red.shade100,
                  highlightColor: Colors.red.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 20,
                          width: 150,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 20,
                          width: width,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          color: Colors.red,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 200,
                              width: width / 2 - 25,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                            ),
                            const Spacer(),
                            Container(
                              height: 200,
                              width: width / 2 - 25,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 200,
                              width: width / 2 - 25,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                            ),
                            const Spacer(),
                            Container(
                              height: 200,
                              width: width / 2 - 25,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            )
          : Scaffold(
              backgroundColor: Colors.black,
              body: Column(
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),
                  const SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 0,
                            left: 20,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Matches",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 0),
                          child: Text(
                            "This is a list of people who have liked you and your matches.",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Row(children: [
                          Expanded(
                              child: Divider(
                            thickness: 2,
                            color: Colors.grey,
                            indent: 20,
                            endIndent: 10,
                          )),
                          Text(
                            "Latest",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 2,
                            color: Colors.grey,
                            indent: 10,
                            endIndent: 20,
                          )),
                        ]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(bottom: 0),
                        primary: true,
                        shrinkWrap: true,
                        itemCount: provider.fetchSwipeMatchedUserListModel.data.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          mainAxisExtent: 270,
                        ),
                        itemBuilder: (_, index) {
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: height / 4,
                                    width: width / 2,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(imgUrlPath + provider.fetchSwipeMatchedUserListModel.data[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${provider.fetchSwipeMatchedUserListModel.data[index].name}, ",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              provider.fetchSwipeMatchedUserListModel.data[index].age,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () async {
                                      SharedPreferences pref = await SharedPreferences.getInstance();
                                      String? userId = pref.getString('userId');
                                      // materialPageRoute(context, UserChatConversionScreen(
                                      //   userId: userId,
                                      //   receiverId: data.data[index].getUserId.toString(),
                                      //   img: data.data[index].image,
                                      //   name: data.data[index].name,
                                      //   callId:data.data[index].room_id.toString(),
                                      //   roomID : data.data[index].room_id.toString(),
                                      // )
                                      // );
                                    },
                                    child: Container(
                                        width: ((width - 15) / 2) / 2 - 10,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade900,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.chat,
                                          color: Colors.red,
                                        )),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () async {
                                      SharedPreferences pref = await SharedPreferences.getInstance();
                                      String? userId = pref.getString('userId');
                                      // materialPageRoute(context, UserChatConversionScreen(
                                      //   userId: userId,
                                      //   receiverId: data.data[index].getUserId.toString(),
                                      //   img: data.data[index].image,
                                      //   name: data.data[index].name,
                                      //   callId:data.data[index].room_id.toString(),
                                      //   roomID : data.data[index].room_id.toString(),
                                      // )
                                      // );
                                    },
                                    child: Container(
                                        width: ((width - 15) / 2) / 2 - 10,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade900,
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.chat,
                                          color: Colors.red,
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          );
                          // return Stack(
                          //   children: [
                          //     Container(
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           image: DecorationImage(
                          //               image: NetworkImage(imgUrlPath +
                          //                   provider.fetchSwipeMatchedUserListModel.data[index].image),
                          //               fit: BoxFit.cover)),
                          //     ),
                          //     // Padding(
                          //     //     padding: EdgeInsets.only(top: 10),
                          //     //     child: InkWell(
                          //     //         onTap: ()async{
                          //     //           await Provider.of<HitMeUpProvider>(context,listen: false).showUserDetailsDataProvider(context,data.data[index].getUserId);
                          //     //           materialPageRoute(context, ShowUserDetailsScreen(UserId:data.data[index].getUserId));
                          //     //         },
                          //     //         child: Icon(Icons.preview,color: Colors.white,))),
                          //     Padding(
                          //       padding:
                          //       const EdgeInsets.only(top: 160, left: 5),
                          //       child: Row(
                          //         children: [
                          //           Text(
                          //             "${provider.fetchSwipeMatchedUserListModel.data[index].name}, ",
                          //             style: const TextStyle(
                          //               color: Colors.white,
                          //               fontSize: 16,
                          //               fontWeight: FontWeight.bold,
                          //             ),
                          //           ),
                          //           const SizedBox(width: 5,),
                          //           Text(
                          //             provider.fetchSwipeMatchedUserListModel.data[index].age,
                          //             style: const TextStyle(
                          //               color: Colors.white,
                          //               fontSize: 16,
                          //               fontWeight: FontWeight.bold,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     Container(
                          //       width: (width - 15) / 2,
                          //       height: 250,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           gradient: LinearGradient(
                          //               colors: [
                          //                 AppColor.kBlack.withOpacity(0.25),
                          //                 AppColor.kBlack.withOpacity(0),
                          //               ],
                          //               end: Alignment.topCenter,
                          //               begin: Alignment.bottomCenter)),
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.end,
                          //         children: [
                          //           Row(
                          //             mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //             children: [
                          //               Container(
                          //                   width: ((width - 15) / 2) / 2 -
                          //                       10,
                          //                   height: 50,
                          //                   decoration: const BoxDecoration(
                          //                     color: Colors.black54,
                          //                   ),
                          //                   child: InkWell(
                          //                     onTap: () async {
                          //                       // await AwesomeDialog(
                          //                       //     context: context,
                          //                       //     dialogType: DialogType.warning,
                          //                       //     borderSide: const BorderSide(color: Colors.red, width: 2,),
                          //                       //     width: MediaQuery.of(context).size.width,
                          //                       //     buttonsBorderRadius: const BorderRadius.all(Radius.circular(2),),
                          //                       //     dismissOnTouchOutside: true,
                          //                       //     dismissOnBackKeyPress: false,
                          //                       //     headerAnimationLoop: false,
                          //                       //     animType: AnimType.bottomSlide,
                          //                       //     title: "Are Your Sure Delete ",
                          //                       //     desc: "This data is deleted your found match",
                          //                       //     showCloseIcon: true,
                          //                       //     btnCancelOnPress: () {
                          //                       //       // Navigator.pop(context);
                          //                       //     },
                          //                       //     btnOkOnPress: () async {
                          //                       //       await Provider.of<MatchedProvider>(context,listen: false).userMatchedDeletedProvider(context,data.data[index].getUserId);
                          //                       //     }).show();
                          //                     },
                          //                     child: const Icon(
                          //                       Icons.close_rounded,
                          //                       color: Colors.red,
                          //                     ),
                          //                   )),
                          //               const Spacer(),
                          //               GestureDetector(
                          //                 onTap: ()async{
                          //                   SharedPreferences pref = await SharedPreferences.getInstance();
                          //                   String? userId = pref.getString('userId');
                          //                   // materialPageRoute(context, UserChatConversionScreen(
                          //                   //   userId: userId,
                          //                   //   receiverId: data.data[index].getUserId.toString(),
                          //                   //   img: data.data[index].image,
                          //                   //   name: data.data[index].name,
                          //                   //   callId:data.data[index].room_id.toString(),
                          //                   //   roomID : data.data[index].room_id.toString(),
                          //                   // )
                          //                   // );
                          //                 },
                          //                 child: Container(
                          //                     width: ((width - 15) / 2) / 2 -
                          //                         10,
                          //                     height: 50,
                          //                     decoration: const BoxDecoration(
                          //                       color: Colors.black54,
                          //                     ),
                          //                     child: const Icon(
                          //                       Icons.chat,
                          //                       color: Colors.red,
                          //                     )),
                          //               ),
                          //             ],
                          //           )
                          //         ],
                          //       ),
                          //     )
                          //   ],
                          // );
                        }),
                  )
                ],
              ),
            );
    });
  }
}
