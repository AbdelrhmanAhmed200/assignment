// userpay_model.dart
class Userpay {
  final String username;
  final String userAccountID;

  Userpay({required this.username, required this.userAccountID});

  factory Userpay.fromJson(Map<String, dynamic> json) {
    return Userpay(
      username: json['username'] ?? '',
      userAccountID: json['userAccountID'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'userAccountID': userAccountID,
    };
  }
}
