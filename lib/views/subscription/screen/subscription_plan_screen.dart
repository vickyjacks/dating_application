import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../common/loader.dart';
import '../../../common/toast.dart';
import '../provider/subscription_provider.dart';

class SubscriptionPlansScreen extends StatefulWidget {
  const SubscriptionPlansScreen({super.key});

  @override
  State<SubscriptionPlansScreen> createState() => SubscriptionPlansScreenState();
}

class SubscriptionPlansScreenState extends State<SubscriptionPlansScreen> {
  int selectedContainerIndex = -1;

  void handleContainerTap(int index) {
    setState(() {
      selectedContainerIndex = (selectedContainerIndex == index) ? -1 : index;
    });
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<SubscriptionProvider>(context, listen: false).fetchSubscriptionPlanDetailsApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Ink(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Colors.white30,
                      width: 1,
                    ),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: const Color.fromRGBO(233, 64, 87, 1),
                  iconSize: 15,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Manage Subscription",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Consumer<SubscriptionProvider>(
        builder: (context, provider, child) {
          // if (provider.fetchSubscriptionLoading==false) {
          if (provider.fetchSubscriptionLoading) {
            return Shimmer.fromColors(
              baseColor: Colors.red.shade100,
              highlightColor: Colors.red.shade300,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 15,
                      width: 170,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.red),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 15,
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 15,
                      width: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 80,
                          width: width/3-25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.red
                          ),
                        ),
                        Container(
                          height: 80,
                          width: width/3-25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.red
                          ),
                        ),
                        Container(
                          height: 80,
                          width: width/3-25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.red
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 15,
                      width: 170,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.red),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 200,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            final currentPlan = provider.fetchSubscriptionPlanDetailModel.currntplan;
            final subscriptions = provider.fetchSubscriptionPlanDetailModel.subscription ?? [];
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    if (currentPlan != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        child: Container(
                          width: width,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(255, 116, 94, 0.73),
                                Color.fromRGBO(54, 54, 59, 0),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              _buildRow("Current Plan", currentPlan.type),
                              const SizedBox(height: 15),
                              _buildRow(
                                "Time Period",
                                currentPlan.type == "Free" ? currentPlan.title : "Not Defined",
                              ),
                              if (currentPlan.type == "Paid") ...[
                                const SizedBox(height: 15),
                                _buildRow("Plan", currentPlan.title),
                                const SizedBox(height: 15),
                                _buildRow("Payment", "Not Defined"),
                              ],
                              const SizedBox(height: 25),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        primary: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: subscriptions.length,
                        itemBuilder: (context, index) {
                          final subscription = subscriptions[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: GestureDetector(
                              onTap: () {
                                provider.saveSubscriptionID(subscription.subscriptionId);
                                handleContainerTap(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: selectedContainerIndex == index ? Colors.red : Colors.grey,
                                    width: 1.5,
                                  ),
                                ),
                                width: width / 2.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (selectedContainerIndex == index)...[ const Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                       Padding(
                                            padding: EdgeInsets.only(right: 8.0, top: 8.0),
                                            child: Icon(Icons.check, size: 25, color: Colors.red),
                                          ),
                                      ],
                                    )],
                                    Center(
                                      child: Text(
                                        subscription.title,
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        subscription.month,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "Rs. ${subscription.price}",
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SubscriptionFeatureList(),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            );
          }
        },
      ),
        bottomNavigationBar: Consumer<SubscriptionProvider>(
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
                        final response = await provider.buySubscriptionApi();
                        if(response["status"]==true){
                          CommonToast.toastErrorMessage(response["message"]);
                         // if(context.mounted) Navigator.pushReplacementNamed(context, RoutesName.genderScreen);
                        }else{
                          CommonToast.toastErrorMessage(response["message"]);
                        }
                      },
                      child: Center(
                        child: provider.buySubscriptionLoading ? CommonLoader.animLoader() : const Text(
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

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class SubscriptionFeatureList extends StatelessWidget {
  const SubscriptionFeatureList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey, width: 1.5),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              SubscriptionFeatureItem(
                icon: Icons.done,
                title: 'Unlimited Likes',
              ),
              SizedBox(height: 10),
              SubscriptionFeatureItem(
                icon: Icons.done,
                title: 'Unlimited Rewinds',
              ),
              SizedBox(height: 10),
              SubscriptionFeatureItem(
                icon: Icons.done,
                title: 'Passport',
                subtitle: 'Match and chat with people anywhere in the world',
              ),
              SizedBox(height: 10),
              SubscriptionFeatureItem(
                icon: Icons.done,
                title: 'Control your profile',
                subtitle: 'Only show what you want them to know.',
              ),
              SizedBox(height: 10),
              SubscriptionFeatureItem(
                icon: Icons.done,
                title: 'Control who you see',
                subtitle: 'Choose the type of people you want to connect with',
              ),
              SizedBox(height: 10),
              SubscriptionFeatureItem(
                icon: Icons.done,
                title: 'Hide ADS',
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class SubscriptionFeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const SubscriptionFeatureItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 28, color: Colors.black),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
