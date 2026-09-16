// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
//
// void main() {
//   runApp(const MyApp());
//
//   String user = 'Alya';
// }
//
// // tidak memiliki state, jadi digunakan untuk membuat tampilan statis, button, text, icon, raised button
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ClothisGood',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.pink, 
//         // This is the theme of your application.
//         //
//         // TRY T HIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         // colorScheme: .fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'ClothisGood'),
//     );
//   }
// }
//
// //untuk membuat komponen yang dinamis, pengguna bisa berinteraksi dengan komponen dan tampilan akan langsung menyesuaikan, misal checkbox, textfield, radio dan slider. intinya yang memerlukan masukkan dari pengguna.
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   String user = 'Aly';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text("ClothisGood", 
//               style: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.w600,
//               letterSpacing: 2.0,
//               fontFamily: 'Roboto',
//               ),
//             ),
//             const Text("Let's find your style!", 
//               style: TextStyle(
//               fontSize: 10.0,
//               fontWeight: FontWeight.w400,
//               fontStyle: FontStyle.italic,
//               letterSpacing: 0,
//               fontFamily: 'Roboto',
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.white,
//         actions:[
//           const Text('Balikpapan, 30 C'),
//           IconButton(
//             icon: const Icon(Icons.cloud_circle, color: Colors.pink, size:40),
//             onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Account pressed!'))
//                 );
//               },
//           ),
//         ]
//       ),
//       body: Center(
//         child: Text(
//           'Hello, $user',
//           style: const TextStyle(
//             fontSize: 24,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//

import 'package:flutter/material.dart';
import 'package:android/splash_screen.dart';

void main() {
    runApp(const MyApp());
  }

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
          title: 'ClothisGood',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.pink)),
          home: SplashScreen(),
        );
      }
  }
















