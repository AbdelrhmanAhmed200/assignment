// To parse this JSON data, do
//
//     final signupResponse = signupResponseFromJson(jsonString);

import 'dart:convert';

SignupResponse signupResponseFromJson(String str) => SignupResponse.fromJson(json.decode(str));

String signupResponseToJson(SignupResponse data) => json.encode(data.toJson());

class SignupResponse {
    bool success;
    Data data;

    SignupResponse({
        required this.success,
        required this.data,
    });

    factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
        success: json["success"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
    };
}

class Data {
    
    String username;
    String firstName;
    String lastName;
    String email;
    String language = 'en';
    

    Data({
        
        required this.username,
        required this.firstName,
        required this.lastName,
        required this.email,
        
        
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        
        username: json["username"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        
        
    );

    Map<String, dynamic> toJson() => {
        
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "language": language ,
        
    };
}
