import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../common/loader.dart';
import '../../../common/toast.dart';
import '../../../config/routes/route_name.dart';
import '../provider/auth_provider.dart';

class SexualityScreen extends StatefulWidget {
  const SexualityScreen({super.key});

  @override
  State<SexualityScreen> createState() => SexualityScreenState();
}

class SexualityScreenState extends State<SexualityScreen> {
  int _value = 0;
  String sexuality = '';
  @override
  Widget build(BuildContext context) {
    if (_value == 1) {
      sexuality = "prefer not to say";
    } else if (_value == 2) {
      sexuality = "straight";
    } else if (_value == 3) {
      sexuality = "gay";
    } else if (_value == 4) {
      sexuality = "lesbian";
    } else if (_value == 5) {
      sexuality = "bisexual";
    }
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: Row(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(left: 0, top: 0),
        //       child: Ink(
        //         decoration: ShapeDecoration(
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(10),
        //               side: const BorderSide(
        //                 color: Colors.white30,
        //                 width: 1,
        //               )),
        //         ),
        //         child: IconButton(
        //           icon: const Icon(Icons.arrow_back_ios),
        //           color: const Color.fromRGBO(233, 64, 87, 1),
        //           iconSize: 15,
        //           onPressed: () => Navigator.pop(context),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(left: 15, top: 0),
        //       child: Text(
        //           "",
        //           style: GoogleFonts.outfit(
        //             textStyle:  const TextStyle(
        //               fontSize: 22,
        //               color: Colors.white,
        //             ),
        //           )
        //       ),
        //     ),
        //   ],
        // ), //<Widget>[]
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 30),
              child: Text(
                "Sexuality",
                style:TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w400)
              ),
            ),
          ),
          Container(
            height: height * 0.07,
            // color: Colors.red,
          ),
          SizedBox(
            height: height * 0.45,
            child: Wrap(
              spacing: 8.0,
              children: [
                Padding(
                padding: const EdgeInsets.only( left: 15, right: 15),
                child: ChoiceChip(
                    checkmarkColor: Colors.white,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: _value == 2 ? Colors.red : Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    label: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Straight",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    selected: _value == 2,
                    selectedColor: const Color.fromRGBO(229, 67, 97, 1),
                    labelStyle: TextStyle(
                        color: _value == 2 ? Colors.white : Colors.black),
                    onSelected: (_) {
                      setState(() => _value = 2);
                    }),
              ),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ChoiceChip(
                      checkmarkColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: _value == 3 ? Colors.red : Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      label: SizedBox(
                        width: MediaQuery.of(context).size.width - 66,
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Gay",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                          ],
                        ),
                      ),
                      selected: _value == 3,
                      selectedColor: const Color.fromRGBO(229, 67, 97, 1),
                      labelStyle: TextStyle(
                          color: _value == 3 ? Colors.white : Colors.black),
                      onSelected: (_) {
                        setState(() => _value = 3);
                      }),
                ),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ChoiceChip(
                      checkmarkColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: _value == 4 ? Colors.red : Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      label: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Lesbian",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                          ],
                        ),
                      ),
                      selected: _value == 4,
                      selectedColor: const Color.fromRGBO(229, 67, 97, 1),
                      labelStyle: TextStyle(
                          color: _value == 4 ? Colors.white : Colors.black),
                      onSelected: (_) {
                        setState(() => _value = 4);
                      }),
                ),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ChoiceChip(
                    checkmarkColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: _value == 5 ? Colors.red : Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      label: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Bisexual",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                          ],
                        ),
                      ),
                      selected: _value == 5,
                      selectedColor: const Color.fromRGBO(229, 67, 97, 1),
                      labelStyle: TextStyle(
                          color: _value == 5 ? Colors.white : Colors.black),
                      onSelected: (_) {
                        setState(() => _value = 5);
                      }),
                ),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ChoiceChip(
                      checkmarkColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: _value == 1 ? Colors.red : Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      label: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Prefer not to say",
                                style: const TextStyle(
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
              ],
            ),
          ),
        ],
      ),

        bottomNavigationBar: Consumer<AuthProvider>(
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
                        final response = await provider.sexualityPostApi(sexuality);
                        if(response["status"]==true){
                          if(context.mounted) Navigator.pushReplacementNamed(context, RoutesName.relationshipScreen);
                        }else{
                          CommonToast.toastErrorMessage(response["message"]);
                        }
                      },
                      child: Center(
                        child: provider.sexualityLoading ? CommonLoader.animLoader() : const Text(
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
