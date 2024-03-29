import 'package:pizza_repository/src/entities/macros_entity.dart';

class BillEntity {
  String billId;
  String amount;
  String phone_number;
  String address;
  BillEntity({
    required this.billId,
    required this.amount,
    required this.phone_number,
    required this.address,
  });
  Map<String, Object?> toDocument() {
    return {
      'billId': billId,
      'amount': amount,
      'phone_number': phone_number,
      'address': address,
    };
  }

  static BillEntity fromDocument(Map<String, dynamic> doc) {
    return BillEntity(
      billId: doc['billId'],
      amount: doc['amount'],
      phone_number: doc['phone_number'],
      address: doc['address'],
    );
  }
}
