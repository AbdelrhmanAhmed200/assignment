import 'dart:convert';


import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/Models/Sign_Up_Model.dart';

class SignUpController extends GetxController {
  

  Future<void> signUp(User user) async {
    const String apiUrl = 'https://ptechapp-5ab6d15ba23c.herokuapp.com/user/register';

   
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(user.toJson()),
      
      );
      
     
      if (response.statusCode == 200 && response.body!='''{"success":false}''' ) {
      
       
      } 
        
      }
    } 
    
  



