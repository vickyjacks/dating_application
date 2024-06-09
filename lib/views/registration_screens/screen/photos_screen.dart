import 'dart:io';
import 'package:datingapp/common/toast.dart';  
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart'; 
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/loader.dart';
import '../../../config/routes/route_name.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  final List<String> _selectedImages = [];
  final _picker = ImagePicker();
  String firstImage = '';
  String secondImage = '';
  String thirdImage = '';
  String fourthImage = '';
  String fifthImage = '';
  String sixthImage = '';
  final List<Map<dynamic, dynamic>> _allImages = [];

  void _removeImage(index,image) {
    setState(() {
      _selectedImages.removeWhere((element) => element==image);
      if (index == 0) {
        firstImage = "";
      }
      if (index == 1) {
        secondImage = "";
      }
      if (index == 2) {
        thirdImage = "";
      }
      if (index == 3) {
        fourthImage = "";
      }
      if (index == 4) {
        fifthImage = "";
      }
      if (index == 5) {
        sixthImage = "";
      }
    });
  }

  Future<void> _pickImages(index) async {
    final images = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (index == 0) {
        firstImage = images!.path;
      } else if (index == 1) {
        secondImage = images!.path;
      } else if (index == 2) {
        thirdImage = images!.path;
      } else if (index == 3) {
        fourthImage = images!.path;
      } else if (index == 4) {
        fifthImage = images!.path;
      } else if (index == 5) {
        sixthImage = images!.path;
      }
      _allImages.add({"image-path": images!.path, "index": index});
    });
    if (kDebugMode) {
      print("alliance-------28------$_allImages");
    }
  }

  bool isLoading = false;
  Future<void> _uploadImages(userId) async {
    setState(() {
      isLoading = true;
    });
    if (_selectedImages != null) {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://dostanaa.in/api/userimages'),
      );
      request.fields['user_id'] = userId;
      for (int i = 0; i < _selectedImages.length; i++) {
        var file =
        await http.MultipartFile.fromPath('image[]', _selectedImages[i]);
        request.files.add(file);
      }
      var response = await request.send();
      if (response.statusCode == 200) {

        setState(() {
          isLoading = false;
        });
        if (kDebugMode) {
          print('Images uploaded successfully');
        }
         if(context.mounted) Navigator.pushReplacementNamed(context, RoutesName.faceDetectionScreen);
        // materialPageRoute(context, const FaceDetectionScreen());
         } else {
        setState(() {
          isLoading = false;
        });
        if (kDebugMode) {
          print('Error uploading images Status Code: ${response.statusCode}');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const Padding(
              padding: EdgeInsets.only(left: 15,bottom: 15),
              child: Text(
                "Pick Your Photos",
                style: TextStyle(color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w400)
              ),
            ),
          SizedBox(
            height: height * 0.65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 255,
                            width: width / 2,
                            child: DottedBorder(
                              color: const Color.fromRGBO(233, 64, 87, 1),
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(15),
                              dashPattern: const [10, 5, 10, 5, 10, 5],
                              child: (firstImage != '')
                                  ? Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: SizedBox(
                                        height: 255,
                                        width: width / 2,
                                        child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(
                                                15),
                                            child: Image.file(File(firstImage),
                                              fit: BoxFit.cover,
                                            ))),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: IconButton(
                                          onPressed: () {
                                            _removeImage(0,firstImage);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 25,
                                          )))
                                ],
                              )
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.emoji_emotions_outlined,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                  const SizedBox(height: 20,),
                                  Center(
                                    child: GestureDetector(
                                      onTap: (){
                                        _pickImages(0);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(28),
                                            color:  const Color
                                                .fromRGBO(
                                                233,
                                                64,
                                                87,
                                                1)
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Icon(Icons.add_circle,color: Colors.white,),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 1,
                                ),
                                child: SizedBox(
                                  height: 120,
                                  width: width / 2 - 30,
                                  child: DottedBorder(
                                    color: const Color.fromRGBO(233, 64, 87, 1),
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(15),
                                    dashPattern: const [10, 5, 10, 5, 10, 5],
                                    child: (secondImage != '')
                                        ? Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: SizedBox(
                                              height: 120,
                                              width: width / 2 - 60,
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(15),
                                                child: Image.file(
                                                  File(secondImage),
                                                  fit: BoxFit.cover,
                                                ),
                                              )),
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: IconButton(
                                                onPressed: () {
                                                  _removeImage(1,secondImage);
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                  size: 25,
                                                )))],)
                                        : Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Center(
                                            child: Icon(
                                              Icons
                                                  .emoji_emotions_outlined,
                                              color: Colors.grey,
                                              size: 30,
                                            )),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 15),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () async {
                                                _pickImages(1);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(28),
                                                  color:  const Color
                                                      .fromRGBO(
                                                      233,
                                                      64,
                                                      87,
                                                      1)
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Icon(Icons.add_circle,color: Colors.white,),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: SizedBox(
                                  height: 120,
                                  width: width / 2 - 30,
                                  child: DottedBorder(
                                    color: const Color.fromRGBO(233, 64, 87, 1),
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(15),
                                    dashPattern: const [10, 5, 10, 5, 10, 5],
                                    child: (thirdImage != '')
                                        ? Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: SizedBox(
                                            height: 120,
                                            width: width / 2 - 60,
                                            child: ClipRRect(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(15),
                                                child: Image.file(
                                                  File(thirdImage),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: IconButton(
                                                onPressed: () {
                                                  _removeImage(2,thirdImage);
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                  size: 25,
                                                )))
                                      ],
                                    )
                                        :  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Center(
                                            child: Icon(
                                              Icons
                                                  .emoji_emotions_outlined,
                                              color: Colors.grey,
                                              size: 30,
                                            )),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 15),
                                          child: Center(
                                            child:  GestureDetector(
                                              onTap: () async {
                                                _pickImages(2);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(28),
                                                    color:  const Color
                                                        .fromRGBO(
                                                        233,
                                                        64,
                                                        87,
                                                        1)
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Icon(Icons.add_circle,color: Colors.white,),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          height: 120,
                          width: width / 3 - 10,
                          child: DottedBorder(
                            color: const Color.fromRGBO(233, 64, 87, 1),
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(15),
                            dashPattern: const [10, 5, 10, 5, 10, 5],
                            child: (fourthImage != '')
                                ? Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: SizedBox(
                                      height: 120,
                                      width: width / 3 - 10,
                                      child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          child: Image.file(
                                            File(fourthImage),
                                            fit: BoxFit.cover,
                                          ))),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: IconButton(
                                        onPressed: () {
                                          _removeImage(3,fourthImage);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 25,
                                        )))
                              ],
                            )
                                : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Center(
                                    child: Icon(
                                      Icons.emoji_emotions_outlined,
                                      color: Colors.grey,
                                      size: 30,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: (){
                                        _pickImages(3);
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(28),
                                              color:  const Color
                                                  .fromRGBO(
                                                  233,
                                                  64,
                                                  87,
                                                  1)
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Icon(Icons.add_circle,color: Colors.white,),
                                          ),),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          height: 120,
                          width: width / 3 - 10,
                          child: DottedBorder(
                            color: const Color.fromRGBO(233, 64, 87, 1),
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(15),
                            dashPattern: const [10, 5, 10, 5, 10, 5],
                            child: (fifthImage != '')
                                ? Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: SizedBox(
                                      height: 120,
                                      width: width / 3 - 10,
                                      child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          child: Image.file(
                                            File(fifthImage),
                                            fit: BoxFit.cover,
                                          ))),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: IconButton(
                                        onPressed: () {
                                          _removeImage(4,fifthImage);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 25,
                                        )))
                              ],
                            )
                                : Column(
                              children: [
                                const Padding(
                                  padding:
                                  EdgeInsets.only(top: 10),
                                  child: Center(
                                      child: Icon(
                                        Icons.emoji_emotions_outlined,
                                        color: Colors.grey,
                                        size: 30,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: (){
                                        _pickImages(4);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(28),
                                            color:  const Color
                                                .fromRGBO(
                                                233,
                                                64,
                                                87,
                                                1)
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Icon(Icons.add_circle,color: Colors.white,),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          height: 120,
                          width: width / 3 - 10,
                          child: DottedBorder(
                            color: const Color.fromRGBO(233, 64, 87, 1),
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(15),
                            dashPattern: const [10, 5, 10, 5, 10, 5],
                            child: (sixthImage != '')
                                ? Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: SizedBox(
                                      height: 120,
                                      width: width / 3 - 10,
                                      child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          child: Image.file(
                                            File(sixthImage),
                                            fit: BoxFit.cover,
                                          ))),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: IconButton(
                                        onPressed: () {
                                          _removeImage(5,sixthImage);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 25,
                                        )))
                              ],
                            )
                                : Column(
                              children: [
                                const Padding(
                                  padding:
                                  EdgeInsets.only(top: 10),
                                  child: Center(
                                      child: Icon(
                                        Icons.emoji_emotions_outlined,
                                        color: Colors.grey,
                                        size: 30,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: (){
                                        _pickImages(5);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(28),
                                            color:  const Color
                                                .fromRGBO(
                                                233,
                                                64,
                                                87,
                                                1)
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Icon(Icons.add_circle,color: Colors.white,),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    "Atleast 3 photos are required",
                    textAlign: TextAlign.left ,
                    style: TextStyle(color: Colors.white24, fontSize: 15)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
        bottomNavigationBar: SizedBox(
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
                child: InkWell( borderRadius: BorderRadius.circular(30),
                  onTap: ()async{
                    if (firstImage != '' && !_selectedImages.contains(firstImage)) {
                      _selectedImages.add(firstImage);
                    }
                    if (secondImage != ''&& !_selectedImages.contains(secondImage)) {
                      _selectedImages.add(secondImage);
                    }
                    if (thirdImage != '' && !_selectedImages.contains(thirdImage)) {
                      _selectedImages.add(thirdImage);
                    }
                    if (fourthImage != '' && !_selectedImages.contains(fourthImage)) {
                      _selectedImages.add(fourthImage);
                    }
                    if (fifthImage != '' && !_selectedImages.contains(fifthImage)) {
                      _selectedImages.add(fifthImage);
                    }
                    if (sixthImage != '' && !_selectedImages.contains(sixthImage)) {
                      _selectedImages.add(sixthImage);
                    }
                    if(_selectedImages.length<3){
                      CommonToast.toastErrorMessage("Atleast 3 photos are required");
                      return ;
                    }
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    String? userId = pref.getString('userId');
                    await _uploadImages(userId);

                  },
                  child:   Center(
                    child:isLoading ? CommonLoader.animLoader() : const Text(
                        "Continue",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )
                    ),
                  ),
                ),
              )
          ),
        ),
    );
  }
}
