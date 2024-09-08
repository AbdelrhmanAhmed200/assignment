class User {
  final String username;
  final double balance;

  User({required this.username, required this.balance});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      balance: json['balance'] is String 
          ? double.parse(json['balance']) 
          : json['balance'].toDouble(),  // Convert to double if it's not already
    );
  }
}
