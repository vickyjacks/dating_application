import 'package:datingapp/config/routes/route_name.dart';
import 'package:datingapp/views/profiles/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String imageBaseUrl = "https://dostanaa.in/public/upload/";
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context,provider,child){
        return provider.fetchUserProfileLoading ? Scaffold(
          body: Shimmer.fromColors(
              baseColor: Colors.grey.shade100,
              highlightColor: Colors.grey.shade300,
            child : Column(
              children: [
                Container(
                  height: 20,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey
                  ),
                )
              ],
            )
          ),
        ) : Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: Consumer<ProfileProvider>(
              builder: (context,provider,child){
                return InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: ()async{
                    Navigator.pushNamed(context, RoutesName.profileHomeScreen);
                    // materialPageRoute(context, const ProfileHomeScreen());
                  },
                  child: Container(
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "$imageBaseUrl${provider.fetchUserProfileDetailsModel.data!.profilePic}",
                        ),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.grey.shade200)
                      ),
                    ),
                  ),
                );
              },
            ),
            actions: [
              Container(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () async {
                      //     materialPageRoute(context,  MyHomePage());
                      // materialPageRoute(context, const NotificationScreen());
                    },
                    child:  Icon(
                      Icons.notifications,
                      size: 30,
                      color: Colors.grey.shade400,
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () async {
                      // Provider.of<ChatProvider>(context, listen: false).fetchHomeChatListDataNewProvider(context);
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UserChatHomeScreen()));
                    },
                    child: const Image(
                      image: AssetImage("assets/png_img/chats_message.png"),
                    )),
              ),
            ],
          ),

          body: const Center(
            child: Text("Hello Home",style: TextStyle(color: Colors.white),),
          ),
        );
      }
    );
  }
}
