import 'package:datingapp/views/cms/provider/cms_provider.dart';
import 'package:datingapp/views/feed/provider/feed_provider.dart';
import 'package:datingapp/views/hitmeup/provider/hitmeup_provider.dart';
import 'package:datingapp/views/home/provider/home_provider.dart';
import 'package:datingapp/views/matchings/provider/matching_provider.dart';
import 'package:datingapp/views/profiles/provider/profile_provider.dart';
import 'package:datingapp/views/registration_screens/provider/auth_provider.dart';
import 'package:datingapp/views/subscription/provider/subscription_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'config/routes/route.dart';
import 'config/routes/route_name.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => SubscriptionProvider()),
        ChangeNotifierProvider(create: (context) => FeedProvider()),
        ChangeNotifierProvider(create: (context) => CMSProvider()),
        ChangeNotifierProvider(create: (context) => MatchingProvider()),
        ChangeNotifierProvider(create: (context) => HitMeUpProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                scrolledUnderElevation: 0,
                titleTextStyle: TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                )), fontFamily: "Outfit",
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.black
            ),
            useMaterial3: true),
        // debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.firstSplashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
