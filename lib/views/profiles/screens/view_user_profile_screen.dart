 import 'package:datingapp/common/loader.dart';
import 'package:datingapp/views/profiles/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart'; 
import 'package:intl/intl.dart';
import 'package:provider/provider.dart'; 
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShowUserDetailsScreen extends StatefulWidget {
  final String UserId;
  const ShowUserDetailsScreen({super.key, required this.UserId});
  @override
  ShowUserDetailsScreenState createState() => ShowUserDetailsScreenState();
}

class ShowUserDetailsScreenState extends State<ShowUserDetailsScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;
  String imageBaseUrl = "https://dostanaa.in/public/upload/";
  String imageBaseUrl2 = "https://dostanaa.in/public/gallery/";
    @override
  void initState() {
    super.initState(); 
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileProvider>(context, listen: false).fetchRecieverUserProfileDetailApi(); 
    });
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<ProfileProvider>(
          builder: (context, provider, child) {
            return provider.fetchUserProfileDetailLoading
                ? CommonLoader.animLoader()
                : Scaffold(
                   backgroundColor: Colors.black,
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: height * 0.50,
                              child: PageView.builder(
                                controller: _controller,
                                itemCount: provider.fetchReciverUserProfileDetailsModel.data!.userImage.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          imageBaseUrl + provider.fetchReciverUserProfileDetailsModel.data!.userImage[index].image,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                  // child: Image.network(imageBaseUrl+provider.fetchEvenDetailsDataModel.data.bannerImage[index],fit: BoxFit.cover,));
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 40),
                              child: Card(
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                      color: Colors.white30,
                                      width: 2,
                                    )),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.red,
                                  ),
                                  color: const Color.fromRGBO(233, 64, 87, 1),
                                  iconSize: 15,
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SmoothPageIndicator(
                                controller: _controller,
                                count: provider.fetchReciverUserProfileDetailsModel.data!.userImage.length,
                                effect: const WormEffect(
                                  activeDotColor: Colors.red,
                                  dotColor: Colors.grey,
                                  dotHeight: 10,
                                  dotWidth: 10,
                                  type: WormType.thinUnderground,
                                ),
                              ),
                            ],
                            // children: List.generate(provider.fetchSwipeUserDetailsDataModel.data.image.length, (index) {
                            //   return buildIndicator(index);
                            // }),
                          ),
                        ),
                        Container(
                          height: 40,
                          padding: EdgeInsets.only(left: width * 0.10, right: width * 0.10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.cake_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                " ${provider.fetchReciverUserProfileDetailsModel.data!.age}",
                                style:  const TextStyle(color: Colors.white, fontSize: 16),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 24,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                provider.fetchReciverUserProfileDetailsModel.data!.gender,
                                style:  const TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                          child: Row(
                            children: [
                              Text(
                                provider.fetchReciverUserProfileDetailsModel.data!.name,
                                style:  const TextStyle(color: Colors.white, fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "About",
                                style:   TextStyle(color: Colors.white),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                          child: (provider.fetchReciverUserProfileDetailsModel.data!.about == '')
                              ? const Row(
                                  children: [
                                    Text(
                                      "Not Updated",
                                      style:  TextStyle(color: Colors.white70),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                )
                              : Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "${provider.fetchReciverUserProfileDetailsModel.data!.about}",
                                    style:   const TextStyle(color: Colors.white70),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            children: [
                              Text(
                                provider.fetchReciverUserProfileDetailsModel.data!.dob,
                                style:   const TextStyle(color: Colors.white70, fontSize: 14),
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
                              const Text(
                                "Passion",
                                style:  TextStyle(color: Colors.white, fontSize: 18),
                              ),
                              Container(
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.all(0),
                                  child: GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 30, childAspectRatio: 80, crossAxisSpacing: 0, mainAxisSpacing: 10),
                                    itemCount: provider.fetchReciverUserProfileDetailsModel.data!.userInterest.length,
                                    primary: false,
                                    shrinkWrap: true,
                                    itemBuilder: (BuildContext context, int index) {
                                      String img = '';
                                      String interest = provider.fetchReciverUserProfileDetailsModel.data!.userInterest[index].interest;
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
                                              provider.fetchReciverUserProfileDetailsModel.data!.userInterest[index].interest,
                                              style: const TextStyle(fontFamily: "Mulish", fontWeight: FontWeight.w600, fontSize: 12, color: Colors.white),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
         ,
                ); },
        );
  }
}
