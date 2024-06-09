import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../common/loader.dart';
import '../../../common/toast.dart';
import '../../../config/routes/route_name.dart';
import '../provider/auth_provider.dart';

class RelationshipScreen extends StatefulWidget {
  const RelationshipScreen({super.key});

  @override
  State<RelationshipScreen> createState() => _RelationshipScreenState();
}

class _RelationshipScreenState extends State<RelationshipScreen> {
  int _value = 0;
  String relationship='';
  @override
  Widget build(BuildContext context) {
    if (_value == 1) {
      relationship = "single";
    } else if (_value == 2) {
      relationship = "married";
    } else if (_value == 3) {
      relationship = "widowed";
    } else if (_value == 4) {
      relationship = "divorce";
    }
    final height = MediaQuery.of(context).size.height;
    // final width= MediaQuery.of(context).size.width;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            child: Padding(
              padding: EdgeInsets.only(left: 15,),
              child: Text(
                "Relationship Status",
                style:TextStyle(color: Colors.white,
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
              spacing: 18.0,
              children: [
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
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Single",
                                style:TextStyle(
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
                const SizedBox(height: 15,),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 15, right: 15),
                  child: ChoiceChip(
                      checkmarkColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color:
                            _value == 2 ? Colors.red : Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      label: SizedBox(
                        width: MediaQuery.of(context).size.width - 66,
                        height: 35,
                        child: const Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Married",
                                style: TextStyle(
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
                          color:
                          _value == 2 ? Colors.white : Colors.black),
                      onSelected: (_) {
                        setState(() => _value = 2);
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ChoiceChip(
                      checkmarkColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color:
                            _value == 3 ? Colors.red : Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      label: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        child: const Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Widowed",
                                style: TextStyle(
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
                          color:
                          _value == 3 ? Colors.white : Colors.black),
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
                            color:
                            _value == 4 ? Colors.red : Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      label: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        child: const Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Divorced",
                                style:  TextStyle(
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
                          color:
                          _value == 4 ? Colors.white : Colors.black),
                      onSelected: (_) {
                        setState(() => _value = 4);
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
                        final response = await provider.relationShipPostApi(relationship);
                        if(response["status"]==true){
                          if(context.mounted) Navigator.pushReplacementNamed(context, RoutesName.passionScreen);
                        }else{
                          CommonToast.toastErrorMessage(response["message"]);
                        }
                      },
                      child: Center(
                        child: provider.relationshipLoading ? CommonLoader.animLoader() : const Text(
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
