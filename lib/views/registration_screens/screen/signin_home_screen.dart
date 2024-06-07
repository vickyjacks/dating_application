import 'package:datingapp/common/button.dart';
import 'package:datingapp/config/routes/route_name.dart';
import 'package:flutter/material.dart';
import '../../../const/color.dart';

class SignInHomeScreen extends StatelessWidget {
  const SignInHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height * 0.15,
              // color: Colors.red,
            ),
            SizedBox(
              height: height * 0.30,
              child:  Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset("assets/png_img/new_dostanaa_logo.png",fit: BoxFit.fill,),
                ),
              ),
            ),

            SizedBox(
              height: height * 0.03,
              child:  const Center(
                child: Text(
                  'Sign In / Sign up to continue',
                  style: TextStyle(color: Colors.white,
                    fontFamily: "Outfit",
                    fontSize: 18,
                    fontWeight: FontWeight.w400,)
                ),
              ),
            ),
            SizedBox(
              height: height * 0.08,
              child: Center(
                child: CustomButtons(width: 220,title: "Enter Mobile No.",height: 45.0,onPressed:  (){
                  Navigator.pushNamed(context, RoutesName.phoneNumberScreen);
                }
                    // pushAndRemoveUntil(context,const PhoneNumberScreen())
                ),
              ),
            ),
            Container(
              height: height * 0.14,
              // color: Colors.red
            ),
            Container(
              height: height * 0.22,
              // color: Colors.red
            ),
            SizedBox(
              height: height * 0.05,
              // color: Colors.blue,
              child: Center(
                child:  Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: (){
                          // materialPageRoute(context, const TermsConditionScreen());
                        },
                        child: const Text(
                          'Terms of Conditions',
                          style:  TextStyle(
                            fontFamily: "Outfit",
                            color: AppColor.appTextColored,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )
                        ),
                      ),
                      const SizedBox(width: 50),
                      TextButton(
                        onPressed: (){
                          // materialPageRoute(context, const PrivacyPolicyScreen());
                        },
                        child: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontFamily: "Outfit",
                            color: AppColor.appTextColored,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),   Container(
              height: height * 0.03,
              // color: Colors.green
            ),

          ],
        ));
  }
}
