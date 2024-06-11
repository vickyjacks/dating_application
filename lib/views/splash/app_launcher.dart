import 'package:datingapp/common/loader.dart';
import 'package:datingapp/views/home/screen/home_screen.dart';
import 'package:datingapp/views/registration_screens/provider/auth_provider.dart';
import 'package:datingapp/views/splash/second_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '../../bottom_nav_screen.dart';
import '../profiles/provider/profile_provider.dart';
import '../registration_screens/screen/about_screen.dart';
import '../registration_screens/screen/dating_type_screen.dart';
import '../registration_screens/screen/distance_range_screen.dart';
import '../registration_screens/screen/dob_screen.dart';
import '../registration_screens/screen/email_screen.dart';
import '../registration_screens/screen/face_detection_screen.dart';
import '../registration_screens/screen/gender_screen.dart';
import '../registration_screens/screen/get_location_screen.dart';
import '../registration_screens/screen/interested_in_screen.dart';
import '../registration_screens/screen/name_screen.dart';
import '../registration_screens/screen/passion_screen.dart';
import '../registration_screens/screen/photos_screen.dart';
import '../registration_screens/screen/relationship_screen.dart';
import '../registration_screens/screen/sexuality_screen.dart';

class AppLauncher extends StatefulWidget {
  const AppLauncher({super.key});

  @override
  State<AppLauncher> createState() => _AppLauncherState();
}

class _AppLauncherState extends State<AppLauncher> {
  // NotificationsService notificationsService = NotificationsService();
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileProvider>(context, listen: false).fetchUserProfileDetailsApi();
    });

    // notificationsService.requestNotificationPermission();
    // notificationsService.firebaseNotificationInit(context);
    // notificationsService.setUpInterectMessage(context);
    // notificationsService.getDeviceToken().then((token) {
    //   Provider.of<AuthProvider>(context, listen: false).getDeviceToken(token);
    //   print('::****** FCM Token ******:: $token');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<AuthProvider>(context, listen: false).userSessionManageApi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: CommonLoader.animLoader(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text(
            'Error: ${snapshot.error}',
            style: const TextStyle(color: Colors.white),
          );
        } else {
          int code = Provider.of<AuthProvider>(context, listen: false).sessionStatusCode ?? 200;
          Widget targetScreen = Container();
          if (code == 201) {
            targetScreen = const SecondSplashScreen();
          } else if (code == 202) {
            targetScreen = const EmailScreen();
          } else if (code == 203) {
            targetScreen = const NameScreen();
          } else if (code == 204) {
            targetScreen = const GenderScreen();
          } else if (code == 205) {
            targetScreen = const InterestedInScreen();
          } else if (code == 206) {
            targetScreen = const SexualityScreen();
          } else if (code == 207) {
            targetScreen = const RelationshipScreen();
          } else if (code == 208) {
            targetScreen = const PassionScreen();
          } else if (code == 209) {
            targetScreen = const DOBScreen();
          } else if (code == 210) {
            targetScreen = const PhotosScreen();
          } else if (code == 211) {
            targetScreen = const FaceDetectionScreen();
          } else if (code == 212) {
            targetScreen = const DatingTypeScreen();
          } else if (code == 213) {
            targetScreen = const AboutScreen();
          } else if (code == 214) {
            targetScreen = const GetLocationScreen();
          } else if (code == 215) {
            targetScreen = const DistanceRangeScreen();
          } else if (code == 200) {
            // targetScreen = const HomeScreen();
            targetScreen = const MainScreen();
          }
          return GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => targetScreen));
            },
            child: targetScreen,
          );
        }
      },
    );
  }
}
