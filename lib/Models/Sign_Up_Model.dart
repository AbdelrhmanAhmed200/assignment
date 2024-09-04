class User {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;
  final String language = 'en';

  User({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
    
    
  });

  Map<dynamic, dynamic> toJson() {
    return {
      'firstname': firstName,
      'lastname': lastName,
      'username': username,
      'email': email,
      'password': password,
      'language' : language,
    };
  }
   factory User.fromJson(Map<dynamic, dynamic> json) => User(
        
        username: json["username"],
        firstName: json["firstname"],
        lastName: json["lastname"],
        email: json["email"],
         password: json['password'],
        
        
    );
}