import 'package:datingapp/common/toast.dart';
import 'package:datingapp/common/loader.dart';
import 'package:datingapp/config/routes/route_name.dart';
import 'package:datingapp/views/hitmeup/provider/hitmeup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/dialog/common_dialogs.dart';

class HitMeUpScreen extends StatefulWidget {
  const HitMeUpScreen({Key? key}) : super(key: key);

  @override
  State<HitMeUpScreen> createState() => _HitMeUpScreenState();
}

class _HitMeUpScreenState extends State<HitMeUpScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<HitMeUpProvider>(context, listen: false).fetchHitMeUpCategoryNameListApi();
      Provider.of<HitMeUpProvider>(context, listen: false).fetchHitMeUpExploreListApi();
      Provider.of<HitMeUpProvider>(context, listen: false).fetchHitMeUpUpcomingListApi();
    });
  }

  int value = 0;
  String catName = '';
  String imageBaseUrl = "https://dostanaa.in/public/upload/";

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<HitMeUpProvider>(builder: (context, provider, child) {
      if (provider.fetchHitMeUpCategoryNameLoading) {
        return Scaffold(
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
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey),
                        ),
                        const Spacer(),
                        Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 160,
                      width: width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(22), color: Colors.grey),
                          ),
                          const Spacer(),
                          Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(22), color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 160,
                      width: width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                    ),
                  ],
                ),
              )),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(
                    children: [
                      InkWell(
                          borderRadius: BorderRadius.circular(28),
                          onTap: () async {
                            CommonDialog().showMyHitMeUpDialog(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Color.fromRGBO(161, 55, 139, 1),
                                  Color.fromRGBO(218, 74, 64, 1),
                                  Color.fromRGBO(229, 67, 97, 1),
                                ]),
                                borderRadius: BorderRadius.circular(40)),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 14.0, right: 14, top: 6, bottom: 6),
                              child: Center(
                                child: Text(
                                  "My PlanPal",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      const Spacer(),
                      InkWell(
                        onTap: () async {
                          Navigator.pushNamed(context, RoutesName.hitMeUpRequestScreen);
                          // materialPageRoute(context, const HitMeUpRequestScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(8)),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 12.0, right: 12, top: 4, bottom: 4),
                            child: Center(
                              child: Text(
                                "Request",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10, top: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white, width: 0.50),
                    ),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      collapsedBackgroundColor: const Color(0xff35363A),
                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: const BorderSide(color: Colors.white, width: 0.50),
                      ),
                      backgroundColor: const Color(0xff35363A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: const BorderSide(color: Colors.white, width: 0.50),
                      ),
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      tilePadding: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                      childrenPadding: const EdgeInsets.only(left: 10, right: 10),
                      leading: Container(
                        width: 40.04,
                        height: 40.04,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.90),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(22),
                              child: Image.asset(
                                "assets/png_img/hitme_pic.png",
                                fit: BoxFit.contain,
                                width: 35.04,
                                height: 35.04,
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: const Text(
                        'My Outing Plans',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      children: [
                        GridView.builder(
                          padding: const EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            childAspectRatio: 3,
                          ),
                          itemCount: provider.fetchHitMeUpCategoryNameListModel.data?.category.length ?? 0,
                          itemBuilder: (context, index) {
                            final category = provider.fetchHitMeUpCategoryNameListModel.data?.category[index];
                            return ChoiceChip(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              label: SizedBox(
                                width: width / 3 - 48,
                                height: 18,
                                child: Center(
                                  child: Text(
                                    category!.categoryName,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              selected: value == category.id,
                              selectedColor: const Color.fromRGBO(233, 64, 87, 1),
                              labelStyle: TextStyle(
                                color: value == category.id ? Colors.white : Colors.white,
                              ),
                              onSelected: (selected) {
                                catName = category.categoryName;
                                provider.saveHitMeCategoryData(
                                    category.categoryName,
                                    category.id
                                );
                                setState(() => value = category.id);
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 0, top: 5),
                          child: Container(
                            height: 35.0,
                            width: width / 2 - 40,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(161, 55, 139, 1),
                                  Color.fromRGBO(218, 74, 64, 1),
                                  Color.fromRGBO(229, 67, 97, 1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: InkWell(
                              onTap: () {
                                if (value <= 0) {
                                  CommonToast.toastErrorMessage("Please select category");
                                } else {
                                Navigator.of(context).pushNamed(RoutesName.createHitMeUpScreen);
                                }
                              },
                              child: const Center(
                                child: Text(
                                  "Create",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Container(
                    height: 45,
                    width: width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),
                    child: TabBar(
                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                      indicator: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [Color(0xFFCC3263), Color(0xFFE94057)],
                        ),
                        borderRadius: BorderRadius.circular(25), // Adjust the value as per your preference
                        color: Colors.white, // Color of the indicator
                      ),

                      indicatorColor: Colors.transparent,
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                      // padding: EdgeInsets.only(left: 12,right: 12),
                      //  labelPadding: EdgeInsets.only(left: 12,right: 12),
                      dividerColor: Colors.transparent,
                      // overlayColor: MaterialStateProperty.all(Colors.red),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      controller: _tabController,
                      tabs: const [
                        Padding(
                          padding: EdgeInsets.only(left: 12.0, right: 12.0),
                          child: Tab(text: 'Explore'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.0, right: 12.0),
                          child: Tab(text: 'Upcoming'),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Consumer<HitMeUpProvider>(builder: (context, hitMeUpProvider, child) {
                        final data = hitMeUpProvider.fetchHitMeUpExploreListModel.data;
                        return data.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                primary: true,
                                // physics: const NeverScrollableScrollPhysics(),
                                itemCount: hitMeUpProvider.fetchHitMeUpExploreListModel.data.length,
                                itemBuilder: (context, index) {
                                  final hitMeUp = hitMeUpProvider.fetchHitMeUpExploreListModel.data[index];
                                  String inputDate = hitMeUp.date.toString();
                                  String inputDates = hitMeUp.createDate.toString();
                                  DateTime parsedDate = DateFormat("dd-MM-yyyy").parse(inputDate);
                                  String formattedDate = DateFormat("dd MMMM yyyy").format(parsedDate);
                                  DateTime parsedDates = DateFormat("dd/MM/yyyy").parse(inputDates);
                                  String formattedDates = DateFormat("dd MMMM yyyy").format(parsedDates);
                                  return SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200), color: Colors.white24, borderRadius: BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
                                              child: InkWell(
                                                onTap: () async {
                                                  // await hitMeUpProvider.showUserDetailsDataProvider(context, hitMeUp.userId);
                                                  // materialPageRoute(context, ShowUserDetailsScreen(UserId:hitMeUp.userId));
                                                },
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(28.0),
                                                      child: Image.network(
                                                        imageBaseUrl + hitMeUpProvider.fetchHitMeUpExploreListModel.data[index].userImage,
                                                        height: 50.0,
                                                        width: 50.0,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          hitMeUpProvider.fetchHitMeUpExploreListModel.data[index].userName,
                                                          style: const TextStyle(color: Colors.white, fontSize: 18),
                                                        ),
                                                        Text(
                                                          formattedDates,
                                                          style: const TextStyle(color: Colors.white60, fontSize: 10),
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    const Image(image: AssetImage("assets/png_img/check1.png")),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.calendar_month_outlined,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    formattedDate,
                                                    style: const TextStyle(color: Colors.white, fontSize: 10),
                                                  ),
                                                  const Spacer(),
                                                  const Icon(
                                                    Icons.watch_later_outlined,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    hitMeUp.time,
                                                    style: const TextStyle(color: Colors.white, fontSize: 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(left: 15, bottom: 15, top: 10),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on_outlined,
                                                      color: Colors.white70,
                                                      size: 30,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                        child: Text(
                                                      hitMeUp.location,
                                                      style: const TextStyle(color: Colors.white),
                                                    ))
                                                  ],
                                                )),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 15.0),
                                                  child: Container(
                                                      height: 40.0,
                                                      width: width / 2 + 20,
                                                      decoration: BoxDecoration(color: const Color.fromRGBO(233, 64, 87, 1), borderRadius: BorderRadius.circular(30)),
                                                      child: Consumer<HitMeUpProvider>(
                                                        builder: (context, provider, child) {
                                                          return InkWell(
                                                            onTap: () {
                                                              // Provider.of<HitMeUpProvider>(context, listen: false).fetchShowMyHitMeUpProvider(context);

                                                              showDialog(
                                                                context: context,
                                                                builder: (BuildContext context) {
                                                                  return AlertDialog(
                                                                    icon: Image.asset(
                                                                      "assets/png_img/hitme_pic.png",
                                                                      height: 80,
                                                                      width: 80,
                                                                    ),
                                                                    title: Column(
                                                                      children: [
                                                                        const Text(
                                                                          'Are you sure !',
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color: Color(0xFF0F1728),
                                                                            fontSize: 22.66,
                                                                            fontFamily: 'Outfit',
                                                                            fontWeight: FontWeight.w700,
                                                                          ),
                                                                        ),
                                                                        const Text(
                                                                          'Do you want to hit me Up it ?',
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            fontSize: 14,
                                                                            color: Color(0xFF475466),
                                                                            fontWeight: FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height: 10,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            InkWell(
                                                                              onTap: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: Container(
                                                                                height: 40.0,
                                                                                width: width / 2 - 70,
                                                                                decoration: ShapeDecoration(
                                                                                  color: Colors.red.shade600,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    side: const BorderSide(width: 0.99, color: Color(0xFFCFD4DC)),
                                                                                    borderRadius: BorderRadius.circular(7.91),
                                                                                  ),
                                                                                  shadows: const [
                                                                                    BoxShadow(
                                                                                      color: Color(0x0C101828),
                                                                                      blurRadius: 1.98,
                                                                                      offset: Offset(0, 0.99),
                                                                                      spreadRadius: 0,
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                                child: const Center(
                                                                                  child: Text(
                                                                                    'Cancel',
                                                                                    style: TextStyle(
                                                                                      color: Colors.white,
                                                                                      fontSize: 15.82,
                                                                                      fontFamily: 'Outfit',
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                final response = await hitMeUpProvider.sendRequestHitMeUpApi(hitMeUp.userId);
                                                                                if(response["status"]==true){
                                                                                  CommonToast.toastSuccessMessage(response["message"]);
                                                                                  hitMeUpProvider.fetchHitMeUpExploreListApi();
                                                                                   if(context.mounted)Navigator.of(context).pop();
                                                                                }else{
                                                                                  CommonToast.toastSuccessMessage(response["message"]);
                                                                                   if(context.mounted)Navigator.of(context).pop();
                                                                                }
                                                                                //await provider.hitMeUpForExploreProvider(context, hitMeUp.userId);
                                                                                // Navigator.of(context).pop();
                                                                              },
                                                                              child: Container(
                                                                                height: 40.0,
                                                                                width: width / 2 - 70,
                                                                                decoration: ShapeDecoration(
                                                                                  color: Colors.green.shade600,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    side: const BorderSide(width: 0.99, color: Color(0xFFCFD4DC)),
                                                                                    borderRadius: BorderRadius.circular(7.91),
                                                                                  ),
                                                                                  shadows: const [
                                                                                    BoxShadow(
                                                                                      color: Color(0x0C101828),
                                                                                      blurRadius: 1.98,
                                                                                      offset: Offset(0, 0.99),
                                                                                      spreadRadius: 0,
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                                child:   Center(
                                                                                  child: hitMeUpProvider.sendRequestExploreHitMeUpLoading ? CommonLoader.animLoader() : const Text(
                                                                                    'Ok',
                                                                                    style: TextStyle(
                                                                                      color: Colors.white,
                                                                                      fontSize: 15.82,
                                                                                      fontFamily: 'Outfit',
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Center(
                                                              child: Text(
                                                                'HIT ME UP for ${hitMeUp.categoryName}',
                                                                style: const TextStyle(fontSize: 14, color: Colors.white),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })
                            : const Center(
                                child: Text(
                                  "No data found",
                                  style: TextStyle(fontSize: 14, color: Colors.white),
                                ),
                              );
                      }),
                      Consumer<HitMeUpProvider>(builder: (context, hitMeUpProvider, child) {
                        final data = hitMeUpProvider.fetchHitMeUpUpcomingListModel.data;
                        return data.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                primary: true,
                                // physics: const NeverScrollableScrollPhysics(),
                                itemCount: hitMeUpProvider.fetchHitMeUpUpcomingListModel.data.length,
                                itemBuilder: (context, index) {
                                  // print("+++++line 275 :: ${hitMeUpProvider.fetchHitMeUpUpComingDataModel.data.length}");
                                  return SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200), color: Colors.white24, borderRadius: BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
                                              child: InkWell(
                                                onTap: () async {
                                                  // await hitMeUpProvider.showUserDetailsDataProvider(context, hitMeUpProvider.fetchHitMeUpUpComingDataModel.data[index].userId);
                                                  // materialPageRoute(context, ShowUserDetailsScreen(UserId:hitMeUpProvider.fetchHitMeUpUpComingDataModel.data[index].userId));
                                                },
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(28.0),
                                                      child: Image.network(
                                                        imageBaseUrl + hitMeUpProvider.fetchHitMeUpUpcomingListModel.data[index].profilePic,
                                                        height: 50.0,
                                                        width: 50.0,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          hitMeUpProvider.fetchHitMeUpUpcomingListModel.data[index].name,
                                                          style: const TextStyle(color: Colors.white, fontSize: 18),
                                                        ),
                                                        Text(
                                                          hitMeUpProvider.fetchHitMeUpUpcomingListModel.data[index].createDate,
                                                          style: const TextStyle(color: Colors.white60, fontSize: 10),
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    const Image(image: AssetImage("assets/png_img/check1.png")),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(left: 15, bottom: 15, top: 10),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.radio_button_checked,
                                                      color: Colors.white70,
                                                      size: 30,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                        child: Text(
                                                      hitMeUpProvider.fetchHitMeUpUpcomingListModel.data[index].title,
                                                      style: const TextStyle(color: Colors.white),
                                                    ))
                                                  ],
                                                )),
                                            Padding(
                                                padding: const EdgeInsets.only(left: 15, bottom: 15),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on_outlined,
                                                      color: Colors.white70,
                                                      size: 30,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                        child: Text(
                                                      maxLines: 3,
                                                      hitMeUpProvider.fetchHitMeUpUpcomingListModel.data[index].location,
                                                      style: const TextStyle(color: Colors.white),
                                                    ))
                                                  ],
                                                )),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 20, right: 20),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.calendar_month_outlined,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    hitMeUpProvider.fetchHitMeUpUpcomingListModel.data[index].date,
                                                    style: const TextStyle(color: Colors.white, fontSize: 10),
                                                  ),
                                                  const Spacer(),
                                                  const Icon(
                                                    Icons.watch_later_outlined,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    hitMeUpProvider.fetchHitMeUpUpcomingListModel.data[index].time,
                                                    style: const TextStyle(color: Colors.white, fontSize: 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 15.0),
                                                  child: Container(
                                                    height: 40.0,
                                                    width: width / 2 + 20,
                                                    decoration: BoxDecoration(color: const Color.fromRGBO(233, 64, 87, 1), borderRadius: BorderRadius.circular(30)),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) {
                                                            return AlertDialog(
                                                              icon: Image.asset(
                                                                "assets/png_img/trash.png",
                                                                height: 80,
                                                                width: 80,
                                                              ),
                                                              title: Column(
                                                                children: [
                                                                  const Text(
                                                                    'Delete',
                                                                    textAlign: TextAlign.center,
                                                                    style: TextStyle(
                                                                      color: Color(0xFF0F1728),
                                                                      fontSize: 22.66,
                                                                      fontFamily: 'Outfit',
                                                                      fontWeight: FontWeight.w700,
                                                                    ),
                                                                  ),
                                                                  const Text(
                                                                    'Are you sure !',
                                                                    textAlign: TextAlign.center,
                                                                    style: TextStyle(
                                                                      color: Color(0xFF475466),
                                                                      fontSize: 11.84,
                                                                      fontFamily: 'Outfit',
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      InkWell(
                                                                        onTap: () {
                                                                          Navigator.of(context).pop();
                                                                        },
                                                                        child: Container(
                                                                          height: 40.0,
                                                                          width: width / 2 - 70,
                                                                          decoration: ShapeDecoration(
                                                                            color: Colors.white,
                                                                            shape: RoundedRectangleBorder(
                                                                              side: const BorderSide(width: 0.99, color: Color(0xFFCFD4DC)),
                                                                              borderRadius: BorderRadius.circular(7.91),
                                                                            ),
                                                                            shadows: const [
                                                                              BoxShadow(
                                                                                color: Color(0x0C101828),
                                                                                blurRadius: 1.98,
                                                                                offset: Offset(0, 0.99),
                                                                                spreadRadius: 0,
                                                                              )
                                                                            ],
                                                                          ),
                                                                          child: const Center(
                                                                            child: Text(
                                                                              'No',
                                                                              style: TextStyle(
                                                                                color: Color(0xFF344053),
                                                                                fontSize: 15.82,
                                                                                fontFamily: 'Outfit',
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width: 10,
                                                                      ),
                                                                      InkWell(
                                                                        onTap: () async {
                                                                         final response = await hitMeUpProvider.hitMeUpUpcomingDeleteApi(hitMeUpProvider.fetchHitMeUpUpcomingListModel.data[index].userId);
                                                                           if(response["status"]==true){
                                                                             CommonToast.toastSuccessMessage(response["message"]);
                                                                             hitMeUpProvider.fetchHitMeUpUpcomingListApi();
                                                                              if(context.mounted)Navigator.of(context).pop();
                                                                           }
                                                                        },
                                                                        child: Container(
                                                                          height: 40.0,
                                                                          width: width / 2 - 70,
                                                                          decoration: ShapeDecoration(
                                                                            color: Colors.red.shade600,
                                                                            shape: RoundedRectangleBorder(
                                                                              side: const BorderSide(width: 0.99, color: Color(0xFFCFD4DC)),
                                                                              borderRadius: BorderRadius.circular(7.91),
                                                                            ),
                                                                            shadows: const [
                                                                              BoxShadow(
                                                                                color: Color(0x0C101828),
                                                                                blurRadius: 1.98,
                                                                                offset: Offset(0, 0.99),
                                                                                spreadRadius: 0,
                                                                              )
                                                                            ],
                                                                          ),
                                                                          child: const Center(
                                                                            child: Text(
                                                                              'Yes',
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 15.82,
                                                                                fontFamily: 'Outfit',
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: const Center(
                                                        child: Text(
                                                          'Delete',
                                                          style: TextStyle(fontSize: 14, color: Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })
                            : const Center(
                                child: Text(
                                  "No data found",
                                  style: TextStyle(fontSize: 14, color: Colors.white),
                                ),
                              );
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
    });
  }
}
