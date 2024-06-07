import 'package:datingapp/common/toast.dart';
import 'package:datingapp/views/hitmeup/provider/hitmeup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class MyHitMeUpDialog extends StatefulWidget {
  const MyHitMeUpDialog({super.key});

  @override
  State<MyHitMeUpDialog> createState() => _MyHitMeUpDialogState();
}

class _MyHitMeUpDialogState extends State<MyHitMeUpDialog> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<HitMeUpProvider>(context, listen: false).fetchMyHitMeUpDetailApi();
    });
  }

  String imageBaseUrl = "https://dostanaa.in/public/upload/";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer<HitMeUpProvider>(builder: (context, provider, child) {
      return provider.fetchMyHitMeUpDetailsLoading
          ? const Center(child: CircularProgressIndicator())
          : AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              actions: [
                (provider.fetchMyHitMeUpDetailModel.status == false)
                    ? const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20.0, bottom: 8),
                            child: Center(
                              child: Text(
                                "No data \n\nMy Outing Plans",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black, fontFamily: "Outfit", fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundImage: NetworkImage(imageBaseUrl + provider.fetchMyHitMeUpDetailModel.data!.userImage),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider.fetchMyHitMeUpDetailModel.data!.userName,
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  ),
                                  Text(
                                    provider.fetchMyHitMeUpDetailModel.data!.createDate,
                                    style: TextStyle(color: Colors.black, fontSize: 12),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Image(image: AssetImage("assets/png_img/check1.png")),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                const Column(
                                  children: [
                                    Icon(
                                      Icons.radio_button_checked,
                                      color: Colors.black,
                                      size: 20,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Text(
                                    provider.fetchMyHitMeUpDetailModel.data!.title,
                                    style: const TextStyle(color: Colors.black, fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                const Column(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.black,
                                      size: 20,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Text(
                                    provider.fetchMyHitMeUpDetailModel.data!.location,
                                    style: TextStyle(color: Colors.black, fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  provider.fetchMyHitMeUpDetailModel.data!.date,
                                  style: TextStyle(color: Colors.black, fontSize: 13),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.watch_later_outlined,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  provider.fetchMyHitMeUpDetailModel.data!.time,
                                  style: const TextStyle(color: Colors.black, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: InkWell(
                                onTap: () async {
                                  Navigator.pop(context);
                                  showDialog(
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
                                                    var response = await provider.deleteMyHitMeUpApi(provider.fetchMyHitMeUpDetailModel.data!.hitmeupId);

                                                    if (response["status"] == true) {
                                                      CommonToast.toastSuccessMessage(response["message"]);
                                                      await Provider.of<HitMeUpProvider>(context, listen: false).fetchMyHitMeUpDetailApi();
                                                      Navigator.of(context).pop();
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
                                child: Container(
                                  height: 40,
                                  width: width * 0.40,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      Color.fromRGBO(161, 55, 139, 1),
                                      Color.fromRGBO(218, 74, 64, 1),
                                      Color.fromRGBO(229, 67, 97, 1),
                                    ]),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
              ],
            );
    });
  }
}
