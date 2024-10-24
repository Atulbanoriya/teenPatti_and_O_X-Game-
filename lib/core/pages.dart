import 'package:get/get.dart';
import 'package:teen_patti/core/routes.dart';
import 'package:teen_patti/tic_tac_game_screen/tic_tac_binding.dart';
import 'package:teen_patti/tic_tac_game_screen/tic_tac_view.dart';
import 'package:teen_patti/tin_patti_screen/tin_patti_binding.dart';
import 'package:teen_patti/tin_patti_screen/tin_patti_view.dart';

List<GetPage> allPages = <GetPage>[

  GetPage(
    name: Routes.ticTac,
      page:()=> const TicTacView(),
      binding: TicTacBinding(),
  ),

  GetPage(
    name: Routes.tinPatti,
    page:()=>  TinPattiGameScreen(),
    binding: TinPattiBinding(),
  ),

];
