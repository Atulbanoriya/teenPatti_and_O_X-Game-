import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:teen_patti/core/pages.dart';
import 'package:teen_patti/game_screen.dart';
import 'package:teen_patti/providers/crazy_eights_game_provider.dart';
import 'package:teen_patti/providers/thirty_one_game_provider.dart';
import 'core/routes.dart';


final navigatorKey = GlobalKey<NavigatorState>();
final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CrazyEightsGameProvider()),
        ChangeNotifierProvider(create: (_) => ThirtyOneGameProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tin Patii - Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: allPages,
      // initialRoute: Routes.tinPatti,
      home: const TicTacView(),
    );
  }
}
