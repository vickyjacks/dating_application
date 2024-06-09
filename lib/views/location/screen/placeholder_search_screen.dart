 
import 'package:datingapp/views/location/provider/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart'; 

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  State<SearchLocationScreen> createState() =>
      _SearchDriverLocationPageState();
}

class _SearchDriverLocationPageState extends State<SearchLocationScreen> {
  final searchLocationController = TextEditingController();
  @override
  void dispose() {
    searchLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.black,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const  Icon(Icons.close,size: 25,color: Colors.white,)),
          title:  const Text(
            'Choose Your Location',
            style:  TextStyle(color: Colors.white)
            ), 
          centerTitle: true,
        ),
        body: Consumer<LocationProvider>(
          builder: (context, locationProvider, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SearchTextfield(
                            onTap: () {
                             // locationProvider.selectDestination();
                            },
                            onChanged: (value) {
                              locationProvider.fetchPlaceSuggestions(value);
                            },
                            controller: searchLocationController,
                            hintText: 'From Your Location'),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                           locationProvider.placeSuggestionsList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              tileColor: Colors.black,
                              title: Text(locationProvider
                                  .placeSuggestionsList[index],style: const TextStyle(color: Colors.white),),
                              onTap: () async {
                                //!saving address
                                String selectedAddress = locationProvider
                                    .placeSuggestionsList[index];
                                //! saving coordinates
                                LatLng selectedCoordinates =
                                await locationProvider
                                    .getLatLngForAddress(selectedAddress);
                                locationProvider
                                    .saveAddressAndCoordinatesForFromDriver(
                                    selectedCoordinates.latitude,
                                    selectedCoordinates.longitude,
                                    selectedAddress,"","");
                                setState(() {
                                  searchLocationController.text =
                                      selectedAddress;
                                });
                                locationProvider.clearSuggestionList();
                              },
                            );
                          },

                       ),
                       InkWell(
                        onTap: (){
                           if (locationProvider.searchAddress.isNotEmpty) {
                            Navigator.of(context).pop();
                               // materialPageRoute(context, CreateHitMeUpScreen());
                                  searchLocationController.clear();
                                }
                                
                        },
                         child: Container(
                          decoration: BoxDecoration(
                                   gradient: const LinearGradient(colors: [
                                     Color.fromRGBO(161, 55, 139, 1),
                                     Color.fromRGBO(218, 74, 64, 1),
                                     Color.fromRGBO(229, 67, 97, 1),
                                   ]),
                                   borderRadius: BorderRadius.circular(30), 
                                 ),
                                 height: 40,
                                 width: 220,
                                 child: const Center(child: Text("Confirm")),
                         ),
                       ),
                        // NormalButton(onPressed: (){
                        //   if (locationProvider.searchAddress.isNotEmpty) {
                        //     Navigator.of(context).pop();
                        //        // materialPageRoute(context, CreateHitMeUpScreen());
                        //           searchLocationController.clear();
                        //         }

                        // }, title: "Confirm", height: 45, width: 220)
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

///@ event search location

class EventSearchLocationScreen extends StatefulWidget {
  const EventSearchLocationScreen({super.key});

  @override
  State<EventSearchLocationScreen> createState() =>
      _EventSearchDriverLocationPageState();
}

class _EventSearchDriverLocationPageState extends State<EventSearchLocationScreen> {
  final eventSearchLocationController = TextEditingController();
  @override
  void dispose() {
    // eventSearchLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          scrolledUnderElevation: 0,
          leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const  Icon(Icons.close,size: 25,color: Colors.white,)),
          title: const Text(
            'Choose Your Location',
            style:   TextStyle(color: Colors.white
            ),
          ),
          centerTitle: true,
        ),
        body: Consumer<LocationProvider>(
          builder: (context, locationProvider, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SearchTextfield(
                            onTap: () {
                              // locationProvider.selectDestination();
                            },
                            onChanged: (value) {
                              locationProvider.fetchPlaceSuggestions(value);
                            },
                            controller: eventSearchLocationController,
                            hintText: 'From Your Location'),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                          locationProvider.placeSuggestionsList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              tileColor: Colors.black,
                              title: Text(locationProvider
                                  .placeSuggestionsList[index],style: const TextStyle(color: Colors.white),),
                              onTap: () async {
                                //!saving address
                                String selectedAddress = locationProvider
                                    .placeSuggestionsList[index];
                                //! saving coordinates
                                LatLng selectedCoordinates =
                                await locationProvider
                                    .getLatLngForAddress(selectedAddress);
                                locationProvider.saveAddressAndCoordinatesForFromDriver(
                                    selectedCoordinates.latitude,
                                    selectedCoordinates.longitude,"",
                                    selectedAddress,"");
                                setState(() {
                                  eventSearchLocationController.text = selectedAddress;
                                });
                                locationProvider.clearSuggestionList();
                              },
                            );
                          },

                        ),


   InkWell(
                        onTap: (){
                          if (locationProvider.eventSearchAddress.isNotEmpty) {
                            Navigator.of(context).pop();
                            // materialPageRoute(context, const CreateEventScreen());
                           // eventSearchLocationController.clear();
                          }
                        },
                         child: Container(
                          decoration: BoxDecoration(
                                   gradient: const LinearGradient(colors: [
                                     Color.fromRGBO(161, 55, 139, 1),
                                     Color.fromRGBO(218, 74, 64, 1),
                                     Color.fromRGBO(229, 67, 97, 1),
                                   ]),
                                   borderRadius: BorderRadius.circular(30), 
                                 ),
                                 height: 40,
                                 width: 220,
                                 child: const Center(child: Text("Confirm")),
                         ),
                       ),

                        // NormalButton(onPressed: (){
                        //   print(eventSearchLocationController.text);
                        //   if (locationProvider.eventSearchAddress.isNotEmpty) {
                        //     Navigator.of(context).pop();
                        //     // materialPageRoute(context, const CreateEventScreen());
                        //    // eventSearchLocationController.clear();
                        //   }

                        // }, title: "Confirm", height: 45, width: 220)
                        // MyButton(
                        //     buttonText: 'Confirm',
                        //     buttonColor:
                        //     (locationProvider.driverFromAddress.isNotEmpty)
                        //         ? const Color(0xfffea501)
                        //         : Colors.grey,
                        //     onTap: () {
                        //       if (locationProvider
                        //           .driverFromAddress.isNotEmpty) {
                        //         changeScreen(
                        //             context, const DriverRentalHomeScreen());
                        //         destinationdriverLocationController.clear();
                        //       }
                        //     }),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}


