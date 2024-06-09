import 'package:datingapp/views/registration_screens/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../../common/loader.dart';
import '../../../common/toast.dart';
import '../../../config/routes/route_name.dart';
import '../../../const/color.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});
  @override
  State<OTPScreen> createState() => OTPScreenState();
}

class OTPScreenState extends State<OTPScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Text('Type the verification code we`ve send you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.appTextColorWhite.withOpacity(0.699999988079071),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
              ),
                Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "+91  ${provider.phoneController.text}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    // IconButton(
                    //   onPressed: (){
                    //     authProvider.phoneController.clear();
                    //   //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const PhoneNumberScreen()), (route) => false);
                    //     Navigator.push(context, MaterialPageRoute(builder: (context) => const PhoneNumberScreen()));
                    // //    Navigator.of(context).pop();
                    //   },
                    //     icon: const Icon(Icons.edit,color: Colors.red,)),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.20,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35, right: 35),
                        child: PinCodeTextField(
                          controller: provider.otpController,
                          cursorColor: Colors.black,
                          backgroundColor: Colors.transparent,
                          appContext: context,
                          length: 4,
                          animationType: AnimationType.fade,
                          blinkWhenObscuring: true,
                          pastedTextStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          pinTheme: PinTheme(
                            activeColor: const Color(0xFFE94057),
                            inactiveColor: const Color(0xFFffffff),
                            inactiveFillColor: Colors.black,
                            selectedFillColor: Colors.black,
                            activeFillColor: const Color(0xFFE94057),
                            disabledColor: const Color(0xFFE94057),
                            selectedColor: const Color(0xFFE94057),
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(8),
                            fieldHeight: 65,
                            fieldWidth: 65,
                          ),
                          animationDuration: const Duration(milliseconds: 300),
                          onChanged: (otp) {},
                          keyboardType: TextInputType.number,
                          enableActiveFill: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
                        final response = await provider.otpVerifyApi();
                        if(response["status"]==true){
                          provider.saveUserId(response["data"]["user_id"].toString());
                          if(context.mounted) Navigator.pushReplacementNamed(context, RoutesName.appLauncher);
                        }else{
                          CommonToast.toastErrorMessage(response["message"]);
                        }
                      },
                      child:   Center(
                        child:provider.otpLoading ? CommonLoader.animLoader() : const Text(
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
