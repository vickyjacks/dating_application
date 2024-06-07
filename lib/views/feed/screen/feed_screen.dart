import 'package:datingapp/config/routes/route_name.dart';
import 'package:datingapp/views/feed/provider/feed_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ShowFeedScreen extends StatefulWidget {
  const ShowFeedScreen({super.key});

  @override
  State<ShowFeedScreen> createState() => _ShowFeedScreenState();
}

class _ShowFeedScreenState extends State<ShowFeedScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<FeedProvider>(context, listen: false).fetchFeedDetailsApi();
    });
  }

  String imageBaseUrl = "https://dostanaa.in/public/upload/";
  String imageBaseUrl2 = "https://dostanaa.in/public/gallery/";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<FeedProvider>(
      builder: (context, provider, child) {
        // return (provider.fetchFeedLoading==false)
        return (provider.fetchFeedLoading)
            ? Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.black,
                ),
                body: Shimmer.fromColors(
                    baseColor: Colors.red.shade100,
                    highlightColor: Colors.red.shade300,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            width: 240,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 20,
                            width: 150,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 20,
                            width: 240,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 20,
                            width: 150,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey),
                          ),
                        ],
                      ),
                    )),
              )
            : Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.black,
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
                          "My Feed",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white
                        // gradient: const LinearGradient(
                        //   // begin: Alignment(1.00, -0.05),
                        //   // end: Alignment(-1, 0.05),
                        //   colors: [
                        //     Color(0xFFDA493F),
                        //     Color(0xFFE54361),
                        //     Color(0xFFA1378B),
                        //   ],
                        // ),
                      ),
                      padding: const EdgeInsets.only(right: 0.0),
                      child: InkWell( 
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                            // materialPageRoute(context, const UploadFeedScreen());
                          Navigator.pushNamed(context, RoutesName.uploadFeedScreen);
                        },
                        // isExtended: true,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: const Icon(
                            Icons.add_rounded,
                            color: Colors.red,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                  backgroundColor: Colors.black,
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                ),
                body: (provider.fetchFeedDetailModel.data.isEmpty)
                    ? Center(
                        child: Text(
                          provider.fetchFeedDetailModel.message,
                          style: const TextStyle(color: Colors.white, fontFamily: "Outfit", fontSize: 18),
                        ),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        primary: true,
                        padding: EdgeInsets.only(top: 10),
                        itemCount: provider.fetchFeedDetailModel.data.length,
                        itemBuilder: (context, index) {
                          final String inputDate = provider.fetchFeedDetailModel.data[index].date;
                          DateTime date = DateFormat("dd/MM/yyyy").parse(inputDate);
                          String formattedDateTime = DateFormat("dd MMMM yyyy").format(date);

                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 0, right: 10),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.network(
                                        imageBaseUrl + provider.fetchFeedDetailModel.data[index].profilePic,
                                        fit: BoxFit.cover,
                                        height: 50,
                                        width: 50,
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
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          provider.fetchFeedDetailModel.data[index].name,
                                          style: TextStyle(color: Colors.white, fontSize: 18),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: Text(
                                            " $formattedDateTime",
                                            style: TextStyle(color: Colors.white60, fontSize: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () async {
                                        // await AwesomeDialog(
                                        //     context: context,
                                        //     dialogType: DialogType.warning,
                                        //     borderSide: const BorderSide(color: Colors.red, width: 2,),
                                        //     width: MediaQuery.of(context).size.width,
                                        //     buttonsBorderRadius: const BorderRadius.all(Radius.circular(2),),
                                        //     dismissOnTouchOutside: true,
                                        //     dismissOnBackKeyPress: false,
                                        //     headerAnimationLoop: false,
                                        //     animType: AnimType.bottomSlide,
                                        //     title: "Are Your Sure ? ",
                                        //     desc: "deleted your feed",
                                        //     showCloseIcon: true,
                                        //     btnCancelOnPress: () {
                                        //
                                        //     },
                                        //     btnOkOnPress: () async {
                                        //       await Provider.of<ProfileProvider>(context,listen: false).feedDeletedProvider(context,data.data[index].postId);
                                        //
                                        //     }).show();
                                      },
                                      child: const Image(
                                        image: AssetImage("assets/png_img/dot.png"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if(provider.fetchFeedDetailModel.data[index].description!="")...[Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 10,
                                  top: 5,
                                ),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    provider.fetchFeedDetailModel.data[index].description.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )],
                                if(provider.fetchFeedDetailModel.data[index].image != '')...[  Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 15),
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                                  // width: MediaQuery.of(context).size.width,
                                  child:
                                       ClipRRect(
                                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                                          child: Image.network(
                                            imageBaseUrl2 + provider.fetchFeedDetailModel.data[index].image,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                ),
                              )],
                            ],
                          );
                        },
                      )
                // floatingActionButtonLocation:
                // FloatingActionButtonLocation.endFloat,
                // floatingActionButton: Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(100),
                //     gradient: const LinearGradient(
                //       // begin: Alignment(1.00, -0.05),
                //       // end: Alignment(-1, 0.05),
                //       colors: [
                //         Color(0xFFA1378B),
                //         Color(0xFFDA493F),
                //         Color(0xFFE54361)
                //       ],
                //     ),
                //   ),
                //   padding: const EdgeInsets.only(right: 0.0),
                //   child: FloatingActionButton(
                //     backgroundColor: Colors.transparent,
                //     // isExtended: true,
                //     onPressed: () {
                //       materialPageRoute(context, const UploadFeedScreen());
                //     },
                //     // isExtended: true,
                //     child: const Icon(Icons.add_rounded),
                //   ),
                // ),
                );
      },
    );
  }
}
