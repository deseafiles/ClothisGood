// import 'package:android/domain/models/weathers/location_data.dart';
// import 'package:android/utils/constant.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
//
// import 'package:flutter/services.dart';
//
// class LocationScreen extends StatefulWidget {
//   final LocationData? initialLocation;
//
//   const LocationScreen({
//     super.key,
//     this.initialLocation,
//   });
//
//   @override
//   State<LocationScreen> createState() => _LocationScreenState();
// }
//
// class _LocationScreenState extends State<LocationScreen> {
//   List<LocationData> locations = [];
//
//   LocationData? selectedLocation;
//
//   bool isLoading = true;
//   String? errorMessage;
//
//   String searchKeyword = '';
//
//   // Toggle current location
//   bool useCurrentLocation = false;
//
//   @override
//   void initState() {
//     super.initState();
//     loadLocations();
//   }
//
//   Future<void> loadLocations() async {
//     try {
//       final response = await rootBundle.loadString(
//         'assets/locations.json',
//       );
//
//       final List<dynamic> data = jsonDecode(response);
//
//       final result = data.map((item) {
//         return LocationData.fromJson(item);
//       }).toList();
//
//       if (!mounted) return;
//
//       final currentLoc = ref.watch('getLangLongProvider');
//     } catch (e) {
//       if (!mounted) return;
//
//       setState(() {
//         errorMessage = e.toString();
//         isLoading = false;
//       });
//     }
//   }
//
//   List<LocationData> get filteredLocations {
//     if (searchKeyword.isEmpty) {
//       return locations;
//     }
//
//     return locations.where((location) {
//       return location.name.toLowerCase().contains(
//             searchKeyword.toLowerCase(),
//           ) ||
//           location.district.toLowerCase().contains(
//             searchKeyword.toLowerCase(),
//           );
//     }).toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//
//       appBar: AppBar(
//         title: const Text('Find Location'),
//         actions: [
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 'Current location',
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontFamily: 'Inter',
//                   color: AppColors.textPrimary,
//                 ),
//               ),
//               Switch(
//                 value: useCurrentLocation,
//                 activeColor: AppColors.primary,
//                 onChanged: (value) {
//                   setState(() {
//                     useCurrentLocation = value;
//                   });
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//
//       body: isLoading
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : errorMessage != null
//               ? Center(
//                   child: Text('Failed to load locations: $errorMessage'),
//                 )
//               : buildLocationList(),
//     );
//   }
//
//   Widget buildLocationList() {
//     final filtered = filteredLocations;
//
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Choose your location',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Lora',
//               color: AppColors.primary,
//             ),
//           ),
//
//           const SizedBox(height: 8),
//
//           Text(
//             'Select your kelurahan in Balikpapan.',
//             style: TextStyle(
//               fontSize: 13,
//               fontFamily: 'Inter',
//               color: AppColors.textSecondary,
//             ),
//           ),
//
//           const SizedBox(height: 16),
//
//           TextField(
//             enabled: !useCurrentLocation,
//             onChanged: (value) {
//               setState(() {
//                 searchKeyword = value;
//               });
//             },
//             decoration: InputDecoration(
//               hintText: 'Search kelurahan...',
//               prefixIcon: Icon(
//                 Icons.search,
//                 color: AppColors.primary,
//               ),
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//
//           const SizedBox(height: 12),
//
//           Expanded(
//             child: filtered.isEmpty
//                 ? const Center(
//                     child: Text('Location not found'),
//                   )
//                 : ListView.builder(
//                     itemCount: filtered.length,
//                     itemBuilder: (context, index) {
//                       final location = filtered[index];
//
//                       return Card(
//                         color: Colors.white,
//                         child: RadioListTile<String>(
//                           value: location.name,
//                           groupValue: selectedLocation?.name,
//                           activeColor: AppColors.primary,
//                           secondary: Icon(
//                             Icons.location_on_outlined,
//                             color: AppColors.primary,
//                           ),
//                           title: Text(
//                             location.name,
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: 'Inter',
//                               color: AppColors.textPrimary,
//                             ),
//                           ),
//                           subtitle: Text(
//                             location.district,
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontFamily: 'Inter',
//                               color: AppColors.textSecondary,
//                             ),
//                           ),
//                           onChanged: useCurrentLocation
//                               ? null
//                               : (value) {
//                                   if (value == null) return;
//
//                                   setState(() {
//                                     selectedLocation = location;
//                                   });
//                                 },
//                         ),
//                       );
//                     },
//                   ),
//           ),
//
//           const SizedBox(height: 12),
//
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: useCurrentLocation || selectedLocation == null
//                   ? null
//                   : () {
//                       Navigator.pop(context, selectedLocation);
//                     },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.primary,
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(vertical: 14),
//               ),
//               child: const Text('Save Location'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
