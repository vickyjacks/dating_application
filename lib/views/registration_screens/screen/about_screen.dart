
import 'package:datingapp/common/toast.dart';
import 'package:datingapp/views/registration_screens/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../common/loader.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15,),
            child: Text(
              "About you!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w400)
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "Please write the about you",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Center(
            child:  Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Consumer<AuthProvider>(builder: (context,provider,child){
                  return Container(
                    width: MediaQuery.of(context).size.width, margin: const EdgeInsets.only(left: 15,right: 15),
                    child: TextFormField(
                      controller: provider.aboutController,
                      maxLines: 8,
                      minLines: 5,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: "About",
                          border: InputBorder.none,
                          hintStyle:
                          TextStyle(color: Color(0xffCFCFCF))),
                    ),
                  );
                },
                ),
              ),
            ),
          ),
          // const Spacer(),
          // Center(
          //   child: Column(
          //     children: [
          //       Consumer<AuthenticationProvider>(builder: (context,authProvider,child){
          //         return  authProvider.isLoading ? const Center(
          //             child: CircularProgressIndicator(
          //               color: Color.fromRGBO(218, 74, 64, 1),
          //               strokeWidth: 5,
          //             )) : NormalButton(
          //             onPressed: () async {
          //               if (authProvider.aboutController.text!='') {
          //                 await authProvider.userAboutProvider(context);
          //                 if (authProvider.userAbouts['status'] == true) {
          //                   materialPageRoute(context, const GetLocationScreen());
          //                 }
          //               }else{
          //                 Utils.toastErrorMessage("Please enter the abouts");
          //               }
          //             },
          //             title: "Continue",
          //             height: 50.0,
          //             width: MediaQuery.of(context).size.width / 2);
          //       },
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 40,)
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
                        if (provider.aboutController.text!='') {
                         final response = await provider.aboutUsPostApi();
                          if (response['status'] == true) {
                            // materialPageRoute(context, const GetLocationScreen());
                          }
                        }else{
                          CommonToast.toastErrorMessage("Please enter the abouts");
                        }
                      },
                      child: Center(
                        child: provider.aboutUsLoading ? CommonLoader.animLoader() : const Text(
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
