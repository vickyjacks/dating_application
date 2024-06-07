import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../common/loader.dart';
import '../../../common/toast.dart';
import '../../../config/routes/route_name.dart';
import '../provider/auth_provider.dart';
import '../model/interests_model.dart';

class PassionScreen extends StatefulWidget {
  const PassionScreen({super.key});

  @override
  State<PassionScreen> createState() => _PassionScreenState();
}

class _PassionScreenState extends State<PassionScreen> {
  List<InterestScreenModel> interestModelList = [
    InterestScreenModel(titles: "Photography", icons: Icons.photo_camera_front_outlined),
    InterestScreenModel(titles: "Shopping", icons: Icons.shopping_bag_outlined),
    InterestScreenModel(titles: "Karaoke", icons: Icons.mic),
    InterestScreenModel(titles: "Yoga", icons: Icons.yard_outlined),
    InterestScreenModel(titles: "Cooking", icons: Icons.cookie_outlined),
    InterestScreenModel(titles: "Tennis", icons: Icons.sports_tennis_outlined),
    InterestScreenModel(titles: "Run", icons: Icons.run_circle_outlined),
    InterestScreenModel(titles: "Swimming", icons: Icons.water_outlined),
    InterestScreenModel(titles: "Art", icons: Icons.color_lens_outlined),
    InterestScreenModel(titles: "Traveling", icons: Icons.car_crash_outlined),
    InterestScreenModel(titles: "Extreme", icons: Icons.bakery_dining_outlined),
    InterestScreenModel(titles: "Music", icons: Icons.music_note_outlined),
    InterestScreenModel(titles: "Drink", icons: Icons.local_drink_outlined),
    InterestScreenModel(titles: "Video games", icons: Icons.video_collection_outlined),
  ];
  final List<String> selectedChips = [];
  bool isSelected(String chip) {
    return selectedChips.contains(chip);
  }

  List searchUpcomingList = [];
  @override
  void initState() {
    // TODO: implement initState
    searchUpcomingList = interestModelList;
    super.initState();
  }

  void selectChip(String chip) {
    setState(() {
      if (isSelected(chip)) {
        selectedChips.remove(chip);
      } else {
        selectedChips.add(chip);
      }
    });
  }

  void filterList(String searchText) {
    setState(() {
      searchUpcomingList = interestModelList.where((event) => event.titles.toLowerCase().contains(searchText.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> selectData = List.generate(selectedChips.length, (index) => selectedChips[index]);
    String userInterests = selectData.join(', ');
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Interests",
                    style:TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Select a few of your interests and let everyone know what you’re passionate about.",
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 3, left: 3),
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              // height: height * 0.05,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white30, width: 2),
                color: Colors.black,
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextFormField(
                onChanged: (text) {
                  filterList(text); // Call the filter function
                },
                style: const TextStyle(color: Colors.white38),
                decoration: const InputDecoration(suffixIcon: Icon(Icons.search), hintText: "Search...", border: InputBorder.none, hintStyle: TextStyle(color: Color(0xffE94057), fontFamily: "Outfit")),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: GridView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: searchUpcomingList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 55),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: FilterChip(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.white,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
                      showCheckmark: false,
                      label: Row(
                        children: [
                          Icon(searchUpcomingList[index].icons, color: const Color(0xffE94057)),
                          const SizedBox(width: 10),
                          Text(
                            searchUpcomingList[index].titles,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.699999988079071),
                              fontSize: 14,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      selected: isSelected(searchUpcomingList[index].titles),
                      onSelected: (bool selected) {
                        selectChip(searchUpcomingList[index].titles);
                      },
                      selectedColor: Color(0xffE94057),
                    ),
                  );
                },
              ),
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
                        final response = await provider.passionPostApi(userInterests);
                        if(response["status"]==true){
                          if(context.mounted) Navigator.pushReplacementNamed(context, RoutesName.dobScreen);
                        }else{
                          CommonToast.toastErrorMessage(response["message"]);
                        }
                      },
                      child: Center(
                        child: provider.passionLoading ? CommonLoader.animLoader() : const Text(
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
