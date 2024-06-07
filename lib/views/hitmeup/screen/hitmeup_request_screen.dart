import 'package:datingapp/common/toast.dart';
import 'package:datingapp/views/hitmeup/provider/hitmeup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HitMeUpRequestScreen extends StatefulWidget {
  const HitMeUpRequestScreen({super.key});

  @override
  State<HitMeUpRequestScreen> createState() => _HitMeUpRequestScreenState();
}

class _HitMeUpRequestScreenState extends State<HitMeUpRequestScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<HitMeUpProvider>(context, listen: false)
          .fetchHitMeUpRequestListApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String imageBaseUrl = "https://dostanaa.in/public/upload/";
    return Consumer<HitMeUpProvider>(builder: (context, provider, child) {
      return provider.fetchHitMeUpRequestLoading
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
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 180,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 180,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  )),
            )
          : Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Row(
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
                    const Padding(
                      padding: EdgeInsets.only(left: 15, top: 0),
                      child: Text(
                        "Request",
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
              body: (provider.fetchHitMeUpRequestListModel.data.isEmpty)
                  ? Center(
                    child: Text(
                        provider.fetchHitMeUpRequestListModel.message,
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                  )
                  : ListView.builder(
                      shrinkWrap: true,
                      primary: true,
                      itemCount:
                          provider.fetchHitMeUpRequestListModel.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 10, top: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200),
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 20, right: 20),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 28,
                                        backgroundImage: NetworkImage(
                                            imageBaseUrl +
                                                provider
                                                    .fetchHitMeUpRequestListModel
                                                    .data[index]
                                                    .profilePic),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              provider
                                                  .fetchHitMeUpRequestListModel
                                                  .data[index]
                                                  .name,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18)),
                                          Text(
                                              provider
                                                  .fetchHitMeUpRequestListModel
                                                  .data[index]
                                                  .createDate,
                                              style: const TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 10)),
                                        ],
                                      ),
                                      const Spacer(),
                                      const Image(
                                          image: AssetImage(
                                              "assets/png_img/check1.png")),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 20, right: 20),
                                  child: Row(
                                    children: [
                                      const Column(
                                        children: [
                                          Icon(
                                            Icons.radio_button_checked,
                                            color: Colors.white,
                                            size: 20,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Text(
                                          provider.fetchHitMeUpRequestListModel
                                              .data[index].title,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 20, right: 20),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Text(
                                            provider
                                                .fetchHitMeUpRequestListModel
                                                .data[index]
                                                .location,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 13)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 20, right: 20),
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
                                          provider.fetchHitMeUpRequestListModel
                                              .data[index].date,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12)),
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
                                          provider.fetchHitMeUpRequestListModel
                                              .data[index].time,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 40, right: 40, bottom: 20),
                                  child: Row(
                                    children: [
                                      Consumer<HitMeUpProvider>(
                                          builder: (context, provider, child) {
                                        return Container(
                                          height: 40.0,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  233, 64, 87, 1),
                                              // border: Border.all(
                                              //     width: 1, color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            onTap: () async {
                                              await provider
                                                  .hitMeUpRequestDeleteOrAcceptApi(
                                                      provider
                                                          .fetchHitMeUpRequestListModel
                                                          .data[index]
                                                          .senderId,
                                                      "Reject");
                                            },
                                            child: const Center(
                                              child: Text(
                                                'Reject',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                      const Spacer(),
                                      Consumer<HitMeUpProvider>(
                                        builder: (context, provider, child) {
                                          return Container(
                                            height: 40.0,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: InkWell(
                                              onTap: () async {
                                                final response = await provider
                                                    .hitMeUpRequestDeleteOrAcceptApi(
                                                        provider
                                                            .fetchHitMeUpRequestListModel
                                                            .data[index]
                                                            .senderId,
                                                        "Accept");
                                                if (response["true"] == true) {
                                                  CommonToast.toastErrorMessage(
                                                      response["message"]);
                                                  Navigator.of(context).pop();
                                                } else {
                                                  CommonToast.toastErrorMessage(
                                                      response["message"]);
                                                }
                                              },
                                              child: const Center(
                                                child: Text(
                                                  'Accept',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ));
    });
  }
}
