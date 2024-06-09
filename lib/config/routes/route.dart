import 'package:datingapp/config/routes/route_name.dart';
import 'package:datingapp/views/hitmeup/screen/hitmeup_create_screen.dart';
import 'package:datingapp/views/registration_screens/screen/dob_screen.dart';
import 'package:datingapp/views/splash/app_launcher.dart';
import 'package:datingapp/views/splash/first_splash_screen.dart';
import 'package:datingapp/views/splash/second_splash_screen.dart';
import 'package:flutter/material.dart';
import '../../bottom_nav_screen.dart';
import '../../views/cms/screen/aboutus_screen.dart';
import '../../views/cms/screen/help_center_screen.dart';
import '../../views/cms/screen/privacy_policy_screen.dart';
import '../../views/cms/screen/safety_screen.dart';
import '../../views/cms/screen/terms_and_condition_screen.dart';
import '../../views/feed/screen/feed_screen.dart';
import '../../views/feed/screen/upload_feed_screen.dart';
import '../../views/hitmeup/screen/hitmeup_request_screen.dart';
import '../../views/home/screen/home_screen.dart';
import '../../views/profiles/screens/edit_profile_screen.dart';
import '../../views/profiles/screens/profile_screen.dart';
import '../../views/registration_screens/screen/about_screen.dart';
import '../../views/registration_screens/screen/dating_type_screen.dart';
import '../../views/registration_screens/screen/distance_range_screen.dart';
import '../../views/registration_screens/screen/email_screen.dart';
import '../../views/registration_screens/screen/face_detection_screen.dart';
import '../../views/registration_screens/screen/gender_screen.dart';
import '../../views/registration_screens/screen/get_location_screen.dart';
import '../../views/registration_screens/screen/interested_in_screen.dart';
import '../../views/registration_screens/screen/name_screen.dart';
import '../../views/registration_screens/screen/otp_screen.dart';
import '../../views/registration_screens/screen/passion_screen.dart';
import '../../views/registration_screens/screen/phone_number_screen.dart';
import '../../views/registration_screens/screen/photos_screen.dart';
import '../../views/registration_screens/screen/relationship_screen.dart';
import '../../views/registration_screens/screen/sexuality_screen.dart';
import '../../views/registration_screens/screen/signin_home_screen.dart';
import '../../views/subscription/screen/subscription_plan_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.firstSplashScreen:
        return MaterialPageRoute(builder: (context) => const FirstSplashScreen());
      case RoutesName.secondSplashScreen:
        return MaterialPageRoute(builder: (context) => const SecondSplashScreen());
      case RoutesName.signInHomeScreen:
        return MaterialPageRoute(builder: (context) => const SignInHomeScreen());
      case RoutesName.phoneNumberScreen:
        return MaterialPageRoute(builder: (context) => const PhoneNumberScreen());
      case RoutesName.otpScreen:
        return MaterialPageRoute(builder: (context) => const OTPScreen());
      case RoutesName.appLauncher:
        return MaterialPageRoute(builder: (context) => const AppLauncher());
      case RoutesName.emailScreen:
        return MaterialPageRoute(builder: (context) => const EmailScreen());
      case RoutesName.nameScreen:
        return MaterialPageRoute(builder: (context) => const NameScreen());
      case RoutesName.genderScreen:
        return MaterialPageRoute(builder: (context) => const GenderScreen());
      case RoutesName.interestedInScreen:
        return MaterialPageRoute(builder: (context) => const InterestedInScreen()); 
      case RoutesName.sexualityScreen:
        return MaterialPageRoute(builder: (context) => const SexualityScreen());
      case RoutesName.relationshipScreen:
        return MaterialPageRoute(builder: (context) => const RelationshipScreen());
      case RoutesName.passionScreen:
        return MaterialPageRoute(builder: (context) => const PassionScreen());
      case RoutesName.dobScreen:
        return MaterialPageRoute(builder: (context) => const DOBScreen());
      case RoutesName.photosScreen:
        return MaterialPageRoute(builder: (context) => const PhotosScreen());
      case RoutesName.faceDetectionScreen:
        return MaterialPageRoute(builder: (context) => const FaceDetectionScreen());
      case RoutesName.datingTypeScreen:
        return MaterialPageRoute(builder: (context) => const DatingTypeScreen());
      case RoutesName.aboutScreen:
        return MaterialPageRoute(builder: (context) => const AboutScreen());
      case RoutesName.getLocationScreen:
        return MaterialPageRoute(builder: (context) => const GetLocationScreen());
      case RoutesName.distanceRangeScreen:
        return MaterialPageRoute(builder: (context) => const DistanceRangeScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.mainScreen:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case RoutesName.profileHomeScreen:
        return MaterialPageRoute(builder: (context) => const ProfileHomeScreen());
      case RoutesName.editProfilePage:
        return MaterialPageRoute(builder: (context) {
          final arg = settings.arguments as List;
          return EditProfilePage(
            relationShip: arg[0],
          );
        });
      case RoutesName.subscriptionPlansScreen:
        return MaterialPageRoute(builder: (context) => const SubscriptionPlansScreen());
      case RoutesName.showFeedScreen:
        return MaterialPageRoute(builder: (context) => const ShowFeedScreen());
      case RoutesName.uploadFeedScreen:
        return MaterialPageRoute(builder: (context) => const UploadFeedScreen());
      case RoutesName.aboutUsScreen:
        return MaterialPageRoute(builder: (context) => const AboutUsScreen());
      case RoutesName.safetyScreen:
        return MaterialPageRoute(builder: (context) => const SafetyScreen());
       case RoutesName.helpCenterScreen:
        return MaterialPageRoute(builder: (context) => const HelpCenterScreen());
      case RoutesName.termsConditionScreen:
        return MaterialPageRoute(builder: (context) => const TermsConditionScreen());
      case RoutesName.privacyPolicyScreen:
        return MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen());
       case RoutesName.hitMeUpRequestScreen:
        return MaterialPageRoute(builder: (context) => const HitMeUpRequestScreen());
         case RoutesName.createHitMeUpScreen:
        return MaterialPageRoute(builder: (context) =>  const CreateHitMeUpScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("No route generated!"),
            ),
          );
        });
    }
  }
}
