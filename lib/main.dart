import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_shop/controllers/mainscreen_provider.dart';
import 'package:online_shop/controllers/product_provider.dart';
import 'package:online_shop/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';

import 'views/ui/cartpage.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MainScreenNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProductNotifier(),
    ),
    // ChangeNotifierProvider(
    //   create: (context) => FavoritesNotifier(),
    // ),
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        );
      },
    );
  }
}
// // entrypoint of the app
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Hive.initFlutter();

//   await Hive.openBox('cart_box');
//   await Hive.openBox('fav_box');
//   //method that initializes the app and run top level wigets
//   runApp(MultiProvider(providers: [
//     ChangeNotifierProvider(create: (context) => MainScreenNotifier()),
//     ChangeNotifierProvider(create: (context) => ProductNotifier()),
    
//   ], child: const MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // overall theme and app layout
//     return ScreenUtilInit(
//         designSize: const Size(375, 812),
//         minTextAdapt: true,
//         splitScreenMode: true,
//         builder: (context, child) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'dbestech',
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//             ),

//             // sets the homescreen of the app
//             home: MainScreen(),
//           );
//         });
//   }
// }
