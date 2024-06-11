import 'package:datingapp/config/routes/route_name.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';

import '../../../common/navbar/side/side_navbar_screen.dart';
import '../provider/profile_provider.dart';

class ProfileHomeScreen extends StatefulWidget {
  const ProfileHomeScreen({super.key});

  @override
  State<ProfileHomeScreen> createState() => ProfileHomeScreenState();
}

class ProfileHomeScreenState extends State<ProfileHomeScreen> {
  String imageBaseUrl = "https://dostanaa.in/public/upload/";
  String imageBaseUrl2 = "https://dostanaa.in/public/gallery/";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileProvider>(context, listen: false).fetchUserProfileDetailsApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      endDrawer: const SideNavbarScreen(),
      body: Consumer<ProfileProvider>(
        builder: (context, provider, child) {
          int rdata = 0;
          if (provider.fetchUserProfileDetailsModel.data!.relationship == "single") {
            rdata = 1;
          } else if (provider.fetchUserProfileDetailsModel.data!.relationship == "married") {
            rdata = 2;
          } else if (provider.fetchUserProfileDetailsModel.data!.relationship == "widowed") {
            rdata = 3;
          } else if (provider.fetchUserProfileDetailsModel.data!.relationship == "divorce") {
            rdata = 4;
          }
          return Consumer<ProfileProvider>(builder: (context,provider,child){
            return provider.fetchUserProfileLoading ?  Scaffold(
              backgroundColor: Colors.black,
              body: Shimmer.fromColors(
                  baseColor: Colors.red.shade100,
                  highlightColor: Colors.red.shade300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: height*0.3+40,
                        width: width/2+40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 20,
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
                        width: 150,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 20,
                        width: 180,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                      ),
                      const SizedBox(
                        height:20,
                      ),
                      Container(
                        height: 20,
                        width: 210,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 20,
                        width: 150,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                      ),
                    ],
                  )),
            ): SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      children: [
                        Container(
                          height: height * 0.3 + 50,
                          width: width * 0.7,
                          decoration: const BoxDecoration(
                            // color: Colors.red,
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(161, 55, 139, 1),
                                Color.fromRGBO(218, 74, 64, 1),
                                Color.fromRGBO(229, 67, 97, 1),
                              ]),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                              )),
                          child:  Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              height: height * 0.3,
                              width: width * 0.7 - 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  imageBaseUrl + provider.fetchUserProfileDetailsModel.data!.profilePic,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                        value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 50.0,
                              width: 50,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Color.fromRGBO(161, 55, 139, 1),
                                    Color.fromRGBO(218, 74, 64, 1),
                                    Color.fromRGBO(229, 67, 97, 1),
                                  ]),
                                  borderRadius: BorderRadius.circular(40)),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () {
                                    _scaffoldKey.currentState?.openEndDrawer();
                                  },
                                  child: const Icon(
                                    Icons.menu_open,
                                    color: Colors.white,
                                    size: 40,
                                  )),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 20, right: 0),
                                child: Center(child: Consumer<ProfileProvider>(
                                  builder: (context, provider, child) {
                                    return Container(
                                      height: 40.0,
                                      width: width * 0.20,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(colors: [
                                            Color.fromRGBO(161, 55, 139, 1),
                                            Color.fromRGBO(218, 74, 64, 1),
                                            Color.fromRGBO(229, 67, 97, 1),
                                          ]),
                                          borderRadius: BorderRadius.circular(40)),
                                      child: InkWell(
                                          borderRadius: BorderRadius.circular(50),
                                          onTap: () {
                                            Navigator.pushNamed(context, RoutesName.showFeedScreen);
                                            // provider.fetchFeedDataProvider(context);
                                            // materialPageRoute(context, const ShowFeedScreen());
                                          },
                                          child: const Center(
                                            child: Text(
                                              "Feed",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          )),
                                    );
                                  },
                                ))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      children: [
                        Text(
                          provider.fetchUserProfileDetailsModel.data!.name,
                          style: const TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RoutesName.editProfilePage,arguments: [rdata]);
                              // materialPageRoute(
                              //     context,
                              //     EditProfilePage(
                              //       relationShip: rdata,
                              //       aboutUs: data.data.about.toString(),
                              //     ));
                            },
                            child: const Icon(
                              Icons.edit,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 22,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            "+91 ${provider.fetchUserProfileDetailsModel.data!.phone}",
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.mail,
                          color: Colors.white,
                          size: 22,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          provider.fetchUserProfileDetailsModel.data!.email,
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 18, right: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 5,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                Color.fromRGBO(161, 55, 139, 1),
                                Color.fromRGBO(218, 74, 64, 1),
                                Color.fromRGBO(229, 67, 97, 1),
                              ]),
                              borderRadius: BorderRadius.circular(40)),
                        ),
                        const SizedBox(width: 8,),
                        const Text(
                          "About Me",
                          style:   TextStyle(fontFamily: "Outfit",color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black45,
                          // border: Border.all(color: Colors.grey.shade200,
                          //     width: 0.20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: (provider.fetchUserProfileDetailsModel.data!.about == '')
                                ? const Text(
                              "Not Updated",
                              // userData!.about.toString(),
                              style:   TextStyle(fontFamily: "Outfit",color: Colors.white, fontSize: 12),
                            )
                                : Text(
                              provider.fetchUserProfileDetailsModel.data!.about,
                              // userData!.about.toString(),
                              style:  const TextStyle(fontFamily: "Outfit",color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 5,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                Color.fromRGBO(161, 55, 139, 1),
                                Color.fromRGBO(218, 74, 64, 1),
                                Color.fromRGBO(229, 67, 97, 1),
                              ]),
                              borderRadius: BorderRadius.circular(40)),
                        ),
                        const SizedBox(width: 8,),
                        const Text(
                          "Interests",
                          style:  TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: SingleChildScrollView(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5, childAspectRatio: 3),
                        itemCount: provider.fetchUserProfileDetailsModel.data!.interest.length,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          String img = '';
                          String interest = provider.fetchUserProfileDetailsModel.data!.interest[index].interests;
                          if (interest == "Photography") {
                            img = "assets/svg_img/passion/camera.svg";
                          }
                          if (interest == "Shopping") {
                            img = "assets/svg_img/passion/shopping.svg";
                          }
                          if (interest == "Karaoke") {
                            img = "assets/svg_img/passion/karaoke.svg";
                          }
                          if (interest == "Yoga") {
                            img = "assets/svg_img/passion/yoga.svg";
                          }
                          if (interest == "Cooking") {
                            img = "assets/svg_img/passion/cooking.svg";
                          }
                          if (interest == "Tennis") {
                            img = "assets/svg_img/passion/tennis.svg";
                          }
                          if (interest == "Run") {
                            img = "assets/svg_img/passion/run.svg";
                          }
                          if (interest == "Swimming") {
                            img = "assets/svg_img/passion/swimming.svg";
                          }
                          if (interest == "Art") {
                            img = "assets/svg_img/passion/art.svg";
                          }
                          if (interest == "Traveling") {
                            img = "assets/svg_img/passion/traveling.svg";
                          }
                          if (interest == "Extreme") {
                            img = "assets/svg_img/passion/extreme.svg";
                          }
                          if (interest == "Music") {
                            img = "assets/svg_img/passion/music.svg";
                          }
                          if (interest == "Drink") {
                            img = "assets/svg_img/passion/drink.svg";
                          }
                          if (interest == "Video games") {
                            img = "assets/svg_img/passion/video_games.svg";
                          }
                          return Row(
                            children: [
                              SvgPicture.asset(img.toString()),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.only(),
                                child: Text(
                                  provider.fetchUserProfileDetailsModel.data!.interest[index].interests,
                                  style: const TextStyle(fontFamily: "Mulish", fontWeight: FontWeight.w600, fontSize: 12, color: Colors.white),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15, bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 5,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                Color.fromRGBO(161, 55, 139, 1),
                                Color.fromRGBO(218, 74, 64, 1),
                                Color.fromRGBO(229, 67, 97, 1),
                              ]),
                              borderRadius: BorderRadius.circular(40)),
                        ),
                        const SizedBox(width: 8,),
                        const Text(
                          "Picture",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InkWell(
                            onTap: () {
                              // materialPageRoute(context, UpdatePhotosScreen());
                            },
                            child: const Icon(
                              Icons.edit,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 40),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 10, // Spacing between columns
                        mainAxisSpacing: 10, // Spacing between rows
                        childAspectRatio: 0.8, // Aspect ratio of each grid item (adjust as needed)
                      ),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: provider.fetchUserProfileDetailsModel.data!.image.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // materialPageRoute(
                            //   context,
                            //   PhotoViews(
                            //     image: imageBaseUrl + data.data.image[index].images,
                            //   ),
                            // );
                          },
                          child: SizedBox(
                            height: 160, // Height of each grid item
                            width: width / 2, // Width of each grid item
                            child: Container(
                              margin: const EdgeInsets.only(left: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(imageBaseUrl + provider.fetchUserProfileDetailsModel.data!.image[index].images),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
