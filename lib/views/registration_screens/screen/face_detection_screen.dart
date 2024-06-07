import 'dart:io';
import 'package:datingapp/views/profiles/provider/profile_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../common/loader.dart';
import '../../../common/toast.dart';
import '../../../config/routes/route_name.dart';
import '../../profiles/model/fetch_user_details_model.dart';
import '../provider/auth_provider.dart';

class FaceDetectionScreen extends StatefulWidget {
  const FaceDetectionScreen({super.key});

  @override
  State<FaceDetectionScreen> createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  @override
  void initState() {
    super.initState();
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<ProfileProvider>(context, listen: false).fetchUserProfileDetailsApi();
    // });
  }
  File? image;

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 675,
        maxWidth: 960,
      );
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.camera_alt),
            onPressed: () {
              pickImageC();
            }),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Face Detection",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.70 - 120,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8)),
                  child: image != null
                      ? Image.file(
                          image!,
                          fit: BoxFit.cover,
                        )
                      : const Center(child: Text("No image captured")),
                ),

                // SizedBox(
                //   height: MediaQuery.of(context).size.height*0.30,
                //   width: MediaQuery.of(context).size.width,
                //   child: Center(
                //     child: Consumer<AuthenticationProvider>(
                //       builder: (context,provider,child){
                //         return Center(
                //           child: provider.isLoading ?const Center(
                //               child: CircularProgressIndicator(
                //                 color: Color.fromRGBO(218, 74, 64, 1),
                //                 strokeWidth: 5,
                //               )) : Padding(
                //             padding:   EdgeInsets.only(left: width/3-25,right: width/3-25),
                //             child: NormalButton(
                //                 onPressed: ()async{
                //                   if(image != null){
                //                     await provider.userFaceDetectProvider(context, image!.path);
                //                   }
                //                   else{
                //                     Utils.toastErrorMessage("Please clicked image");
                //                   }
                //                 },
                //                 title: "Verify Now", height: 40.0, width: MediaQuery.of(context).size.width-50),
                //           ),
                //         );
                //       },
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Consumer<AuthProvider>(
          builder: (context, provider, child) {
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
                  onTap: () async {
                    final response = await provider.faceVerificationApi(image!.path);
                    if(response["status"]==true){
                      CommonToast.toastSuccessMessage(response["message"]);
                        if(context.mounted) Navigator.pushReplacementNamed(context, RoutesName.datingTypeScreen);
                    }else{
                      CommonToast.toastErrorMessage(response["message"]);
                      if(context.mounted) Navigator.pushReplacementNamed(context, RoutesName.photosScreen);
                    }
                  },
                  child: Center(
                    child: provider.faceVerificationLoading
                        ? CommonLoader.animLoader()
                        : const Text("Continue",
                            style: TextStyle(
                              fontFamily: "Outfit",
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                  ),
                ),
              )),
            );
          },
        ));
  }
}
