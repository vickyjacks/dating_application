import 'dart:io';
import 'package:datingapp/views/feed/provider/feed_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../common/loader.dart';
import '../../../common/toast.dart';

class UploadFeedScreen extends StatefulWidget {
  const UploadFeedScreen({super.key});

  @override
  State<UploadFeedScreen> createState() => _UploadFeedScreenState();
}

class _UploadFeedScreenState extends State<UploadFeedScreen> {
  File? galleryFile;
  final picker = ImagePicker();
  var blankImage = '';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                  "Upload Feed",
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
        body: Consumer<FeedProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 25),
                    child: Row(
                      children: [
                        Text(
                          "Write  your thought's",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 40),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: provider.feedController,
                      minLines: 3,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      textCapitalization: TextCapitalization.sentences,
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromRGBO(233, 64, 87, 1), width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.black,
                        hintText: "what is thinking now ?",
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            width: 0,
                            color: Color.fromRGBO(229, 67, 97, 1),
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                  ),
                  galleryFile == null
                      ? InkWell(
                          onTap: () {
                            _showPicker(context: context);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            height: 80,
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Select favorite",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.add_photo_alternate_outlined,
                                    size: 40,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  galleryFile!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                  top: 10,
                                  right: 10,
                                  child: InkWell(
                                    onTap: () async {
                                      _showPicker(context: context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.red),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Consumer<FeedProvider>(
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
                    if (provider.feedController.text.trim().isEmpty && galleryFile == null) {
                      CommonToast.toastErrorMessage("something went wrong");
                    } else {
                      if (galleryFile?.path == null) {
                        final response = await provider.uploadFeedApi("");
                        if (response["status"] == true) {
                          CommonToast.toastSuccessMessage(response["message"]);
                         if(context.mounted) Navigator.of(context).pop();
                          // if (context.mounted) Navigator.(context, RoutesName.showFeedScreen);
                        } else {
                          CommonToast.toastErrorMessage(response["message"]);
                        }
                      } else {
                        final response = await provider.uploadFeedApi(galleryFile!.path);
                        if (response["status"] == true) {
                          CommonToast.toastSuccessMessage(response["message"]);
                         if(context.mounted) Navigator.of(context).pop();
                          // if (context.mounted) Navigator.pushReplacementNamed(context, RoutesName.showFeedScreen);
                        } else {
                          CommonToast.toastErrorMessage(response["message"]);
                        }
                      }
                    }
                  },
                  child: Center(
                    child: provider.uploadFeedLoading
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

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(
      source: img,
      maxHeight: 675,
      maxWidth: 960,
    );
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
}
