// lib/Models/main_transfer_model.dart

class PaymentDetail {
  final String receiverAccountNumber;
  final String paymentAmount;

  PaymentDetail({
    required this.receiverAccountNumber,
    required this.paymentAmount,
  });

  Map<String, dynamic> toJson() {
    return {
      'receiverAccountNumber': receiverAccountNumber,
      'paymentAmount': paymentAmount,
    };
  }
}

class ReceiverDetail {
  final String userName;

  ReceiverDetail({
    required this.userName,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': userName,
    };
  }
}