///@ Filter search screen

class FilterSearchLocationScreen extends StatefulWidget {
  const FilterSearchLocationScreen({super.key});

  @override
  State<FilterSearchLocationScreen> createState() =>
      FilterSearchLocationScreenPageState();
}

class FilterSearchLocationScreenPageState extends State<FilterSearchLocationScreen> {
  final filterhLocationController = TextEditingController();
  @override
  void dispose() {
    filterhLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.black,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const  Icon(Icons.close,size: 25,color: Colors.white,)),
          title:  const Text(
            'Choose Your Location',
            style:  TextStyle(color: Colors.white
            ),
          ),
          centerTitle: true,
        ),
        body: Consumer<LocationProvider>(
          builder: (context, locationProvider, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SearchTextfield(
                            onTap: () {
                              // locationProvider.selectDestination();
                            },
                            onChanged: (value) {
                              locationProvider.fetchPlaceSuggestions(value);
                            },
                            controller: filterhLocationController,
                            hintText: 'Search Location'),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                          locationProvider.placeSuggestionsList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              tileColor: Colors.black,
                              title: Text(locationProvider
                                  .placeSuggestionsList[index],style: const TextStyle(color: Colors.white),),
                              onTap: () async {
                                //!saving address
                                String selectedAddress = locationProvider
                                    .placeSuggestionsList[index];
                                //! saving coordinates
                                LatLng selectedCoordinates =
                                await locationProvider
                                    .getLatLngForAddress(selectedAddress);
                                locationProvider
                                    .saveAddressAndCoordinatesForFromDriver(
                                    selectedCoordinates.latitude,
                                    selectedCoordinates.longitude,
                                    "","",selectedAddress);
                                setState(() {
                                  filterhLocationController.text =
                                      selectedAddress;
                                });
                                locationProvider.clearSuggestionList();
                              },
                            );
                          },

                        ),
                        InkWell(
                        onTap: (){
                         if (locationProvider.filterSearchAddress.isNotEmpty) {
                            Navigator.pop(context);
                            // materialPageRoute(context, CreateHitMeUpScreen());
                            filterhLocationController.clear();
                          }
                        },
                         child: Container(
                          decoration: BoxDecoration(
                                   gradient: const LinearGradient(colors: [
                                     Color.fromRGBO(161, 55, 139, 1),
                                     Color.fromRGBO(218, 74, 64, 1),
                                     Color.fromRGBO(229, 67, 97, 1),
                                   ]),
                                   borderRadius: BorderRadius.circular(30), 
                                 ),
                                 height: 40,
                                 width: 220,
                                 child: const Center(child: Text("Confirm")),
                         ),
                       ),
                        // NormalButton(onPressed: (){
                        //   if (locationProvider.filterSearchAddress.isNotEmpty) {
                        //     Navigator.pop(context);
                        //     // materialPageRoute(context, CreateHitMeUpScreen());
                        //     filterhLocationController.clear();
                        //   }

                        // }, title: "Confirm", height: 45, width: 220)
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

 
class SearchTextfield extends StatelessWidget {
  const SearchTextfield(
      {super.key,
        required this.controller,
        required this.hintText,
        required this.onChanged,
        required this.onTap});
  final TextEditingController controller;
  final String hintText;
  final void Function() onTap;

  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(

        onChanged: onChanged,
        controller: controller,
        onTap: onTap,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          filled: true,
          fillColor: Colors.white,
            prefixIcon: const Icon(
              Icons.location_on,
              color: Colors.red,
            ),
            hintText: hintText,
            hintStyle:   const TextStyle(color: Colors.black
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade400))),
      ),
    );
  }
}