import 'package:datingapp/config/routes/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideNavbarScreen extends StatefulWidget {
  const SideNavbarScreen({super.key});

  @override
  State<SideNavbarScreen> createState() => _SideNavbarScreenState();
}

class _SideNavbarScreenState extends State<SideNavbarScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 35),
            child: Text(
              "Settings",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10, bottom: 30),
            child: Text(
              "Manage your settings for better reach",
              style: TextStyle(fontSize: 14, color: Colors.white54),
            ),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage("assets/png_img/VIP.png"),
              height: 25,
            ),
            title: const Text(
              "Manage Subscription",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            onTap: () {
              // Provider.of<SubscriptionProvider>(context, listen: false).fetchSubscriptionPlanDetailsProvider(context);
              Navigator.pushNamed(context, RoutesName.subscriptionPlansScreen);
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.person_fill,
              color: Color.fromRGBO(229, 67, 97, 1),
            ),
            title: const Text(
              "About",
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            onTap: () {
               Navigator.pushNamed(context, RoutesName.aboutUsScreen);
            },
          ),
          ListTile(
            leading: const Image(
              image: AssetImage(
                "assets/png_img/safety.png",
              ),
            ),
            title: const Text(
              "Safety",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, RoutesName.safetyScreen);
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.exclamationmark_octagon_fill,
              color: Color.fromRGBO(229, 67, 97, 1),
            ),
            title: const Text(
              "Help Center",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, RoutesName.helpCenterScreen);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.event_note_outlined,
              color: Color.fromRGBO(229, 67, 97, 1),
            ),
            title: const Text(
              "Terms & Conditions",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, RoutesName.termsConditionScreen);
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.exclamationmark_shield_fill,
              color: Color.fromRGBO(229, 67, 97, 1),
            ),
            title: const Text(
              "Privacy policy",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, RoutesName.privacyPolicyScreen);
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.delete_solid,
              color: Color.fromRGBO(229, 67, 97, 1),
            ),
            title: const Text(
              "Delete Account",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            onTap: () async {
              await showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: const Text(
                    "Delete Account",
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  content: const Text(
                    "Are you sure ?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        // await Provider.of<AuthenticationProvider>(context, listen: false).accountDeleteProvider(context);
                      },
                      child: const Text(
                        "Yes",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "No",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            onTap: () async {
              await showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: const Text(
                    "Log Out",
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  content: const Text(
                    "Are you sure ?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        pref.clear();
                        // pushAndRemoveUntil(context, const SecondSpashScreen());
                      },
                      child: const Text(
                        "Yes",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "No",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              );
            },
            leading: const Icon(
              CupertinoIcons.square_arrow_right_fill,
              color: Color.fromRGBO(229, 67, 97, 1),
            ),
            title: const Text(
              "Logout",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(229, 67, 97, 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
