import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../provider/cms_provider.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<CMSProvider>(context, listen: false).fetchHelpCenterUsApi();
    });
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<CMSProvider>(builder: (context,provider,child){
      return provider.helpCenterLoading ?   Scaffold(
        backgroundColor: Colors.black,
        body:Shimmer.fromColors(
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
      ): Scaffold(
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
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 0),
                child: Text("Help Center",
                    style:   TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    )),
              ),
            ],
          ), //<Widget>[]
          backgroundColor: Colors.black,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body:   ListView.builder(
          itemCount:provider.fetchHelpCenterModel.data.length,
          itemBuilder: (context, index) {
            return Center(
              child: Padding(
                  padding:
                  const EdgeInsets.only(left: 15, right: 15, top: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            'assets/png_img/IT-Support.png',
                            height: 200,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Colors.deepOrange,
                            ),
                            Text("  ${provider.fetchHelpCenterModel.data[index].phone}",
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ) ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.email,
                              color: Colors.deepOrange, 
                            ),
                            Text("  ${provider.fetchHelpCenterModel.data[index].email}",
                                style: TextStyle(
                                    color: Colors.white
                                        .withOpacity(0.699999988079071),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                          ],
                        ),
                      )
                    ],
                  )),
            );
          },
        ),
      );
    });
  }
}
