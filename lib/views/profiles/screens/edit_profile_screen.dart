import 'package:datingapp/views/profiles/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../common/loader.dart';
import '../../../common/toast.dart';

class EditProfilePage extends StatefulWidget {
   int ? relationShip;
   EditProfilePage({super.key, this.relationShip});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  int ?_value;
  String relationships='';
  @override
  void initState() {
    super.initState();
   _value = widget.relationShip;
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    if (_value == 1) {
      relationships = "single";
    } else if (_value == 2) {
      relationships = "married";
    } else if (_value == 3) {
      relationships = "widowed";
    } else if (_value == 4) {
      relationships = "divorce";
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 0, right: 5),
          child: Row(
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
              const SizedBox(width: 15,),
              const Text(
                "Update Profile",
                style: TextStyle(
                  fontFamily: "Outfit",
                    color: Colors.white, fontSize: 26),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      backgroundColor: Colors.black,
      body: Consumer<ProfileProvider>(
        builder: (context,provider,child){
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 12),
                  child: Text(
                    "Relationship",
                    style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: "Outfit",),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  spacing: 8.0,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: ChoiceChip(
                          checkmarkColor: Colors.white ,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: _value == 1 ? Colors.red : Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          label: const SizedBox(
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Single",
                                    style: TextStyle(fontFamily: "Outfit",
                                        color: Colors.white, fontSize: 18),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          selected: _value == 1,
                          selectedColor: const Color.fromRGBO(229, 67, 97, 1),
                          labelStyle: TextStyle(
                              color: _value == 1 ? Colors.white : Colors.black),
                          onSelected: (_) {
                            setState(() => _value = 1);
                          }),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(top: 15, left: 15, right: 15),
                      child: ChoiceChip(
                          checkmarkColor: Colors.white ,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: _value == 2
                                    ? Colors.red
                                    : Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          label: const SizedBox(
                            height: 35,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Married",
                                    style:  TextStyle(fontFamily: "Outfit",
                                        color: Colors.white,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                              ],
                            ),
                          ),
                          selected: _value == 2,
                          selectedColor: const Color.fromRGBO(229, 67, 97, 1),
                          labelStyle: TextStyle(
                              color: _value == 2
                                  ? Colors.white
                                  : Colors.black),
                          onSelected: (_) {
                            setState(() => _value = 2);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15,top: 15),
                      child: ChoiceChip(
                          checkmarkColor: Colors.white ,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: _value == 3
                                    ? Colors.red
                                    : Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          label: const SizedBox(
                            height: 35,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Widowed",
                                    style: TextStyle(fontFamily: "Outfit",
                                        color: Colors.white,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                              ],
                            ),
                          ),
                          selected: _value == 3,
                          selectedColor: const Color.fromRGBO(229, 67, 97, 1),
                          labelStyle: TextStyle(
                              color: _value == 3
                                  ? Colors.white
                                  : Colors.black),
                          onSelected: (_) {
                            setState(() => _value = 3);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15,top: 15),
                      child: ChoiceChip( checkmarkColor: Colors.white ,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: _value == 4
                                    ? Colors.red
                                    : Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          label: const SizedBox(
                            height: 35,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Divorced",
                                    style:  TextStyle(fontFamily: "Outfit",
                                        color: Colors.white,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                              ],
                            ),
                          ),
                          selected: _value == 4,
                          selectedColor: const Color.fromRGBO(229, 67, 97, 1),
                          labelStyle: TextStyle(
                              color: _value == 4
                                  ? Colors.white
                                  : Colors.black),
                          onSelected: (_) {
                            setState(() => _value = 4);
                          }),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 25),
                  child: Text(
                    "About us",
                    style:TextStyle(fontFamily: "Outfit",color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15, left: 20, right: 20,bottom: 40),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: provider.updateAboutController,
                    minLines: 3,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    cursorColor: Colors.red,
                    decoration:  InputDecoration(
                      enabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromRGBO(161, 55, 139, 1), width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      filled: true,
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 0,
                          color: Color.fromRGBO(229, 67, 97, 1),
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
        bottomNavigationBar: Consumer<ProfileProvider>(
          builder: (context,provider,child){
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
                      onTap: ()async{
                         final response = await provider.updateProfileApi(relationships);
                        if(response["status"]==true){
                          Navigator.of(context).pop();
                          // if(context.mounted) Navigator.pushReplacementNamed(context, RoutesName.interestedInScreen);
                        }else{
                          CommonToast.toastErrorMessage(response["message"]);
                        }
                      },
                      child: Center(
                        child: provider.updateProfileLoading ? CommonLoader.animLoader() : const Text(
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
            );
          },
        )
    );
  }
}
