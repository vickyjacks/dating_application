import 'package:datingapp/common/toast.dart';
import 'package:datingapp/config/routes/route_name.dart';
import 'package:datingapp/views/registration_screens/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../common/loader.dart';
import '../../../const/color.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: Consumer<AuthProvider>(
        builder: (context,provider,child){
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "My Mobile No.",
                  style: TextStyle(
                    fontFamily: "Outfit",
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Please enter your valid phone number. we will send you a 4-digit  code to verify your account.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      color: AppColor.appTextColorWhite.withOpacity(0.699999988079071),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 55,
                      height: 51,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade600),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                          child: Text(
                            '+91',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 105,
                        height: 51,
                        child: TextFormField(
                          controller: provider.phoneController,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14, // Adjust as needed
                            fontFamily: 'Outfit', // Adjust as needed
                            fontWeight: FontWeight.w400, // Adjust as needed
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(width: 0.50, color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: "Enter Phone Number",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          );
        },
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
                child: InkWell( borderRadius: BorderRadius.circular(30),
                  onTap: ()async{
                    final response = await provider.sendOtpApi();
                    if(response["status"]==true){
                     if(context.mounted) Navigator.pushReplacementNamed(context, RoutesName.otpScreen);
                    }else{
                      CommonToast.toastErrorMessage(response["message"]);
                    }
                  },
                  child:   Center(
                    child:provider.loginLoading ? CommonLoader.animLoader() : const Text(
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

              // CustomButtons(
              //     onPressed: () async {
              //       final response = await provider.loginApi();
              //       print("+++++++++++131 :: $response");
              //       if(response["status"]==true){
              //         Navigator.pushNamed(context, RoutesName.otpScreen);
              //       }else{
              //         CommonToast.toastErrorMessage(response["message"]);
              //       }
              //       // Navigator.pushNamed(context, RoutesName.otpScreen);
              //     },
              //     title: "Continue",
              //     height: 45.0,
              //     width: 220.0, loading: provider.otpLoading,),
            ),
          );
        },
      )
    );
  }
}
