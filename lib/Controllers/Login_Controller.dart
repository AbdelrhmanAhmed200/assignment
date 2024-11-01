import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/Prefs_Controller.dart';
import 'package:flutter_application_1/Models/login_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Models/Login_Model.dart';

class LoginController extends GetxController {
  
  
   final ValueNotifier <bool> _isLoading = ValueNotifier(false);
  ValueNotifier<bool> get isLoading => _isLoading;


  PrefsController  prefsController = Get.find<PrefsController>();


 

  Future<void> login(UserLogin userLogin) async {
    const String apiUrl = 'https://ptechapp-5ab6d15ba23c.herokuapp.com/user/authenticate';
    _isLoading.value = false;
   
     

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(userLogin.toJson()),
      );

      

      // Handle response
      if (response.statusCode == 200 && response.body != '''{"success":false}''') {
      
        final data = LoginResponse.fromJson(jsonDecode(response.body));
        final userAccountID = data.data.userAccountId;
        _isLoading.value = true;

         prefsController.setuser(userAccountID);
          
      } 
    }
  }
  