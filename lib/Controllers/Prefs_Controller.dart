import 'package:flutter_application_1/Models/Home_page_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsController extends GetxController {
late final  prefs ;
// بنادي عليها اتوماتيك
@override
void onInit() {
  _loadingPrefs();
 super.onInit();

}
_loadingPrefs () async{ 
  prefs = await SharedPreferences.getInstance();

}
String ? getuser(){
final User =   prefs?.getString('user');
return User;

}
setuser(String userid){
  prefs?.setString('user', userid);


}


}