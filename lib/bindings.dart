
import 'package:flutter_application_1/Controllers/Prefs_Controller.dart';
import 'package:get/get.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> PrefsController());
  }
  

}