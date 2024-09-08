class PaymentDetail {
  final String receiverAccountNumber;
  final String paymentAmount;

  PaymentDetail({required this.receiverAccountNumber, required this.paymentAmount});
}

class ReceiverDetail {
  final String userName;

  ReceiverDetail({required this.userName});
}
