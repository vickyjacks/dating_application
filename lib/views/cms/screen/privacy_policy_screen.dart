import 'package:datingapp/views/cms/provider/cms_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<CMSProvider>(context, listen: false).fetchPrivacyPolicyApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<CMSProvider>(builder: (context, provider, child) {
      return provider.fetchPrivacyPolicyLoading
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
                          height: 50,
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
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 20,
                          width: 230,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                        ),
                        const SizedBox(
                          height:20,
                        ),
                        Container(
                          height: 20,
                          width: 140,
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
                      ],
                    ),
                  )),
            )
          : Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 0),
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
                    const Padding(
                      padding: EdgeInsets.only(left: 15, top: 0),
                      child: Text(
                        "Privacy Policy",
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
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.black,
              body: ListView.builder(
                itemCount: provider.fetchPrivacyPolicyModel.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            provider.fetchPrivacyPolicyModel.data[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            provider.fetchPrivacyPolicyModel.data[index].description,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.699999988079071),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ));
                },
              ),
            );
    });
  }
}
