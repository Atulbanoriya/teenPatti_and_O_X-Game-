import 'package:get/get.dart';
import 'package:teen_patti/tin_patti_screen/tin_patti_controller.dart';

class TinPattiBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TinPattiController>(()=>TinPattiController());
  }
}
