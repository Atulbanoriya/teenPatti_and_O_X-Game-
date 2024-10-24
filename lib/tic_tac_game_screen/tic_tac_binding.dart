import 'package:get/get.dart';
import 'package:teen_patti/tic_tac_game_screen/tic_tac_controller.dart';

class TicTacBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TicTacController>(()=>TicTacController());
  }
}